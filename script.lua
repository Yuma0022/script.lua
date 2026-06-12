local gg = gg
local statusMenu = "MENU_UTAMA" 
local menuTerakhir = "MENU_UTAMA" 
local baseAddress = nil
local namaRegion = ""
local target = nil
local offsetValue = nil
local runScript = true 

-- Konstanta ukuran Byte Hex (Ganti 15 untuk 16 Byte, ganti 31 jika ingin 32 Byte)
local UKURAN_HEX = 15 

local t_def = {
    {name = "BYTE",   flag = gg.TYPE_BYTE},
    {name = "WORD",   flag = gg.TYPE_WORD},
    {name = "DWORD",  flag = gg.TYPE_DWORD},
    {name = "QWORD",  flag = gg.TYPE_QWORD},
    {name = "FLOAT",  flag = gg.TYPE_FLOAT},
    {name = "DOUBLE", flag = gg.TYPE_DOUBLE}
}

-- Menu
function menuUtama()
    local regMenu = gg.choice({"Xa  r--xp ", "Cd  r--p ", "❌ Keluar Script"}, nil, "Pilih Region:")
    
    if regMenu == nil then 
        gg.setVisible(false)
        menuTerakhir = "MENU_UTAMA" 
        statusMenu = "MENUNGGU_KLIK" 
        return 
    end
    
    if regMenu == 3 then 
        gg.toast("Skrip Keluar!")
        runScript = false 
        os.exit() 
        return
    end 

    local lib = "libil2cpp.so"
    local libRanges = {} 
    local ranges = gg.getRangesList(lib)
    
    for _, r in ipairs(ranges) do
        if (regMenu == 1 and r.state == "Xa") or (regMenu == 2 and r.state == "Cd") then
            table.insert(libRanges, {start = r.start, state = r.state})
        end
    end

    if #libRanges == 0 then 
        gg.alert("Region tidak ditemukan!") 
        return 
    end

    if regMenu == 1 then
        baseAddress = libRanges[1].start
        namaRegion = "Xa"
        statusMenu = "INPUT_OFFSET" 
    elseif regMenu == 2 then
        namaRegion = "Cd"
        local menuList = {}
        for i, v in ipairs(libRanges) do 
            table.insert(menuList, string.format("[%d] %s: 0x%X", i, v.state, v.start)) 
        end
        local pilihBase = gg.choice(menuList, nil, "Pilih Base Address untuk Cd:")
        if not pilihBase then 
            gg.setVisible(false)
            menuTerakhir = "MENU_UTAMA"
            statusMenu = "MENUNGGU_KLIK" 
            return 
        end 
        baseAddress = libRanges[pilihBase].start
        statusMenu = "INPUT_OFFSET"
    end
end

-- input
function menuInputOffset()
    local input = gg.prompt({string.format("Masukkan Offset %s (Hex):", namaRegion)}, {"0x"}, {"text"})
    if not input then 
        gg.setVisible(false)
        menuTerakhir = "INPUT_OFFSET" 
        statusMenu = "MENUNGGU_KLIK" 
        return 
    end 
    
    offsetValue = tonumber(input[1]:gsub("0x", ""), 16)
    if not offsetValue then
        gg.alert("⚠️ Format Hex salah! Harap masukkan angka Hex yang benar.")
        statusMenu = "INPUT_OFFSET"
        return
    end

    target = baseAddress + offsetValue
    gg.setRanges(32768 | 4 | 16 | 1) 
    statusMenu = "MENU_AKSI" 
end

-- [3. MENU PILIHAN AKSI (LIHAT / EDIT)] --
function menuAksi()
    local t_read = {}
    for _, v in ipairs(t_def) do table.insert(t_read, {address = target, flags = v.flag}) end
    local res = gg.getValues(t_read)
    
    local action = gg.choice({"👀 Lihat & Salin", "✏️ Edit Lengkap", "⬅️ Kembali ke Menu Utama"}, nil, "Target: 0x" .. string.format("%X", target))
    
    if not action then 
        gg.setVisible(false)
        menuTerakhir = "MENU_AKSI" 
        statusMenu = "MENUNGGU_KLIK" 
        return 
    end 
    if action == 3 then 
        statusMenu = "MENU_UTAMA" 
        return 
    end 

    -- OPSI 1: LIHAT & SALIN
    if action == 1 then
        local teks = string.format("Base: 0x%X\nOffset: 0x%X\nTarget: 0x%X\n\n", baseAddress, offsetValue, target)
        local rawHex = ""
        for i=0, UKURAN_HEX do
            local b = gg.getValues({{address = target + i, flags = gg.TYPE_BYTE}})[1].value
            rawHex = rawHex .. string.format("%02X ", b & 0xFF)
        end
        for i, v in ipairs(t_def) do
            local val = (res[i] and res[i].value) and tostring(res[i].value) or "Error"
            teks = teks .. v.name .. ": " .. val .. "\n"
        end
        teks = teks .. string.format("\nRaw Hex (%d Bytes):\n", UKURAN_HEX + 1) .. rawHex
        
        if gg.alert(teks, "Salin", "OK") == 1 then gg.copyText(teks); gg.toast("Disalin!") end
        statusMenu = "MENU_AKSI"

    -- OPSI 2: EDIT LENGKAP
    elseif action == 2 then
        local labels = {"BYTE:", "WORD:", "DWORD:", "QWORD:", "FLOAT:", "DOUBLE:", string.format("PATCH HEX (%d Bytes):", UKURAN_HEX + 1)}
        local values = {}
        for i=1, 6 do table.insert(values, (res[i] and res[i].value) and res[i].value or 0) end
        
        local currentHex = ""
        for i=0, UKURAN_HEX do
            local b = gg.getValues({{address = target + i, flags = gg.TYPE_BYTE}})[1].value
            currentHex = currentHex .. string.format("%02X ", b & 0xFF)
        end
        local cleanCurrentHex = currentHex:sub(1, -2)
        table.insert(values, cleanCurrentHex)

        local edit = gg.prompt(labels, values, {"number", "number", "number", "number", "number", "number", "text"})
        
        if not edit then
            gg.setVisible(false)
            menuTerakhir = "MENU_AKSI" 
            statusMenu = "MENUNGGU_KLIK" 
            return
        end
        
        if edit then
            local userHex = edit[7]:gsub("%s+$", "") 
            
            if userHex ~= cleanCurrentHex and userHex ~= "" then
                local tHex, off = {}, 0
                for h in string.gmatch(userHex, "%S%S") do
                    table.insert(tHex, {address = target + off, flags = gg.TYPE_BYTE, value = tonumber(h, 16), freeze = true})
                    off = off + 1
                end
                gg.setValues(tHex)
                gg.sleep(50)
                for _, v in ipairs(tHex) do v.freeze = false end
                gg.setValues(tHex)
            else
                local tEdit = {}
                for i=1, 6 do
                    if tonumber(edit[i]) ~= tonumber(res[i].value) then
                        table.insert(tEdit, {address = target, flags = t_def[i].flag, value = edit[i], freeze = true})
                    end
                end
                if #tEdit > 0 then
                    gg.setValues(tEdit)
                    gg.sleep(50)
                    for _, v in ipairs(tEdit) do v.freeze = false end
                    gg.setValues(tEdit)
                end
            end
            gg.toast("Perubahan Berhasil!")
        end
        statusMenu = "MENU_AKSI" 
    end
end

while runScript do
    if statusMenu == "MENUNGGU_KLIK" then
        gg.toast("XZ") 
        
        if gg.isVisible(true) then
            gg.setVisible(false) 
            statusMenu = menuTerakhir 
        end
    else
        gg.setVisible(false) 
        
        if statusMenu == "MENU_UTAMA" then
            pcall(menuUtama)
        elseif statusMenu == "INPUT_OFFSET" then
            pcall(menuInputOffset)
        elseif statusMenu == "MENU_AKSI" then
            pcall(menuAksi)
        end
    end
    gg.sleep(100)
end

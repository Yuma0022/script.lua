local gg = gg

-- =========================================================
-- SCRIPT MULTI AUTO DETECT GAME BY EXXI MODS
-- OWNER IKY
-- METHODS LIB OFFSET DUMP
-- BETA VERSION 
-- INDONESIA
-- FACEBOOK : https://www.facebook.com/afandi.setroy
-- TELEGRAM : t.me/Exxi_Mods
-- Menerima jasa buat script gg atau mod apk ESP,FULL BRUTAL DLL OFF/ON TERGANTUNG GAME

-- =========================================================
local info = gg.getTargetInfo()
if info == nil then
    gg.alert("❌ Silakan pilih/buka game terlebih dahulu di GameGuardian!")
    os.exit()
end

local packageName = info.packageName
local title = info.label
local gameVersion = info.versionName 


local offsetCoin, offsetDiamond
local offsetFloat1, offsetFloat2, offsetFloat3, offsetFloat4, offsetFloat5
local offsetFloat6, offsetFloat7, offsetFloat8, offsetFloat9, offsetFloat10
local offsetFloat11, offsetFloat12, offsetFloat13, offsetFloat14
local hexCoin, hexDiamond

local offsetFreeShop, FalseEdit64, TrueEdit64
local offsetMaxAll, MaxAll
local offsetunlimitedJump
local OffsetLaneDuration
local offsetGodMode1
local offsetGodMode2


local gameMode = ""


local menuList = {}
local checkList = {}

    FalseEdit64 = "00 00 80 D2 C0 03 5F D6" --false 64bit 
    TrueEdit64 = "20 00 80 D2 C0 03 5F D6" --true 64bit
    
    FalseEdit32 = "01 00 00 E3 1E FF 2F E1" --false 32bit 
    TrueEdit32 = "00 00 00 E3 1E FF 2F E1" --true 32bit


if packageName == "com.kiloo.subwaysurf" then  -- ubah dengan game kalian 
    local versiWajib = "3.63.0"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript Subway Surfers ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "SUBWAY"
                                            
    MaxAll = "E0 CF 92 D2 00 13 A0 F2 C0 03 5F D6" --int
        
    
    offsetFreeShop = 0x20A2434 --Offset free shop 
    offsetMaxAll = 0x20FA84C --Offset Max all
    offsetunlimitedJump = 0x3323BC --Offset Unlimited jump            
    OffsetLaneDuration = 0x333160 --lane
    offsetGodMode1 = 0x335590
    offsetGodMode2 = 0x335BC8
         
    
  --  offsetFloat3 = 0x333168
  --  offsetFloat4 = 0x33316C
  --  offsetFloat5 = 0x333170
  --  offsetFloat6 = 0x333174 
  --  offsetFloat7 = 0x333178 
  --  offsetFloat8 = 0x33317C
  --  offsetFloat9 = 0x333180 
  --  offsetFloat10 = 0x333184
  --  offsetFloat11 = 0x333188
  --  offsetFloat12 = 0x33318C 
  --  offsetFloat13 = 0x333190
  --  offsetFloat14 = 0x333194

    menuList = {
        "Subway: Free Shop",
        "Subway: Max All", 
        "Subway: Unlimited Jump", 
        "Subway: Lane Duration",
        "Subway: God Mode",
        "Subway: Extample", 
        "Subway: Extample", 
        "Subway: Extample", 
        "Subway: Extample", 
        "Subway: Extample",
        "Subway: Extample",
        "Subway: Extample", 
        "Subway: Extample",
        "Subway: Extample",
        "❌ EXIT"
    }


elseif packageName == "com.fungames.sniper3d" then -- ubah dengan game kalian 
    local versiWajib = "6.35.0"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript Sniper 3D ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "SNIPER3D"
    offsetCoin = 0x123456 hexCoin = "00 00 A0 E3 1E FF 2F E1"
    
    offsetFloat1 = 0x500001 --template
    offsetFloat2 = 0x500002 --template
    offsetFloat3 = 0x500003 --template
    offsetFloat4 = 0x500004 --template
    offsetFloat5 = 0x500005 --template
    offsetFloat6 = 0x500006 --template
    offsetFloat7 = 0x500007 --template
    offsetFloat8 = 0x500008 --template 
    offsetFloat9 = 0x500009 --template
    offsetFloat10 = 0x500010 --template
    offsetFloat11 = 0x500011 --template
    offsetFloat12 = 0x500012 --template
    offsetFloat13 = 0x500013 --template 
    offsetFloat14 = 0x500014 --template
    menuList = {
        "Sniper3D: Unlimited Gold", 
        "Sniper3D: Instant Kill", 
        "Sniper3D: No Recoil", 
        "Sniper3D: Rapid Fire", 
        "Sniper3D: Unlimited Ammo",
        "Sniper3D: Wallhack Vision", 
        "Sniper3D: Max Range / No Drop", 
        "Sniper3D: Auto Aim Bot", 
        "Sniper3D: Silent Aim", 
        "Sniper3D: Speed Hack Movement",
        "Sniper3D: Unlock All Weapons", 
        "Sniper3D: Fire Rate Max", 
        "Sniper3D: Anti-Ban Protection", 
        "Sniper3D: Zoom Hack x100", 
        "❌ EXIT"
    }


elseif packageName == "com.kitkagames.fallbuddies" then  -- ubah dengan game kalian 
    local versiWajib = "0.68"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript Stumble Guys ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "STUMBLE"
    offsetFloat1 = 0x500001 --template
    offsetFloat2 = 0x500002 --template
    offsetFloat3 = 0x500003 --template
    offsetFloat4 = 0x500004 --template
    offsetFloat5 = 0x500005 --template
    offsetFloat6 = 0x500006 --template
    offsetFloat7 = 0x500007 --template
    offsetFloat8 = 0x500008 --template 
    offsetFloat9 = 0x500009 --template
    offsetFloat10 = 0x500010 --template
    offsetFloat11 = 0x500011 --template
    offsetFloat12 = 0x500012 --template
    offsetFloat13 = 0x500013 --template 
    offsetFloat14 = 0x500014 --template
    menuList = {
        "Stumble: Speed Hack", 
        "Stumble: Fly / High Jump", 
        "Stumble: Unlock All Skins", 
        "Stumble: Unlock Emotes", 
        "Stumble: Unlock Animations",
        "Stumble: No Footsteps", 
        "Stumble: Instant Dash", 
        "Stumble: Anti-Knockback", 
        "Stumble: Gravity Low", 
        "Stumble: Auto Win Map",
        "Stumble: Teleport to Finish", 
        "Stumble: Freeze Time", 
        "Stumble: Giant Size", 
        "Stumble: Tiny Player", 
        "❌ EXIT"
    }


elseif packageName == "com.dts.freefireth" then  -- ubah dengan game kalian 
    local versiWajib = "1.104.1"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript Free Fire ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "FF"
    offsetFloat1 = 0x500001 --template
    offsetFloat2 = 0x500002 --template
    offsetFloat3 = 0x500003 --template
    offsetFloat4 = 0x500004 --template
    offsetFloat5 = 0x500005 --template
    offsetFloat6 = 0x500006 --template
    offsetFloat7 = 0x500007 --template
    offsetFloat8 = 0x500008 --template 
    offsetFloat9 = 0x500009 --template
    offsetFloat10 = 0x500010 --template
    offsetFloat11 = 0x500011 --template
    offsetFloat12 = 0x500012 --template
    offsetFloat13 = 0x500013 --template 
    offsetFloat14 = 0x500014 --template
    menuList = {
        "FF: Auto Headshot", 
        "FF: Antenna View 100m", 
        "FF: Aim Lock Target", 
        "FF: Wallhack Color", 
        "FF: No Recoil Weapon",
        "FF: High Damage x2", 
        "FF: Speed Run x3", 
        "FF: Teleport Car", 
        "FF: Medkit Run", 
        "FF: ESP Line Player",
        "FF: Night Mode Map", 
        "FF: Aim Assist Pro", 
        "FF: Fast Reload", 
        "FF: Ghost Mode Walk", 
        "❌ EXIT"
    }


elseif packageName == "com.mobile.legends" then  -- ubah dengan game kalian 
    local versiWajib = "1.8.78"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript Mobile Legends ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "MLBB"  -- ubah dengan game kalian 
    offsetFloat1 = 0x500001 --template
    offsetFloat2 = 0x500002 --template
    offsetFloat3 = 0x500003 --template
    offsetFloat4 = 0x500004 --template
    offsetFloat5 = 0x500005 --template
    offsetFloat6 = 0x500006 --template
    offsetFloat7 = 0x500007 --template
    offsetFloat8 = 0x500008 --template 
    offsetFloat9 = 0x500009 --template
    offsetFloat10 = 0x500010 --template
    offsetFloat11 = 0x500011 --template
    offsetFloat12 = 0x500012 --template
    offsetFloat13 = 0x500013 --template 
    offsetFloat14 = 0x500014 --template
    menuList = {
        "ML: Map Hack Drone x2", 
        "ML: Map Hack Drone x4", 
        "ML: Unlock All Skins", 
        "ML: Info Room / Enemy Icon", 
        "ML: No Cooldown Skill",
        "ML: Fast Farming Multiplier", 
        "ML: Attack Speed Max", 
        "ML: Anti-Lag Server", 
        "ML: Gold Hack Virtual", 
        "ML: Auto Aim Skillshot",
        "ML: One Hit Jungle Monster", 
        "ML: Clear Cache Log", 
        "ML: Bypass Security Anticheat", 
        "ML: Frame Rate Boost 120fps", 
        "❌ EXIT"
    }


elseif packageName == "com.tencent.ig" then  -- ubah dengan game kalian 
    local versiWajib = "3.1.0"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript PUBG Mobile ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "PUBGM"
    offsetFloat1 = 0x500001 --template
    offsetFloat2 = 0x500002 --template
    offsetFloat3 = 0x500003 --template
    offsetFloat4 = 0x500004 --template
    offsetFloat5 = 0x500005 --template
    offsetFloat6 = 0x500006 --template
    offsetFloat7 = 0x500007 --template
    offsetFloat8 = 0x500008 --template 
    offsetFloat9 = 0x500009 --template
    offsetFloat10 = 0x500010 --template
    offsetFloat11 = 0x500011 --template
    offsetFloat12 = 0x500012 --template
    offsetFloat13 = 0x500013 --template 
    offsetFloat14 = 0x500014 --template
    menuList = {
        "PUBG: No Recoil 100%", 
        "PUBG: Less Recoil 50%", 
        "PUBG: iPad View Horizon", 
        "PUBG: White Body Enemy", 
        "PUBG: Antenna Head",
        "PUBG: Black Sky Mode", 
        "PUBG: Magic Bullet Target", 
        "PUBG: Speed Car Turbo", 
        "PUBG: High Jump Player", 
        "PUBG: No Fog Map",
        "PUBG: No Grass Erangel", 
        "PUBG: Sound Loud Footsteps", 
        "PUBG: Fast Crawl / Prone Speed", 
        "PUBG: Anti-Shake Camera", 
        "❌ EXIT"
    }


elseif packageName == "com.roblox.client" then -- ubah dengan game kalian 
    local versiWajib = "2.620"
    if gameVersion ~= versiWajib then
        gg.alert("❌ VERSI GAME SALAH!\n\nScript Roblox ini wajib versi: " .. versiWajib .. "\nVersi game kamu saat ini: " .. gameVersion)
        os.exit()
    end
    gameMode = "ROBLOX"
    offsetFloat1 = 0x500001 --template
    offsetFloat2 = 0x500002 --template
    offsetFloat3 = 0x500003 --template
    offsetFloat4 = 0x500004 --template
    offsetFloat5 = 0x500005 --template
    offsetFloat6 = 0x500006 --template
    offsetFloat7 = 0x500007 --template
    offsetFloat8 = 0x500008 --template 
    offsetFloat9 = 0x500009 --template
    offsetFloat10 = 0x500010 --template
    offsetFloat11 = 0x500011 --template
    offsetFloat12 = 0x500012 --template
    offsetFloat13 = 0x500013 --template 
    offsetFloat14 = 0x500014 --template

    menuList = {
        "Roblox: Wallhack Fly", 
        "Roblox: Super Jump Pro", 
        "Roblox: Gravity Zero", 
        "Roblox: Speed Run Max", 
        "Roblox: Air Walk",
        "Roblox: Teleport To Spawn", 
        "Roblox: Bunny Hop", 
        "Roblox: Freeze All Players", 
        "Roblox: Infinite Jump", 
        "Roblox: Ragdoll Exploit",
        "Roblox: No Clip Walls", 
        "Roblox: God Mode Armor", 
        "Roblox: Click Teleport", 
        "Roblox: Snake Mode Multiplier", 
        "❌ EXIT"
    }

else
    gg.alert("⚠️ Game: " .. title .. " (" .. packageName .. ") belum didukung dalam script ini!")
    os.exit()
end


for i = 1, #menuList do checkList[i] = false end


local lib = "libil2cpp.so"
local bases, index, status = {}, 0, 0
local ranges = gg.getRangesList(lib)
if #ranges == 0 then status = 2 goto SPLIT end
for _, r in ipairs(ranges) do if r.state == "Xa" then index = index + 1 bases[index] = r.start status = 1 end end
::SPLIT::
if status == 2 then
    local found, sizes, count = false, {}, 0
    ranges = gg.getRangesList()
    for _, r in ipairs(ranges) do if r.state == "Xa" and r.name:match("split_config") then found = true end end
    if not found then print("No split lib."); gg.setVisible(true); os.exit() end
    for _, r in ipairs(ranges) do if r.state == "Xa" then count = count + 1 sizes[count] = r["end"] - r.start end end
    if count > 0 then
        local max = math.max(table.unpack(sizes))
        for _, r in ipairs(ranges) do if r.state == "Xa" and (r["end"] - r.start) == max then index = index + 1 bases[index] = r.start status = 1 end end
    end
end
if status ~= 1 then print("Lib not found."); gg.setVisible(true); os.exit() end


local orig = {}
function rekamDataAsli(offset, panjangHex)
    if not orig[offset] then
        local base = bases[index] local backup, totalByte = {}, 0
        for h in string.gmatch(panjangHex, "%S%S") do
            table.insert(backup, {address = base + offset + totalByte, flags = gg.TYPE_BYTE})
            totalByte = totalByte + 1
        end
        orig[offset] = gg.getValues(backup)
    end
end
function rekamDataAsliFloat(offset)
    if not orig[offset] then
        local base = bases[index] local addr = base + offset
        orig[offset] = gg.getValues({{address = addr, flags = gg.TYPE_DWORD}, {address = addr + 0x4, flags = gg.TYPE_DWORD}, {address = addr + 0x8, flags = gg.TYPE_DWORD}})
    end
end
function reset(off) if orig[off] then gg.setValues(orig[off]) gg.toast("🔄 Hack Disabled [✓]") gg.sleep(500) end end


function setHex(offset, hex)
    local base = bases[index] local patch, total = {}, 0
    for h in string.gmatch(hex, "%S%S") do table.insert(patch, {address = base + offset + total, flags = gg.TYPE_BYTE, value = h .. "r"}) total = total + 1 end
    gg.setValues(patch)
end
local function FloatToHexDword(num)
    if num == 0 then return "h00000000" end
    local sign = 0 if num < 0 then sign = 1 num = -num end
    local mantissa, exponent = math.frexp(num)
    if exponent == 0 and mantissa == 0 then exponent = 0 mantissa = 0 else mantissa = mantissa * 2 - 1 exponent = exponent + 126 end
    return string.format("h%08X", sign * math.pow(2, 31) + exponent * math.pow(2, 23) + math.floor(mantissa * math.pow(2, 23) + 0.5))
end
function setFloatDinamis(offset, angkaInput)
    local base = bases[index] 
    local addr = base + offset 
    local hexValue = FloatToHexDword(tonumber(angkaInput))
    
    -- Ganti gg.TYPE_DWORD menjadi angka 4 langsung biar gak nyari variabel string lagi
    gg.setValues({
        {address = addr, flags = 4, value = "h8000001C"}, 
        {address = addr + 0x4, flags = 4, value = "hC0035FD6"}, 
        {address = addr + 0x8, flags = 4, value = hexValue}
    })
end


function RunHackHex(off, hx, msg) rekamDataAsli(off, hx) setHex(off, hx) gg.toast(msg .. " [ON]") return true end
function RunHackFloat(off, val, msg) rekamDataAsliFloat(off) setFloatDinamis(off, val) gg.toast(msg .. " [ON]") return true end


function menu()
    local tsu = gg.multiChoice(menuList, checkList, "━━━━[ " .. title .. " v" .. gameVersion .. " ]━━━━")
    if tsu == nil then return end


    if gameMode == "SUBWAY" then
        if tsu[1] ~= checkList[1] then if tsu[1] == true then checkList[1] = RunHackHex(offsetFreeShop, FalseEdit64, "Subway Coin") else checkList[1] = false reset(offsetFreeShop) end end
        if tsu[2] ~= checkList[2] then if tsu[2] == true then checkList[2] = RunHackHex(offsetMaxAll, MaxAll, "Subway Diamond") else checkList[2] = false reset(offsetMaxAll) end end
        if tsu[3] ~= checkList[3] then if tsu[3] == true then checkList[3] = RunHackHex(offsetunlimitedJump, TrueEdit64, "Unlimited jump") else checkList[3] = false reset(offsetunlimitedJump) end end        
        if tsu[4] ~= checkList[4] then if tsu[4] == true then checkList[4] = RunHackFloat(OffsetLaneDuration, -10, "Lane Duration") else checkList[4] = false reset(OffsetLaneDuration) end end        
        if tsu[5] ~= checkList[5] then if tsu[5] == true then checkList[5] = RunHackHex(offsetGodMode1, FalseEdit64, "God Mode") else checkList[5] = false reset(offsetGodMode1) end end
        if tsu[5] ~= checkList[5] then if tsu[5] == true then checkList[5] = RunHackHex(offsetGodMode2, FalseEdit64, "") else checkList[5] = false reset(offsetGodMode2) end end
        
        if tsu[6] ~= checkList[6] then if tsu[6] == true then checkList[6] = RunHackFloat(offsetFloat4, 1, "template") else checkList[6] = false reset(offsetFloat4) end end
        if tsu[7] ~= checkList[7] then if tsu[7] == true then checkList[7] = RunHackFloat(offsetFloat5, 0.1, "No Gravity") else checkList[7] = false reset(offsetFloat5) end end
        if tsu[8] ~= checkList[8] then if tsu[8] == true then checkList[8] = RunHackFloat(offsetFloat6, 999, "Auto Win") else checkList[8] = false reset(offsetFloat6) end end
        if tsu[9] ~= checkList[9] then if tsu[9] == true then checkList[9] = RunHackFloat(offsetFloat7, 200, "Multiplier x200") else checkList[9] = false reset(offsetFloat7) end end
        if tsu[10] ~= checkList[10] then if tsu[10] == true then checkList[10] = RunHackFloat(offsetFloat8, 500, "Instant Jetpack") else checkList[10] = false reset(offsetFloat8) end end
        if tsu[11] ~= checkList[11] then if tsu[11] == true then checkList[11] = RunHackFloat(offsetFloat9, 1000, "Infinite Hoverboard") else checkList[11] = false reset(offsetFloat9) end end
        if tsu[12] ~= checkList[12] then if tsu[12] == true then checkList[12] = RunHackFloat(offsetFloat10, 0, "No Obstacles") else checkList[12] = false reset(offsetFloat10) end end
        if tsu[13] ~= checkList[13] then if tsu[13] == true then checkList[13] = RunHackFloat(offsetFloat11, 99, "Magnet Range") else checkList[13] = false reset(offsetFloat11) end end
        if tsu[14] ~= checkList[14] then if tsu[14] == true then checkList[14] = RunHackFloat(offsetFloat12, 999, "Score Hack") else checkList[14] = false reset(offsetFloat12) end end


    elseif gameMode == "SNIPER3D" then
        if tsu[1] ~= checkList[1] then if tsu[1] == true then checkList[1] = RunHackHex(offsetCoin, hexCoin, "Sniper Gold") else checkList[1] = false reset(offsetCoin) end end
        if tsu[2] ~= checkList[2] then if tsu[2] == true then checkList[2] = RunHackFloat(offsetFloat1, 99999, "Instant Kill") else checkList[2] = false reset(offsetFloat1) end end
        if tsu[3] ~= checkList[3] then if tsu[3] == true then checkList[3] = RunHackFloat(offsetFloat2, 0, "No Recoil") else checkList[3] = false reset(offsetFloat2) end end
        if tsu[4] ~= checkList[4] then if tsu[4] == true then checkList[4] = RunHackFloat(offsetFloat3, 100, "Rapid Fire") else checkList[4] = false reset(offsetFloat3) end end
        if tsu[5] ~= checkList[5] then if tsu[5] == true then checkList[5] = RunHackFloat(offsetFloat4, 999, "Infinite Ammo") else checkList[5] = false reset(offsetFloat4) end end
        if tsu[6] ~= checkList[6] then if tsu[6] == true then checkList[6] = RunHackFloat(offsetFloat5, 1, "Wallhack Vision") else checkList[6] = false reset(offsetFloat5) end end
        if tsu[7] ~= checkList[7] then if tsu[7] == true then checkList[7] = RunHackFloat(offsetFloat6, 5000, "Max Range") else checkList[7] = false reset(offsetFloat6) end end
        if tsu[8] ~= checkList[8] then if tsu[8] == true then checkList[8] = RunHackFloat(offsetFloat7, 1, "Auto Aim Bot") else checkList[8] = false reset(offsetFloat7) end end
        if tsu[9] ~= checkList[9] then if tsu[9] == true then checkList[9] = RunHackFloat(offsetFloat8, 2, "Silent Aim") else checkList[9] = false reset(offsetFloat8) end end
        if tsu[10] ~= checkList[10] then if tsu[10] == true then checkList[10] = RunHackFloat(offsetFloat9, 15, "Speed Hack Move") else checkList[10] = false reset(offsetFloat9) end end
        if tsu[11] ~= checkList[11] then if tsu[11] == true then checkList[11] = RunHackFloat(offsetFloat10, 1, "Unlock All Weapon") else checkList[1        return
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

--- Quest 2
--- Analize Runes

-- Lectura archivo:
local lineas = {}
for l in  io.lines("everybody_codes_e2024_q02_p1.txt") do
    lineas[ #lineas + 1] = l    -- lineas[2] = empty line
end
local runes = {}
for w in string.gmatch(lineas[1], "%a+") do
    runes[ #runes+1 ] = w     --runes[1] = "WORDS" no se usa => discarded
end

-- Analisis:
local count = 0
for i=2,#runes do
    for w in string.gmatch(lineas[3], runes[i]) do
        count = count + 1
    end
end


-- Restultado:
print("Count= " .. count)
--local runes = string.match(lineas[1],"%a+:(%a+)")




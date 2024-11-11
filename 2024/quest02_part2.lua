--- Quest 2
--- Analize Runes

-- Lectura archivo:
local lineas = {}
local filename = "everybody_codes_e2024_q02_p2.txt"
--local filename = "delme.txt"
for l in  io.lines(filename) do
    lineas[ #lineas + 1] = l    -- lineas[2] = empty line
end
local runes = {}
for w in string.gmatch(lineas[1], "%a+") do
    if not (w == "WORDS") then
        runes[ #runes+1 ] = w     -- "WORDS" no se usa => discarded
    end
end

-- Analisis:
local count = 0

for l=3,#lineas do 
    local cadena = lineas[l]
    local mascara = string.rep("_",#cadena)  -- Mascara "bitmask"

    for i=1,#runes do     
        local r = runes[i]   
        
        for z = 1,2 do
            if z == 2 then
                r = string.reverse(r)
            end

            local fin = false
            local last = 0
            while  not fin do            
                local k,kk = string.find(cadena,r, last)                
                if k then
                    mascara = string.sub(mascara,1,k-1) .. string.rep("x",#r) .. string.sub(mascara,kk+1,#mascara)
                    last = k +1
                else
                    fin = true
                end                    
            end            
        end
    end
        
    for s=1,#mascara do
        if string.sub(mascara,s,s) == "x" then
            count = count + 1
        end
    end

end

-- Restultado:
print("Count= " .. count)    -- solucion = 5319




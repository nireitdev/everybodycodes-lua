--- Quest 1 - parte 1
--- ABBAC
--- No potions are needed for the first A (Ancient Ant).
--- 1 potion is needed for the first B (Badass Beetle).
--- 1 potion is needed for the second B (Badass Beetle).
--- No potions are needed for the next A (Ancient Ant).
--- 3 potions are needed for the last monster, C (Creepy Cockroach).

local file = io.open("everybody_codes_e2024_q01_p2.txt","r")
local linea = file:read("*a")
file:close()
--- local linea = "AxBCDDCAxD"
local suma = 0

for i=1,#linea,2 do    
    local pair = string.sub(linea,i,i+1)

    if not (pair == "xx") then  
        for j = 1,2 do
            local ch = string.sub(pair,j,j)
            if ch == "A" then
                suma = suma + 1
            end
            if ch == "B" then
                suma = suma + 2
            end
            if ch == "C" then
                suma = suma + 4
            end
            if ch == "D" then
                suma = suma + 6
            end
            --- desafecto el +1
            if ch == "x" then
                suma = suma - 1
            end
        end
    end

end

print("Total suma= " .. suma .. "\n")


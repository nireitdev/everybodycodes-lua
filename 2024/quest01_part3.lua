--- Quest 1 - parte 1
--- ABBAC
--- No potions are needed for the first A (Ancient Ant).
--- 1 potion is needed for the first B (Badass Beetle).
--- 1 potion is needed for the second B (Badass Beetle).
--- No potions are needed for the next A (Ancient Ant).
--- 3 potions are needed for the last monster, C (Creepy Cockroach).

local file = io.open("everybody_codes_e2024_q01_p3.txt","r")
local linea = file:read("*a")
file:close()
--local linea = "xBxAAABCDxCC"
local suma = 0

for i=1,#linea,3 do    
    local pair = string.sub(linea,i,i+2)
    
    local countX = 0
    for j = 1,3 do
        if string.sub(pair,j,j) == "x" then
            countX = countX + 1
        end
    end
    if countX == 0 then
        suma = suma + 6
    end
    if countX == 1 then
        suma = suma + 2
    end
    -- caso countX == 2 y ==3  => + 0

    for j = 1,3 do
        local ch = string.sub(pair,j,j)
        if ch == "A" then
            suma = suma + 0
        end
        if ch == "B" then
            suma = suma + 1
        end
        if ch == "C" then
            suma = suma + 3
        end
        if ch == "D" then
            suma = suma + 5
        end
    end
    

end

print("Total suma= " .. suma .. "\n")


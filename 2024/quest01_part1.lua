--- Quest 1 - parte 1
--- ABBAC
--- No potions are needed for the first A (Ancient Ant).
--- 1 potion is needed for the first B (Badass Beetle).
--- 1 potion is needed for the second B (Badass Beetle).
--- No potions are needed for the next A (Ancient Ant).
--- 3 potions are needed for the last monster, C (Creepy Cockroach).

local file = io.open("everybody_codes_e2024_q01_p1.txt","r")
local linea = file:read("*a")
file:close()

local suma = 0

for i=1,#linea do    
    local ch = string.sub(linea,i,i)
    if ch == "B" then
        suma = suma + 1
    end
    if ch == "C" then
        suma = suma + 3
    end
end

print("Total suma= " .. suma .. "\n")


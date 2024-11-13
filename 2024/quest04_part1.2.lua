--- Quest 4: Royal Smith's Puzzl

--- 
--- 
---  Programa principal 
--- 

-- Lectura archivo:

-- local filename = "everybody_codes_e2024_q04_p1.txt"
local filename = "everybody_codes_e2024_q04_p2.txt"
-- local filename = "delme.txt"


local nails = {}
for l in  io.lines(filename) do
    nails[ #nails + 1] = tonumber(l)
end

local min_h = math.min(table.unpack(nails))

-- Resultado:
local total = 0
for k=1,#nails do
    total = total + nails[k] - min_h
end

print("Total= " .. total)    -- solucion P1= 75  P2=786784




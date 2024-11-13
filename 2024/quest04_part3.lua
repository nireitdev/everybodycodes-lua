--- Quest 4: Royal Smith's Puzzl
--- Parte 3: Calculo de la Mediana  y tambien con fuerza bruta (aprox 3 mins)

-- Lectura archivo:
local filename = "everybody_codes_e2024_q04_p3.txt"
-- local filename = "delme.txt"


local nails = {}
for l in  io.lines(filename) do
    nails[ #nails + 1] = tonumber(l)
end

--- Utilizando mediana como valor optimo de nivelacion:
table.sort(nails)           --- importante ordenar
local mediana = nails[#nails/2]
local suma = 0
for k=1,#nails do
    suma = suma + math.abs(nails[k] - mediana)    
end
print("Valor optimo de nivel= ", mediana)
print("Total de golpes = ", suma)


--- Metodo por fuerza bruta:
local min_h = math.min(table.unpack(nails))
local max_h = math.max(table.unpack(nails))

local total,optimal_h = math.maxinteger, 0

for i=min_h,max_h do        
    local sum = 0
    for j=1,#nails do
        sum = sum + math.abs(nails[j] - i )
    end
    
    if sum < total then
        optimal_h = i
        total = sum
    end
end
print("Valor optimo de nivel (fuerza bruta)= ", optimal_h)     -- solucion 127427596
print("Total de golpes (fuerza bruta) = ", total)              -- solucion 27489788




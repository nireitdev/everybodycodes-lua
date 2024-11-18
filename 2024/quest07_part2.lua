--- Quest 7: Not Fast but Furious
--- Part 1

--- 
--  Funciones
--

local arbol = {}


--- 
---  Programa principal 
--- 

local race = {}
local results = {}
TOTAL_LOOPS = 10


local tracker = [[
S-=++=-==++=++=-=+=-=+=+=--=-=++=-==++=-+=-=+=-=+=+=++=-+==++=++=-=-=--
-                                                                     -
=                                                                     =
+                                                                     +
=                                                                     +
+                                                                     =
=                                                                     =
-                                                                     -
--==++++==+=+++-=+=-=+=-+-=+-=+-=+=-=+=--=+++=++=+++==++==--=+=++==+++-
]]

--test:
-- local tracker = [[
-- S+===
-- -   +
-- =+=-+
-- ]]

-- Lectura archivo:

local filename = "everybody_codes_e2024_q07_p2.txt"
-- local filename = "test.txt"


for l in  io.lines(filename) do
    for w in string.gmatch(l, ".+") do
        local chariot, speeds = string.match(l,"(.+):(.+)")
        race[chariot] = {}
        for w in string.gmatch(speeds,"[-+=]") do
            table.insert(race[chariot],w)
        end        
    end    
end

-- Leer tracker: serializo la figura del tracker
local lineas = {}
local serial_tracker = {}
for w in string.gmatch(tracker,'[^\n]*') do 
    if #w > 0 then 
        table.insert(lineas,w) 
    end
end
local largo = #lineas[1]
local total = #lineas
-- Top:
for i=2, largo do        -- i=2 => "S" queda al final serial_tracker
    table.insert( serial_tracker, string.sub( lineas[1], i,i ))
end
-- Right:
for i=2, total-1 do 
    table.insert( serial_tracker, string.sub( lineas[i], largo, largo ) ) 
end
-- Bottom:
for i=largo, 1, -1 do 
    table.insert( serial_tracker, string.sub( lineas[total], i, i ) )
end
-- Right:
for i=total-1, 1,-1 do   -- i=1 => "S" queda al final del serial_tracker
    table.insert( serial_tracker, string.sub( lineas[i], 1,1 ) ) 
end


for k,v in pairs(race)  do      
    local sp = 10   
    results[k] = 0
    local count = 0                 -- charriot circular
    for loop=1,TOTAL_LOOPS do
        for nseg=1,#serial_tracker do
            if serial_tracker[nseg] == "+" then
                sp = sp + 1
            end
            if serial_tracker[nseg] == "-" then
                sp = sp - 1        
            end   
            if (serial_tracker[nseg] == "=") or (serial_tracker[nseg] == "S") then                   
                local i = count % #v  + 1   -- por cada velocidad
                if v[i] == "+" then
                    sp = sp + 1
                end
                if v[i] == "-" then
                        sp = sp - 1        
                end    
            end
            count = count + 1
            results[k] = results[k] + sp        --guardo el total por chariot
        end
        
    end
    print(k, results[k])
    
end

-- Resultado:
-- Sort:
local tmp = {}
for k in pairs(results) do table.insert(tmp,k) end
table.sort(tmp, function (a,b) return results[a]>results[b] end ) 

local str = ""
for _,k in pairs(tmp) do
    str = str .. k
end

print()
print("Solucion Carrera = " .. str)      --- Resultado: FHAGBJKDI
print()


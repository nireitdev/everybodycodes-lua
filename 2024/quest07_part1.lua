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
TOTAL_SEGM = 10

-- Lectura archivo:

local filename = "everybody_codes_e2024_q07_p1.txt"
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


for k,v in pairs(race)  do     
    local sp = 10
    results[k] = 0
    local count = 0                 -- circular counter
    for nseg=0,TOTAL_SEGM-1 do
        local i = count % #v  + 1   -- por cada velocidad
        if v[i] == "+" then
            sp = sp + 1
        end
        if v[i] == "-" then
                sp = sp - 1        
        end       
        count = count + 1
        results[k] = results[k] + sp        --guardo el total por chariot
    end
    -- print(k, res[k])
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
print("Solucion Carrera = " .. str)      --- Resultado: DEGIKFJAH
print()


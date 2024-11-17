--- Quest 6: The Tree of Titans
--- Part 1: la solucion es buscar el unico camino que 
--- tiene una longitud que no se repite en los demás caminos.
--
--  Funciones
--

local arbol = {}
local nodofruta = {"@"}  -- no es necesario
local caminos = {}


function Recorrer(branch, camino)
    for k, v in pairs(branch) do
        if k == "nodofruta" then
            -- print(camino.."@")
            caminos[#caminos+1] = camino.."@"
        else            
            Recorrer(v,camino..k)
        end
    end
    
end


--- 
---  Programa principal 
--- 

-- Lectura archivo:

local filename = "everybody_codes_e2024_q06_p1.txt"
-- local filename = "test.txt"

print()
for l in  io.lines(filename) do
    local nodo = {}    
    local rama = {}    
    local count = 1
    
    for w in string.gmatch(l, "%a+") do
        -- guardo cada branch
        if not arbol[w]  then
            arbol[w] = {}
        end
        if count == 1 then  -- es raiz de ramas "branches"        
            nodo = arbol[w]
        else
            nodo[w] = arbol[w]
        end
        count = count + 1 

        if string.match(l,"[@]") then
            nodo["nodofruta"] = nodofruta
        end
    end
    
end

Recorrer(arbol["RR"],"RR")


-- Resultado:

local largos = {}
for i,v in ipairs(caminos) do
    print(v)
    if not largos[#v] then 
        largos[#v] = {}
    end
    table.insert(largos[#v], v)    
end

print()
-- busco el largo que contenga un solo elemento:
for k,v in pairs(largos) do
    if #v ==1 then
        print("Solucion Minimo camino = " .. v[1])     -- RRBKSMHTXSJQ@
    end
end
print()




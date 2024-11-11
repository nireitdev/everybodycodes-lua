--- Quest 2  - Parte 3
--- Analize Runes

--- IMPORTANTE: en este caso es valido la busquedas:
---         - horizontal y reversa
---         - vertical y reversa
---         - juntando "join" la parte derecha con la izquierda => horizontal y reversa

--
--  Funciones
--

--- En este caso simplemente parto a la mitad la cadena y las uno en las puntas. 
--- No hago vector circular porque las runas son mucho mas cortas que las cadenas.
function Circular_str(cadena,mascara ) 
    local mitad = math.floor(#cadena / 2)

    local out_str = string.sub(cadena,mitad +1 , #cadena) .. string.sub(cadena,1,mitad)
    local out_mask = string.sub(mascara,mitad +1 , #mascara) .. string.sub(mascara,1,mitad)

    return out_str,out_mask
end


--- Funcion generica que busca las runas en forma horizontal y reversa
function Busqueda(cadena,mascara, runes )
    
    for i=1,#runes do     
        local r = runes[i]   
        
        for z = 1,2 do
            if z == 2 then
                r = string.reverse(r)      -- el segundo paso es reversa            
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
    return mascara
end



--- 
--- 
---  Programa principal 
--- 


-- Lectura archivo:
local lineas = {}
local filename = "everybody_codes_e2024_q02_p3.txt"
-- local filename = "delme.txt"

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
local mascaras = {}
for l=3,#lineas do 
    local cadena = lineas[l]
    local mascara = string.rep("_",#cadena)  -- Mascara "bitmask"
    
    mascara = Busqueda(cadena,mascara,runes)            -- busqueda horizontal y reversa
    cadena, mascara = Circular_str(cadena,mascara)      -- uno derecha con izquierda  
    mascara = Busqueda( cadena, mascara , runes)        -- busqueda horizontal y reversa
    
    --- restauro mascara y guardo en la tabla de mascaras "save":
    _, mascaras[ #mascaras+1 ] =  Circular_str(cadena,mascara)
    -- print(mascaras[#mascaras])

end

--- Vertical strings
local verticales = {}
for l=3,#lineas do 
    local cadena = lineas[l]
    for i = 1,#cadena do
        if verticales[i] then
            verticales[i] = verticales[i] .. string.sub(cadena, i,i)
        else
            verticales[i] = string.sub(cadena, i,i)
        end
    end    
end

local mascaras_verticales = {}
for i=1,#mascaras do 
    local mask = mascaras[i]
    for j = 1,#mask do
        if mascaras_verticales[j] then
            mascaras_verticales[j] = mascaras_verticales[j] .. string.sub(mask, j,j)
        else
            mascaras_verticales[j] = string.sub(mask, j,j)
        end
    end    
end


for i=1,#verticales do 
    local cadena = verticales[i]
    local mascara = mascaras_verticales[i]
    -- print(cadena)
    -- print(mascara)

    mascara = Busqueda(cadena,mascara,runes)    -- busco horizontal y reversa
    -- print(mascara)
    for s=1,#mascara do
        if string.sub(mascara,s,s) == "x" then
            count = count + 1
        end
    end
end

-- Restultado:
print("Count= " .. count)    -- solucion = 11750




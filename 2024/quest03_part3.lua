--- Quest 3: Mining Maestro
--- Part3: extender el mapa agregando los borders = "."
--- Ahora mapa es "0-based"

--
--  Funciones
--
function Dibujar(mapa)
    print()
    for i=0,#mapa do
        for j=0, #mapa[1]   do            
            io.write(mapa[i][j])
        end
        print()
    end
    print()
end

--- Realizar una "Deep Copy" de la tabla <<mapa>>
--- Lua no tiene una funcion especifica para esto.
function Duplicar(mapa)
    print()
    local dup = {}
    for i=0,#mapa do
        local row = {}
        for j=0,#mapa[i] do
            row[j] = mapa[i][j]
        end
        dup[i]=row
    end
    return dup
end

function Count(mapa)
    local cant = 0
    for i=0,#mapa do
        local row = {}
        for j=0,#mapa[i] do
            if  mapa[i][j] == "#" then
                cant = cant + 1
            end
        end        
    end
    return cant
    
end
--- "Shrinks" el mapa
function Reducir(mapa)
    next = Duplicar(mapa)    
    for i=1,#mapa-1 do        
        for j=1,#mapa[i] do
            local horz, vert = true , true
            local diag1, diag2 = true , true
            
            local block = mapa[i][j]
            if block == "#" then  
                
                
                if (mapa[i-1][j] == "#") and (mapa[i+1][j]=="#") then
                    horz = false
                end
                
                if (mapa[i][j-1] == "#") and (mapa[i][j+1]=="#") then
                    vert = false
                end

                if (mapa[i-1][j-1] == "#") and (mapa[i+1][j+1]=="#") then
                    diag1 = false
                end                
                if (mapa[i-1][j+1] == "#") and (mapa[i+1][j-1]=="#") then
                    diag2 = false
                end                
                
                if ( vert or  horz or diag1 or diag2)  then
                    next[i][j] = "."
                end
                
            end
        end        
    end
    return next    

end


--- 
--- 
---  Programa principal 
--- 

-- Lectura archivo:
local mapa = {}
local filename = "everybody_codes_e2024_q03_p3.txt"
-- local filename = "delme.txt"


for l in  io.lines(filename) do
    local row = {}
    for i=1,#l do
        row[#row+1] = string.sub(l,i,i)
    end
    mapa[ #mapa + 1] = row
end

--- agrego bordes "." al mapa
mapa[0]={}
for k = 1, #mapa[1] do
    mapa[0][k] = "."        -- arriba
end
mapa[#mapa+1] = mapa[0]     -- abajo

max = #mapa[1]
for k=0,#mapa do    
    mapa[k][0] = "."  -- izquierda
    mapa[k][max +1 ] = "."  -- derecha
    print(k)
end

Dibujar(mapa)
local total = 0

total = total + Count(mapa)

local cant = 1
while cant>0 do
    mapa = Reducir(mapa)
    Dibujar(mapa)
    cant = Count(mapa)
    total = total + cant
end

-- Restultado:

print("Total= " .. total)    -- solucion = 10514




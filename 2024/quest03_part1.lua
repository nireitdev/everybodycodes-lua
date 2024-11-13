--- Quest 3: Mining Maestro

--
--  Funciones
--


function Dibujar(mapa)
    print()
    for i=1,#mapa do
        for j=1, #mapa[i] do
            io.write(mapa[i][j])
        end
        print()
    end
    print()
end

--- Realizar una "Deep Copy" de la tabla <<mapa>>
--- Lua no tiene una funcion especifica para esto.
function Duplicar(mapa)
    local dup = {}
    for i=1,#mapa do
        local row = {}
        for j=1,#mapa[i] do
            row[j] = mapa[i][j]
        end
        dup[i]=row
    end
    return dup
end

function Count(mapa)
    local cant = 0
    for i=1,#mapa do
        local row = {}
        for j=1,#mapa[i] do
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
    for i=2,#mapa do        
        for j=2,#mapa[i] do
            local vert = false
            local horz = false
            local block = mapa[i][j]
            if block == "#" then  
                --- Fuerza bruta!!              
                if (mapa[i-1][j] == ".") and (mapa[i+1][j]==".") then
                    horz = true
                end
                if (mapa[i-1][j] == ".") and (mapa[i+1][j]=="#") then
                    horz = true
                end                
                if (mapa[i-1][j] == "#") and (mapa[i+1][j]==".") then
                    horz = true
                end                

                if (mapa[i][j-1] == ".") and (mapa[i][j+1]==".") then
                    vert = true
                end
                if (mapa[i][j-1] == ".") and (mapa[i][j+1]=="#") then
                    vert = true
                end                
                if (mapa[i][j-1] == "#") and (mapa[i][j+1]==".") then
                    vert = true
                end             
                
                if ( vert or  horz)  then
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
local filename = "everybody_codes_e2024_q03_p1.txt"
-- local filename = "delme.txt"

for l in  io.lines(filename) do
    local row = {}
    for i=1,#l do
        row[#row+1] = string.sub(l,i,i)
    end
    mapa[ #mapa + 1] = row
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

print("Total= " .. total)    -- solucion = 134




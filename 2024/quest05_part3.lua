--- Quest 5: Pseudo-Random Clap Danceo
--- Part 3: repetir el momiviemnto hasta el infinito (SHOUTED_TIMES !!!!)
--- Supongo un max de 1000 repeticiones para parar de jugar

--
--  Funciones
--

local SHOUTED_TIMES = 1000   -- Supongo un nunmero de repeticiones "conveniente" para parar de jugar

INVALID = 0   --- para indicar una posicion vacia

function Dibujar(mapa)
    print()
    for i=1,#mapa do
        for j=1, #mapa[i] do
            if mapa[i][j] == INVALID  then
                io.write(" ")
            else
                io.write(mapa[i][j])
            end
        end
        print()
    end
    print()
end


--- Desplaza hacia abajo los participantes de una columna
--- insertando el valor en la posicion deseada
function Insertar(clappers, nro_columna, posicion, valor)
    for k=#clappers-1,posicion,-1 do
        clappers[k+1][nro_columna] = clappers[k][nro_columna]        
    end
    clappers[posicion][nro_columna] = valor
end

--- Desplaza hacia arriba los participantes de una columna
--- eliminando el primer elemeto de la misma columna
function Eliminar(clappers, nro_columna)
    for k=1,#clappers-1 do
        clappers[k][nro_columna] = clappers[k+1][nro_columna]        
    end
    clappers[#clappers][nro_columna] = INVALID
end

--- 
---  Programa principal 
--- 

-- Lectura archivo:
local clappers = {}
local filename = "everybody_codes_e2024_q05_p3.txt"
-- local filename = "test.txt"

for l in  io.lines(filename) do
    local clapper = {}
    for w in string.gmatch(l, "%d+") do
        clapper[ #clapper+1 ] = tonumber(w)     
    end
    clappers[ #clappers + 1] = clapper
end

-- extra fila para los movimientos:
clappers[#clappers+1] = {}      
for k=1,#clappers[1] do
    clappers[#clappers][k] = INVALID
end

-- Dibujar(clappers)

local last_num_plays, repeated_shouted_number = 0,0

local num_plays = math.maxinteger  -- infinito

repeated = {}


for play = 0, num_plays-1 do 
    --- pick primer clapper de la columna 
    local pick = play % #clappers[1]+1   --lua 1-based
    local clapper = clappers[1][pick]

    --- saco el primer elemento
    Eliminar(clappers,pick)    

    --- busco la siguiente columna en donde se va  mover el pick
    local column = pick + 1
    if pick >= #clappers[1] then
        column = 1      
    end

    local pos = 0
    local cicling_rigth = false
    for i = 1, clapper do
        
        if cicling_rigth then
            pos = pos - 1     -- lado derecho
        else
            pos = pos + 1     -- lado izquierdo
        end

        if pos == 0 then
            --- muevo del lado "izquierdo" de la columna
            cicling_rigth = false
            pos = 1           
        end
        
        if (pos > #clappers) or (clappers[pos][column] == INVALID) then
            --- muevo del lado "derecho" de la columna
            cicling_rigth = true
            pos = pos - 1           
        end


    end
    if not cicling_rigth then
        Insertar(clappers,column,pos,clapper)
    else
        Insertar(clappers,column,pos+1,clapper)
    end  
    
    --- Debug : muyyy lento (very slowww)
    -- Dibujar(clappers)
    -- print(table.unpack(clappers[1]))
    -- print()


    -- guardo la repeticion del header de clappers
    local str = ""
    for k=1,#clappers[1] do
        str = str .. clappers[1][k]
    end
    local key = tonumber(str)
    if (repeated[key]) then
        repeated[key] = repeated[key] + 1
    else
        repeated[key] = 1
    end

    -- Resultado final;:
    if repeated[key] == SHOUTED_TIMES then
        break
    end

end


-- Resultado:

print("Ultimo round= ") 
print(table.unpack(clappers[1]))    -- solucion = 3423

-- busco el numero maximo encontrado:
local numbers_shouted = {}
for k, v in pairs(repeated) do
    table.insert(numbers_shouted, k)
end


print("Solucion MAXIMO numero = ".. math.max(table.unpack(numbers_shouted)) )




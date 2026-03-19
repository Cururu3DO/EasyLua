-- Please note that this project was created by a Portuguese person, therefore the comments are in Portuguese.

local easy = {}
-- CRIA A TABELA GAME ANTES DE USAR
easy.game = {}
easy.state = {}
easy.file = {}
easy.event = {}

-- SISTEMA DE STATUS
function easy.state.is(valor, esperado)
    return valor == esperado
end

-- INPUT SIMPLES
function easy.input(msg)
    io.write(msg or "")
    return io.read()
end

-- CONVERTER PRA NÚMERO
function easy.num(valor)
    return tonumber(valor) or 0
end

-- CONVERTER PRA TEXTO
function easy.str(valor)
    return tostring(valor)
end

-- ADICIONAR EM LISTA
function easy.push(lista, valor)
    table.insert(lista, valor)
end

-- REMOVER DA LISTA
function easy.remove(lista, index)
    table.remove(lista, index)
end

-- LOOP SIMPLIFICADO
function easy.each(lista, func)
    for i = 1, #lista do
        func(lista[i], i)
    end
end

-- REPETIÇÃO POR NÚMERO
function easy.repeatN(vezes, func)
    for i = 1, vezes do
        func(i)
    end
end

-- PAR OU ÍMPAR
function easy.isPar(n)
    return n % 2 == 0
end

function easy.isImpar(n)
    return n % 2 ~= 0
end

-- PEGAR NÚMERO DE TEXTO
function easy.getNumber(texto)
    local n = texto:match("%d+")
    return tonumber(n)
end

-- VERIFICA SE EXISTE UM ARQUIVO
function easy.file.exists(nome)
    local f = io.open(nome, "r")
    if f then
        f:close()
        return true
    end
    return false
end

-- ABRIR ARQUIVOS
function easy.file.write(nome, texto)
    local f = io.open(nome, "w")
    if f then
        f:write(texto)
        f:close()
    end
end

function easy.file.read(nome)
    local f = io.open(nome, "r")
    if f then
        local conteudo = f:read("*a")
        f:close()
        return conteudo
    end
    return nil
end

-- =========================
-- 🎮 SISTEMA DE JOGO
-- =========================

-- PLAYER
function easy.game.criarPlayer(x, y)
    return {x = x, y = y}
end

function easy.game.mover(player, dx, dy)
    player.x = player.x + dx
    player.y = player.y + dy
end

-- ATAQUE
function easy.game.atacar(vida, dano)
    vida = vida - dano

    if vida < 0 then
        vida = 0
    end

    return vida
end

-- MAPA
function easy.game.criarMapa(largura, altura, vazio)
    local mapa = {}

    for y = 1, altura do
        mapa[y] = {}
        for x = 1, largura do
            mapa[y][x] = vazio or "."
        end
    end

    return mapa
end

function easy.game.set(mapa, x, y, valor)
    if mapa[y] and mapa[y][x] then
        mapa[y][x] = valor
    end
end

function easy.game.printMapa(mapa)
    for y = 1, #mapa do
        local linha = ""
        for x = 1, #mapa[y] do
            linha = linha .. mapa[y][x]
        end
        print(linha)
    end
end

-- TIMER
function easy.log(...)
    print("[DEBUG]:", ...)
end

-- SISTEMA DE DETECTAR EVENTO
local eventos = {}

function easy.event.on(nome, func)
    if not eventos[nome] then
        eventos[nome] = {}
    end
    table.insert(eventos[nome], func)
end

function easy.event.emit(nome)
    if eventos[nome] then
        for i = 1, #eventos[nome] do
            eventos[nome][i]()
        end
    end
end

-- TIMER
function easy.wait(segundos)
    os.execute("sleep " .. tonumber(segundos))
end

-- LOOP NORMAL
function easy.game.loop(func)
    while true do
        func()
        easy.wait(0.01)
    end
end

-- LOOP COM DELAY
function easy.game.loopDelay(func, tempo)
    while true do
        func()
        easy.wait(tempo)
    end
end

return easy

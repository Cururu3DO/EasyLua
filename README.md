# Lua- (EasyLua)

A simple library designed to make Lua easier to use, focused on beginners and rapid development.

Objective

Lua- was created to:

- Simplify complex code
- Reduce difficulty with basic tasks
- Help beginners program faster
- Make it easier to build simple games and systems

---

How to use

Place the file "easy.lua" in your project and use:

local easy = require("easy")

---

Main Functions

Input

local name = easy.input("Enter your name: ")

---

Number and String

local n = easy.num("10")
local text = easy.str(123)

---

Lists

local list = {}

easy.push(list, "A")
easy.push(list, "B")

easy.each(list, function(v, i)
    print(i, v)
end)

easy.remove(list, 1)

---

Repetition

easy.repeatN(3, function(i)
    print("Number:", i)
end)

---

Even or Odd

print(easy.isPar(10))
print(easy.isImpar(7))

---

Extract Number from Text

local n = easy.getNumber("age: 45")

---

File System

easy.file.write("test.txt", "Hello world")

local text = easy.file.read("test.txt")

print(easy.file.exists("test.txt"))

---

Game System

Player

local player = easy.game.criarPlayer(1, 1)
easy.game.mover(player, 2, 3)

---

Map

local map = easy.game.criarMapa(5, 5, ".")

easy.game.set(map, 3, 3, "P")
easy.game.printMapa(map)

---

Attack

health = easy.game.atacar(health, 10)

---

Loop

easy.game.loop(function()
    print("Running...")
end)

---

Loop with Delay

easy.game.loopDelay(function()
    print("Running...")
end, 1)

---

Events

easy.event.on("start", function()
    print("Game started")
end)

easy.event.emit("start")

---

State Check

if easy.state.is(x, 1) then
    print("Is 1")
end

---

Debug

easy.log("Test message")

---

Wait

easy.wait(1)

---

Project Structure

easy.lua
README.md

---

Target Audience

- Lua beginners
- People building simple games
- Developers who want simpler code

---

Notes

- Some functions use "os.execute" and may behave differently depending on the system
- Loops are infinite, use with caution

---

Author

Adrixx

---

Thank you for using

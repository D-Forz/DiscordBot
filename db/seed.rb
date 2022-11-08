require 'active_record'
require_relative '../lib/models/application_record'
require_relative '../lib/models/monster'

p "Clearing monsters..."
Monster.destroy_all

p "Generating monsters..."

GiantRat.create(
  name: "Giant Rat 🐀",
  hp: 5,
  attack: 1,
  defense: 2,
  xp: 10,
  gold: rand(1..5),
  min_level: 1
)
p "Giant Rat created! 🐀"

Bat.create(
  name: "Bat 🦇",
  hp: 6,
  attack: 1,
  defense: 1,
  xp: 10,
  gold: rand(1..5),
  min_level: 1
)
p "Bat created! 🦇"

Zombie.create(
  name: "Zombie 🧟",
  hp: 8,
  attack: 2,
  defense: 2,
  xp: 10,
  gold: rand(3..7),
  min_level: 2
)
p "Zombie created! 🧟"

Globin.create(
  name: "Globin 👹",
  hp: 10,
  attack: 2,
  defense: 3,
  xp: 10,
  gold: rand(3..7),
  min_level: 2
)
p "Globin created! 👹"

Wolf.create(
  name: "Wolf 🐺",
  hp: 15,
  attack: 3,
  defense: 3,
  xp: 10,
  gold: rand(5..10),
  min_level: 3
)
p "Wolf created! 🐺"

Skeleton.create(
  name: "💀 Skeleton",
  hp: 15,
  attack: 3,
  defense: 3,
  xp: 10,
  gold: rand(5..10),
  min_level: 3
)
p "💀 Skeleton created!"

Cocodrile.create(
  name: "🐊 Cocodrile",
  hp: 15,
  attack: 3,
  defense: 3,
  xp: 10,
  gold: rand(5..10),
  min_level: 3
)
p "🐊 Cocodrile created!"

GiantSnake.create(
  name: "🐍 Giant Snake",
  hp: 20,
  attack: 4,
  defense: 4,
  xp: 10,
  gold: rand(7..15),
  min_level: 4
)
p "🐍 Giant Snake created!"

Scorpion.create(
  name: "🦂 Scorpion",
  hp: 25,
  attack: 5,
  defense: 5,
  xp: 10,
  gold: rand(10..20),
  min_level: 5
)
p "🦂 Scorpion created!"

GiantBear.create(
  name: "🐻 Giant Bear",
  hp: 35,
  attack: 6,
  defense: 6,
  xp: 10,
  gold: rand(15..25),
  min_level: 6
)
p "🐻 Giant Bear created!"

Tiger.create(
  name: "🐅 Tiger",
  hp: 40,
  attack: 7,
  defense: 7,
  xp: 10,
  gold: rand(25..35),
  min_level: 7
)
p "🐅 Tiger created!"

GiantLizard.create(
  name: "🦎 Giant Lizard",
  hp: 45,
  attack: 8,
  defense: 8,
  xp: 10,
  gold: rand(35..50),
  min_level: 8
)
p "🦎 Giant Lizard created!"

Hydra.create(
  name: "🐉 Hydra",
  hp: 50,
  attack: 9,
  defense: 9,
  xp: 10,
  gold: rand(40..70),
  min_level: 9
)
p "🐉 Hydra created!"

Dragon.create(
  name: "🐲 Dragon",
  hp: 80,
  attack: 9,
  defense: 9,
  xp: 10,
  gold: rand(80..99),
  min_level: 9
)
p "🐲 Dragon created!"

p "Done!"

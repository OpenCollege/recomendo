# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

movie = Category.create(name: "filme",icon: "🍿")
book = Category.create(name: "livro",icon: "📘")
podcast = Category.create(name: "podcast",icon: "🎧")
series = Category.create(name: "seriado",icon: "📺")
video = Category.create(name: "video",icon: "📹")

Post.create(title:"Self-Made", category: series, body: "Minisérie de 4 episódios sobre a primeira mulher milhonária dos EUA")
Post.create(title:"Sully", category: movie, body: "Filme sobre um cara que fez um pouso de emergência de um avião no Rio Hudson")
Post.create(title:"Tim Ferris", category: podcast, body: "Tudo de buenas")
Post.create(title:"Can't Hurt model", category: book, body: "O único americano que terminou o treinamento do navy SEAL, US Army Ranger e também da Força Aérea americana. O cara era um gordão que só comia sorvete e virou um super-top-fit")

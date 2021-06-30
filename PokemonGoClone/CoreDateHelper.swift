import UIKit
import CoreData

func addAllPokemon(){
    createPokemon(name: "Pikachu", imageName: "pikachu")
    createPokemon(name: "Abra", imageName: "abra")
    createPokemon(name: "Bellsprout", imageName: "bellsprout")
    createPokemon(name: "Bulbasaur", imageName: "bullbasaur")
    createPokemon(name: "Caterpie", imageName: "caterpie")
    createPokemon(name: "Charmander", imageName: "charmander")
    createPokemon(name: "Dratini", imageName: "dratini")
    createPokemon(name: "Eevee", imageName: "eevee")
    createPokemon(name: "Jigglypuff", imageName: "jigglypuff")
    createPokemon(name: "Mankey", imageName: "mankey")
    createPokemon(name: "Meowth", imageName: "meowth")
    createPokemon(name: "Mew", imageName: "mew")
    createPokemon(name: "Pidgey", imageName: "pidgey")
    createPokemon(name: "Psyduck", imageName: "psyduck")
    createPokemon(name: "Snorlax", imageName: "snorlax")
    createPokemon(name: "Sqiortle", imageName: "squirtle")
    createPokemon(name: "Venonat", imageName: "venonat")
    createPokemon(name: "Weedle", imageName: "weedle")
    createPokemon(name: "Zubat", imageName: "zubat")


}

func createPokemon(name:String, imageName:String){
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
        let pokemon = Pokemon(context: context)
        pokemon.imageName = imageName
        pokemon.name = name
        try? context.save()
    }
}

func getAllPokemon() -> [Pokemon]{
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
        if let pokemonData = try? context.fetch(Pokemon.fetchRequest()){
            if let pokemons = pokemonData as? [Pokemon]{
                if pokemons.count == 0{
                    addAllPokemon()
                    return getAllPokemon()
                }
                else{
                    return pokemons
                }
            }
        }
    }
    return[]
}

func getPokemon(caught:Bool) -> [Pokemon]{
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
        let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
        if caught{
            fetchRequest.predicate = NSPredicate(format: "Caught == true")
        }
        else{
            fetchRequest.predicate = NSPredicate(format: "Caught == false")
        }
        if let pokemons = try? context.fetch(fetchRequest){
            return pokemons
        }
    }
    return[]
}

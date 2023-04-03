//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Duver on 6/12/22.
//

import Foundation

protocol pokemonManakerDelegado {
  func mostrarListaPokemon(lista: [Pokemon])
}

struct PokemonManager{
  
  var delegado: pokemonManakerDelegado?
  
  func verPokemon(){
    let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    if let url = URL(string: urlString){
      let session = URLSession(configuration: .default)
      let tarea = session.dataTask(with: url) { datos, respuesta, error in
        if error != nil{
          print("Error al obtener datos de la api: ", error?.localizedDescription)
        }
        if let datosSeguros = datos?.parseData(quitarString: "null,"){
          if let listaPokemon = self.parsearJSON(datosPokemon: datosSeguros){
            print("Lista Pokemon:", listaPokemon)
            
            delegado?.mostrarListaPokemon(lista: listaPokemon)
            
          }
        }
      }
      tarea.resume()
    }
  }
  func parsearJSON(datosPokemon: Data)-> [Pokemon]? {
    let decodificador = JSONDecoder()
    do {
      let datosDecodificados = try decodificador.decode([Pokemon].self, from: datosPokemon)
      return datosDecodificados
    } catch  {
      print("error al decodificar datos",error.localizedDescription)
      return nil
    }
  }
}

extension Data{
  func parseData(quitarString palabra: String) -> Data?{
    let dataAsString = String(data: self, encoding: .utf8)
    let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
    guard let data = parseDataString?.data(using: .utf8) else{return nil }
    return data
  }
}

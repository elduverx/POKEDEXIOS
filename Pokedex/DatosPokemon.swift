//
//  DatosPokemon.swift
//  Pokedex
//
//  Created by Duver on 6/12/22.
//

import Foundation


struct Pokemon: Decodable,Identifiable{
  let id : Int
  let attack : Int
  let defense: Int
  let description: String
  let name : String
  let imageUrl : String
  let type: String
}

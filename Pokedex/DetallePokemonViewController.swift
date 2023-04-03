//
//  DetallePokemonViewController.swift
//  Pokedex
//
//  Created by Duver on 7/12/22.
//

import UIKit

class DetallePokemonViewController: UIViewController {
  
//  MARK: Variables
  
  var pokemonMostrar: Pokemon?
  
  
  
//  MARK: IBOutlet
  
  @IBOutlet weak var imagenPokemon: UIImageView!
  
  @IBOutlet weak var descripcionPokemon: UITextView!
  
  @IBOutlet weak var tipoPokemon: UILabel!
  
  @IBOutlet weak var ataquePokemon: UILabel!
  
  @IBOutlet weak var defensaPokemon: UILabel!
  override func viewDidLoad() {
        super.viewDidLoad()
//imagen a mostrar
    
    imagenPokemon.loadFrom(URLAddress: pokemonMostrar?.imageUrl ?? "")



    tipoPokemon.text = "Tipo: \(pokemonMostrar?.type ?? "" )"
    ataquePokemon.text = "Ataque: \(pokemonMostrar!.attack)"
    defensaPokemon.text = "Defensa: \(pokemonMostrar!.defense)"
    descripcionPokemon.text = pokemonMostrar?.description ?? ""
    
    
    }

}


extension UIImageView{
  func loadFrom(URLAddress: String){
    guard let url = URL(string: URLAddress) else{return}
    
    DispatchQueue.main.async { [weak self] in
      if let imageData = try? Data(contentsOf: url){
        if let loadedImage = UIImage(data: imageData){
          self?.image = loadedImage
        }
      }
      
    }
    
    
  }
  
}
  


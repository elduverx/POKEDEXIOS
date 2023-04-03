//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by Duver on 6/12/22.
//

import UIKit

class CeldaPokemonTableViewCell: UITableViewCell {
  @IBOutlet weak var imagenPokemon: UIImageView!
  @IBOutlet weak var nombrePokemon: UILabel!
  @IBOutlet weak var defensaPokemon: UILabel!
  @IBOutlet weak var ataquePokemon: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    
    imagenPokemon.layer.cornerRadius = 15
    
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

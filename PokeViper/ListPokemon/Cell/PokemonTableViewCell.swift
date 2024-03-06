//
//  PokemonTableViewCell.swift
//  PokeViper
//
//  Created by Rodrigo Adauto Ortiz on 14/12/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonLevelLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    var level: String = String()
    var name: String = String()
    var image: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setText()
        // Initialization code
    }

    private func setText() {
        pokemonLevelLabel.text = level
        pokemonNameLabel.text = name
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

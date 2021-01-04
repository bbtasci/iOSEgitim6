//
//  AnimalsTableViewCell.swift
//  MyZoo
//
//  Created by Baris Berkin Tasci on 4.01.2021.
//

import UIKit

class AnimalsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellView: AnimalsTableViewCell!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalWaterLabel: UILabel!
    @IBOutlet weak var animalVoiceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell (newAnimal: Animal) {
        animalNameLabel.text = newAnimal.name
        animalWaterLabel.text = String(newAnimal.water)
        animalVoiceLabel.text = newAnimal.voice
    }
}

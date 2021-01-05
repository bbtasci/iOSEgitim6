//
//  ViewController.swift
//  MyZoo
//
//  Created by Baris Berkin Tasci on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var iconImageArea: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var dailyWaterLabel: UILabel!
    @IBOutlet weak var waterLimitLabel: UILabel!
    @IBOutlet weak var numberOfAnimalsLabel: UILabel!
    @IBOutlet weak var enterAnimalNameTF: UITextField!
    @IBOutlet weak var enterAnimalWaterTF: UITextField!
    @IBOutlet weak var enterAnimalVoiceTF: UITextField!
    @IBOutlet weak var addNewAnimalButton: UIButton!
    @IBOutlet weak var animalsInZooLabel: UILabel!
    @IBOutlet weak var seeAnimalListButton: UIButton!
    
    let myZoo = ZooBuilder()
    
    // MARK: - LIFECYCLE METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }

    func prepareUI() {
        prepareWelcomeLabel()
        prepareDailyWaterLabel()
        prepareWaterLimitLabel()
        prepareNumberOfAnimalsLabel()
        prepareEnterAnimalNameTF()
        prepareEnterAnimalWaterTF()
        prepareEnterAnimalVoiceTF()
        prepareAddNewAnimalButton()
        prepareAnimalsInZooLabel()
        prepareSeeAnimalListButton()
    }
    
    func prepareWelcomeLabel() {
        welcomeLabel.layer.cornerRadius = 10
        welcomeLabel.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        welcomeLabel.clipsToBounds = true
    }

    func prepareDailyWaterLabel() {
        dailyWaterLabel.text = "Daily water consumption is: \(myZoo.getZooNew().getTotalConsumedWater())"
    }
    
    func prepareWaterLimitLabel() {
        waterLimitLabel.text = "Water consumption limit is: \(myZoo.getZooNew().getWaterLimit())"
    }
    
    func prepareNumberOfAnimalsLabel() {
        numberOfAnimalsLabel.layer.cornerRadius = 10
        numberOfAnimalsLabel.clipsToBounds = true
        numberOfAnimalsLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        numberOfAnimalsLabel.text = "There are \(myZoo.getZooNew().countAnimals()) animals in My Zoo."
    }
    
    func prepareEnterAnimalNameTF() {
        enterAnimalNameTF.layer.cornerRadius = 10
        enterAnimalNameTF.layer.borderWidth = 1
        enterAnimalNameTF.layer.borderColor = UIColor.green.cgColor
        enterAnimalNameTF.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func prepareEnterAnimalWaterTF() {
        enterAnimalWaterTF.layer.cornerRadius = 10
        enterAnimalWaterTF.layer.borderWidth = 1
        enterAnimalWaterTF.layer.borderColor = UIColor.green.cgColor
        enterAnimalWaterTF.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func prepareEnterAnimalVoiceTF() {
        enterAnimalVoiceTF.layer.cornerRadius = 10
        enterAnimalVoiceTF.layer.borderWidth = 1
        enterAnimalVoiceTF.layer.borderColor = UIColor.green.cgColor
        enterAnimalVoiceTF.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func prepareAddNewAnimalButton() {
        addNewAnimalButton.layer.cornerRadius = 10
        addNewAnimalButton.layer.masksToBounds = true
    }
    
    func prepareAnimalsInZooLabel() {
        animalsInZooLabel.layer.cornerRadius = 10
        animalsInZooLabel.layer.masksToBounds = true
        animalsInZooLabel.text = "There are cat, dog, lion, rhinocera in My Zoo"
    }
    
    func prepareSeeAnimalListButton() {
        seeAnimalListButton.layer.cornerRadius = 10
        seeAnimalListButton.layer.masksToBounds = true
    }
    
    @IBAction func addNewAnimalButtonTouched(_ sender: Any) {
        
        let waterNew: Int = Int(enterAnimalWaterTF.text ?? "") ?? 0
        let waterCheck: Int = waterNew + myZoo.getZooNew().getTotalConsumedWater()
        
        if enterAnimalNameTF.text == "" || enterAnimalWaterTF.text == "" || enterAnimalWaterTF.text == "" {
            let alertEmptyFields = UIAlertController(title: "Warning!", message: "Please fill all three fields!", preferredStyle: .alert)
            alertEmptyFields.addAction(UIAlertAction(title: "OK", style: .default, handler: nil
            ))
            self.present(alertEmptyFields, animated: true)
        } else {
            if myZoo.getZooNew().getWaterLimit() >= waterCheck {
                
                var animalCounter: Int = myZoo.getZooNew().countAnimals()
                
                let newAnimal = Animal()
                newAnimal.name = enterAnimalNameTF.text ?? ""
                newAnimal.voice = enterAnimalVoiceTF.text ?? ""
                newAnimal.water = Int (enterAnimalWaterTF.text ?? "") ?? 0
                myZoo.getZooNew().addNewAnimal(newAnimal: newAnimal)
                
                animalCounter += 1
                numberOfAnimalsLabel.text = "There are \(animalCounter) animals."
                animalsInZooLabel.text = "There are cat, dog, lion, rhinocera, \(newAnimal.name) in My Zoo"
                // only adds new animal name for first time, must be rearranged. i can not refresh the page with new animal
                
                let alertAddedAnimal = UIAlertController(title: "Congratulations!", message: "You added a new animal to zoo!", preferredStyle: .alert)
                alertAddedAnimal.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertAddedAnimal, animated: true)
                
                
            } else if myZoo.getZooNew().getWaterLimit() < waterCheck {
                
                let alertOverLimit = UIAlertController(title: "Error!", message: "You can not add this animal into My Zoo, water limit is exceeded!", preferredStyle: .alert)
                alertOverLimit.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertOverLimit, animated: true)
            }
        }
    }
    
    
    @IBAction func seeAnimalListButtonTouched(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ShowAnimalsViewController") as! ShowAnimalsViewController
        vc.animals = myZoo.getZooNew().animals
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

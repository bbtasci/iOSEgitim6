//
//  ShowAnimalsViewController.swift
//  MyZoo
//
//  Created by Baris Berkin Tasci on 4.01.2021.
//

import UIKit

class ShowAnimalsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var animals: [Animal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        prepareUI()
        // Do any additional setup after loading the view.
    }
    
    func prepareTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "AnimalsTableViewCell", bundle: nil), forCellReuseIdentifier: "AnimalsTableViewCell")
        tableView.reloadData()
    }

    func prepareUI() {
        titleLabel.layer.cornerRadius = 10
        titleLabel.layer.masksToBounds = true
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
    }
}

extension ShowAnimalsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalsTableViewCell") as! AnimalsTableViewCell
        cell.setCell(newAnimal: animals[indexPath.row])
        return cell
    }
}

extension ShowAnimalsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

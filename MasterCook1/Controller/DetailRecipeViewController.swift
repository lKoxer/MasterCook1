//
//  DetailRecipeViewController.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 12.03.2023.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    @IBOutlet var nameRecipe: UILabel!
    @IBOutlet var imageRecipe: UIImageView!
    @IBOutlet var photoCreator: UIImageView!
    @IBOutlet var nameCreator: UILabel!
    @IBOutlet var addSubscribeButton: UIButton! {
        didSet {
            addSubscribeButton.layer.cornerRadius = 15
            addSubscribeButton.clipsToBounds = true
        }
    }
    @IBOutlet var tableView: UITableView!
    
    var recipes: RecipeDetailModel?
    let networkManager = RecipeDetali()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }

    @IBAction func addSubscribe(_ sender: UIButton) {
        print("Follow me")
    }
}

extension DetailRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = recipes?.ingredients[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeTableViewCell", for: indexPath) as! DetailRecipeTableViewCell
        cell.nameIngredient.text = model?.name
        cell.layer.cornerRadius = 15
        return cell
    }
}

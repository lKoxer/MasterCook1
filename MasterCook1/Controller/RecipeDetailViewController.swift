//
//  RecipeDetailViewController.swift
//  MasterCook1
//
//  Created by Михаил Данилин on 11.03.2023.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var RecipeNameLabel: UILabel!
    @IBOutlet weak var ImageRecipe: UIImageView!
    @IBOutlet weak var RaitingLabel: UILabel!
    @IBOutlet weak var NumberOfEviews: UILabel!
    @IBOutlet weak var ImageChef: UIImageView!
    @IBOutlet weak var NameChef: UILabel!
    @IBOutlet weak var NameLocation: UILabel!
    @IBOutlet weak var NumberOfReviews: UILabel!
    @IBOutlet weak var TibleViewIngredientsByThePiece: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

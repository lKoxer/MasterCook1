//
//  RecopesCollectionViewCell.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 09.03.2023.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageRecipe: UIImageView!
    @IBOutlet var nameRecipe: UILabel!
    @IBOutlet var photoCreator: UIImageView!
    @IBOutlet var nameCreator: UILabel!
    @IBOutlet var addButton: UIButton!
    
    @IBOutlet var backView: UIView!
    @IBAction func addRecipeInNote(_ sender: UIButton) {
        
    }
    
}

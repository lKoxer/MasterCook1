//
//  RecipesTableViewCell.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 08.03.2023.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    let photoRecipes = ["recipe1", "recipe2", "recipe3", "recipe1"]
    let creatorsName = ["creator1", "creator2", "creator3", "creator1"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension RecipesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if contentView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipe", for: indexPath) as! RecipeCollectionViewCell
            cell.imageRecipe.image = UIImage(named: photoRecipes[indexPath.row])
            cell.imageRecipe.layer.cornerRadius = 15
            return cell
        } else if contentView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! RecipeCollectionViewCell
            cell.imageRecipe.image = UIImage(named: photoRecipes[indexPath.row])
            cell.imageRecipe.layer.cornerRadius = 43
            cell.addButton.layer.cornerRadius = 13
            cell.backView.layer.cornerRadius = 12
            return cell
        } else if contentView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resent", for: indexPath) as! RecipeCollectionViewCell
            cell.imageRecipe.image = UIImage(named: photoRecipes[indexPath.row])
            cell.imageRecipe.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "creators", for: indexPath) as! RecipeCollectionViewCell
            cell.photoCreator.image = UIImage(named: creatorsName[indexPath.row])
            cell.photoCreator.layer.cornerRadius = 55
            return cell
        }
    }
}

//
//  RecipesTableViewCell.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 08.03.2023.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    var detailVC = DetailRecipeViewController()
    let photoRecipes = ["recipe1", "recipe2", "recipe3", "recipe1"]
    let creatorsName = ["creator1", "creator2", "creator3", "creator1"]
    var selectedRow = 0
    
    var recipes: NetworkData? // структура с рецептами
    let networkService = NetworkService() // класс хранящий метод парсинга JSON
    let urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=f0bd0ad9b5d043899798aefc74e39102"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //получаем JSON данные
        
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let allRecipes):
                self.recipes = allRecipes
                self.collectionView.reloadData()
            case .failure(let error):
                print("error:", error)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension RecipesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if contentView.tag == 0 || contentView.tag == 2  {
            return self.recipes?.number ?? 4
        } else {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = recipes?.results[indexPath.row]
        if contentView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipe", for: indexPath) as! RecipeCollectionViewCell
            cell.nameRecipe.text = model?.title
            if let imageURL = URL(string: model?.image ?? "nil") {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imageRecipe.image = image
                        }
                    }
                }
            }
            
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
            cell.nameRecipe.text = model?.title
            if let imageURL = URL(string: model?.image ?? "nil") {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imageRecipe.image = image
                        }
                    }
                }
            }
            cell.imageRecipe.layer.cornerRadius = 10
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "creators", for: indexPath) as! RecipeCollectionViewCell
            cell.photoCreator.image = UIImage(named: creatorsName[indexPath.row])
            return cell
        }
    }
}

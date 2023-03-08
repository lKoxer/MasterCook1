//
//  SavedRecipesViewController.swift
//  MasterCook1
//
//  Created by leogoba on 08.03.2023.
//

import UIKit

class SavedRecipesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let author = ["By Zeelicious Foods", "By Zeelicious Foods", "By Zeelicious Foods"]
    let picture = ["image13", "recipe1", "image14"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension SavedRecipesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        author.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedRecipes", for: indexPath) as! SavedRecipesTableViewCell
        cell.nameAuthor.text = author[indexPath.row]
        cell.imageViewSavedRecipes.image = UIImage(named: picture[indexPath.row])
        return cell
    }
}

//
//  SavedRecipesTableViewCell.swift
//  MasterCook1
//
//  Created by leogoba on 08.03.2023.
//

import UIKit

class SavedRecipesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageViewSavedRecipes: UIImageView!
    @IBOutlet weak var nameRecipe: UILabel!
    @IBOutlet weak var pictureAuthor: UIImageView!
    @IBOutlet weak var nameAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

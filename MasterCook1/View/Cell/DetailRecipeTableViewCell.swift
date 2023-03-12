//
//  DetailRecipeTableViewCell.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 12.03.2023.
//

import UIKit

class DetailRecipeTableViewCell: UITableViewCell {
    
    
    @IBOutlet var imageIngredient: UIImageView! {
        didSet {
            imageIngredient.layer.cornerRadius = 10
            imageIngredient.clipsToBounds = true
        }
    }
    @IBOutlet var nameIngredient: UILabel!
    @IBOutlet var weighIngredient: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

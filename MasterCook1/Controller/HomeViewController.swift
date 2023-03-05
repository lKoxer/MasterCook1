//
//  HomeViewController.swift
//  MasterCook1
//
//  Created by Татьяна Мальчик on 04.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchView: UIView!
    @IBOutlet var searchTextField: UITextField!
    
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var seeAllButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
    }
    
    func createView() {
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.lightGray.cgColor
        
        subtitleLabel.text = "Trending now 🔥"
        
        seeAllButton.layer.cornerRadius = 10
        seeAllButton.setTitle("See all →", for: .normal)
        seeAllButton.setTitleColor(.systemRed, for: .normal)
        seeAllButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        
    }
}

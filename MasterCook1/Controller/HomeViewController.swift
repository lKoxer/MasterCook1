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
  
    @IBOutlet var tableView: UITableView!
    
    let sectionTitle = ["Trending now 🔥", "Popular category", "Recent recipe", "Popular creators"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        createView()
    }
    
    func createView() {
        searchView.layer.cornerRadius = 10
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.lightGray.cgColor
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Recipes", for: indexPath) as! RecipesTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Categories", for: indexPath) as! RecipesTableViewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Resent", for: indexPath) as! RecipesTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Creators", for: indexPath) as! RecipesTableViewCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        let nameOfSection = UILabel(frame: CGRect(x: 16, y: 0, width: header.frame.width - 16, height: 28))
        nameOfSection.text = sectionTitle[section]
        nameOfSection.font = .systemFont(ofSize: 20, weight: .bold)
        
        let seeAllButton = UIButton()
        seeAllButton.frame = CGRect(x: Int(header.frame.width) - 70, y: 0, width: 70, height: 25)
        seeAllButton.setTitle("See all →", for: .normal)
        seeAllButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        seeAllButton.setTitleColor(.redButtonColor(), for: .normal)
        seeAllButton.addTarget(self, action: #selector(tappedSeeButton), for: .touchUpInside)
        header.addSubview(nameOfSection)
        header.addSubview(seeAllButton)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 {
           return 160
        } else {
            return 230
        }
    }
    
    @objc func tappedSeeButton() {
        print("TAP button")
    }
}

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.tintColor = .redButtonColor()
        setupMiddleButton()
    }
    
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {
        
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
        var buttonImage: UIImageView = {
            let imageBtn = UIImageView()
            imageBtn.image = UIImage(systemName: "plus")
            imageBtn.contentMode = .scaleAspectFill
            imageBtn.tintColor = .black
            imageBtn.translatesAutoresizingMaskIntoConstraints = false
            return imageBtn
        }()

        //STYLE THE BUTTON YOUR OWN WAY
        
        middleButton.backgroundColor = .redButtonColor()
        middleButton.layer.cornerRadius = (middleButton.layer.frame.width / 2)
        
        //add to the tabbar and add click event
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        
        middleButton.addSubview(buttonImage)
        NSLayoutConstraint.activate([
            buttonImage.heightAnchor.constraint(equalToConstant: 15),
            buttonImage.widthAnchor.constraint(equalToConstant: 18),
            buttonImage.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            buttonImage.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
        
        self.view.layoutIfNeeded()
    }
    
    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
        print("MenuButton")
    }
}

import UIKit

class MainTabBarController: UITabBarController {
    
    let middleButton = UIButton()
    let buttonImage = UIImageView()
    let middleButtonDiameter: CGFloat = 52
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .redButtonColor()
        setupMiddleButton()
        setConstraints()
    }
    // MARK: - Middle button
    
    func setupMiddleButton() {
        
        middleButton.layer.cornerRadius = middleButtonDiameter/2
        middleButton.backgroundColor = .redButtonColor()
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        
        buttonImage.image = UIImage(systemName: "plus")
        buttonImage.contentMode = .scaleAspectFill
        buttonImage.tintColor = .black
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        
        middleButton.addTarget(self, action: #selector(didPressMiddleButton(sender:)), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func didPressMiddleButton(sender: UIButton) {
        selectedIndex = 2
    }
    // MARK: - Set constraints
    
    func setConstraints() {
        
        middleButton.addSubview(buttonImage)
        
        NSLayoutConstraint.activate([
            buttonImage.heightAnchor.constraint(equalToConstant: 15),
            buttonImage.widthAnchor.constraint(equalToConstant: 18),
            buttonImage.centerXAnchor.constraint(equalTo: middleButton.centerXAnchor),
            buttonImage.centerYAnchor.constraint(equalTo: middleButton.centerYAnchor)
        ])
        
        tabBar.addSubview(middleButton)
        
        NSLayoutConstraint.activate([
            middleButton.heightAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.widthAnchor.constraint(equalToConstant: middleButtonDiameter),
            middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            middleButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 30)
        ])
    }
}

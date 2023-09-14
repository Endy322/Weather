//
//  ViewController.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 13.09.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private var customBigButton = SpecialBigButton(diametr: 80)
    //MARK: - Help View for ResponderChain (TabBar)
    private var helpView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    


}


//MARK: - SetupMarkTabBar
private extension MainTabBarController{
    func setupView(){
        
        setupTabBar()
        
        addViews()
        
        addTarget()
        
        setupLayout()
    }
    
    
    //MARK: - onTapGesture for CustomBigButton
    @objc func printThis(){
        selectedIndex = 1
    }
    
}



//MARK: - AddTarget
private extension MainTabBarController{
    func addTarget(){
        customBigButton.addTarget(self, action: #selector(printThis), for: .touchUpInside)
    }
}



//MARK: - AddViews
private extension MainTabBarController{
    func addViews(){
        view.addSubview(helpView)
        helpView.addSubview(customBigButton)
    }
}


//MARK: - SetupLayout
private extension MainTabBarController{
    func setupLayout(){
        
        //MARK: - Constraint for Button
        
        helpView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            helpView.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            helpView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor),
            helpView.heightAnchor.constraint(equalTo: tabBar.heightAnchor, multiplier: 1.4),
            helpView.widthAnchor.constraint(equalTo: tabBar.widthAnchor, multiplier: 0.3)
        ])
        
        
        NSLayoutConstraint.activate([
            customBigButton.centerXAnchor.constraint(equalTo: helpView.centerXAnchor),
            customBigButton.topAnchor.constraint(equalTo: helpView.topAnchor)
        ])
    }
}


//MARK: - Setup TabBar
private extension MainTabBarController{
    func setupTabBar(){
        tabBar.backgroundColor = .custom.tabBarColor
        view.backgroundColor  = .custom.backgroundColor
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .custom.backgroundColor
        firstVC.tabBarItem.title = "Home"
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.7)

        // 2
        let middleVC = MainView()

        // 3
        let secondVC = ForeCasView()
        secondVC.tabBarItem.image = UIImage(systemName: "ticket")
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .white.withAlphaComponent(0.7)
        
        viewControllers = [firstVC, middleVC, secondVC]
        
        self.selectedIndex = 1
    }
}



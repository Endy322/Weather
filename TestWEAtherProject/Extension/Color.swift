//
//  Color.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 12.09.2023.
//

import Foundation
import UIKit

extension UIColor{
    static let custom = Custom()
}

struct Custom{
    var backgroundColor = UIColor(named: "BackgroundColor")
    var tabBarColor = UIColor(named: "TabBarColor")
    var cgBackgroundColor = CGColor(red: 0.345, green: 0.749, blue: 0.976, alpha: 1)
    
}

//
//  CustomTextField.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 14.09.2023.
//

import Foundation
import UIKit

final class CustomTextField: UITextField{
    init(placeholder: String){
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomTextField{
    func setupTextField(placeholder: String){
        textColor = .white
        
        layer.cornerRadius = 10
        layer.backgroundColor = .custom.cgBackgroundColor
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        heightAnchor.constraint(equalToConstant: 35).isActive = true
        widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

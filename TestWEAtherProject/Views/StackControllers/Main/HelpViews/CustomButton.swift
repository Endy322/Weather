//
//  CustomButton.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 13.09.2023.
//

import Foundation
import UIKit

final class CustomButton: UIButton{
    
    init(placeholder: String){
        super.init(frame: .zero)
        setupButton(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomButton{
    func setupButton(placeholder: String){
        setTitle("\(placeholder)", for: .normal)
        layer.cornerRadius = 10
        layer.backgroundColor = .custom.cgBackgroundColor
        widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

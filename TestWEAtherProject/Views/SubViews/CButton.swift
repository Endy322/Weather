//
//  SpecialBigButton.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 12.09.2023.
//

import UIKit

final class SpecialBigButton: UIButton {
    init(diametr: CGFloat) {
        super.init(frame: .zero)
        setupButton(diametr)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup CustomButton
private extension SpecialBigButton{
    func setupButton(_ diametr: CGFloat){
        layer.cornerRadius = diametr / 2
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - Layout For Constrait
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: diametr),
            widthAnchor.constraint(equalToConstant: diametr)
        ])
        
        //MARK: - Add image for
        let cloudImage = UIImageView()
        cloudImage.image = UIImage(systemName: "cloud")
        cloudImage.tintColor = .white
        cloudImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cloudImage)
        
        //MARK: - Make Constrait For Image on Button
        NSLayoutConstraint.activate([
            cloudImage.heightAnchor.constraint(equalToConstant: 50),
            cloudImage.widthAnchor.constraint(equalToConstant: 60),
            cloudImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cloudImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

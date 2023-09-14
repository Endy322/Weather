//
//  MainView.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 13.09.2023.
//

import UIKit
import Combine

final class MainView: UIViewController {
    
    //MARK: - Controller(ViewModel) for this View
    private var controller = MainController()
    
    
    
    private var textField = CustomTextField(placeholder: "Введите локацию")
    private var cityName = UILabel()
    private var temperature = UILabel()
    private var textDependsOnTemperatire = UILabel()
    private var changeModeButton = CustomButton(placeholder: "Сменить режим")
    private var loadDataButton = CustomButton(placeholder: "Узнать погоду")
    //private var cancellables = Set<AnyCancellable>()
    
    //MARK: - To control what is Response we need
    private var textFieldMod: Bool  = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        addSubscriber()
//    }
    
}


//MARK: - Network
private extension MainView{
    func goToNetwork(){
        controller.getData()
    }
}

//MARK: - Add Subscriber
private extension MainView{
    func addSubscriber(){
       // print("sub")
        NotificationCenter.default.addObserver(self, selector: #selector(getNotification), name: NSNotification.Name(rawValue: "specialNotofocation"), object: nil)
    }
}

//MARK: - SetupView
private extension MainView{
    func setupView(){
        
        view.backgroundColor = .custom.backgroundColor
        
        addViews()
        
        addTargets()
        
        //MARK: - Subscribe to city and temperature
        addSubscriber()
        
        //MARK: - Make Notification
        goToNetwork()
        
        //MARK: - Colors for all items
        cityName.textColor = .white
        temperature.textColor = .white
        textDependsOnTemperatire.textColor = .white
        
        
        //MARK: - Next View Start Position
        textField.isHidden = true
        loadDataButton.isHidden = true
        
        
        setupLayout()
    }
    
    @objc func buttonChangeIsTaped(){
        textFieldMod.toggle()
        if !loadDataButton.isHidden{
            controller.getData()
            textField.text = ""
        }else{
            temperature.text = "0"
            textDependsOnTemperatire.text = ""
        }
        textField.isHidden.toggle()
        cityName.isHidden.toggle()
        loadDataButton.isHidden.toggle()
        
    }
    @objc func buttonLoadWeatherIsTapped(){
        if textField.text != ""{
            controller.getDataForCity(city: textField.text ?? "")
            
        }else{
            print("No city")
        }
    }
    
    @objc func getNotification(notification: Notification){
        guard let userInfo = notification.userInfo else {return}
        if !textFieldMod{
            guard let city = userInfo["city"]  else {return}
            guard let temp = userInfo["temperature"] else {return}
            cityName.text = String(describing: city)
            temperature.text = String(describing: temp)
            switch Int(temperature.text ?? "") ?? 0{
                        case -50..<0:
                            self.textDependsOnTemperatire.text = "Холодно"
                        case 0..<20:
                            self.textDependsOnTemperatire.text = "Нормально"
                        case 20..<40:
                            self.textDependsOnTemperatire.text = "Жара"
                        default:
                            self.textDependsOnTemperatire.text = "Нормально"
                        }
        }else{
            guard let temp = userInfo["temperature"] else {return}
            temperature.text = String(describing: temp)
            switch Int(temperature.text ?? "") ?? 0{
                        case -50..<0:
                            self.textDependsOnTemperatire.text = "Холодно"
                        case 0..<20:
                            self.textDependsOnTemperatire.text = "Нормально"
                        case 20..<40:
                            self.textDependsOnTemperatire.text = "Жара"
                        default:
                            self.textDependsOnTemperatire.text = "Нормально"
                        }
        }
        
    }
}


//MARK: - Add Views
private extension MainView{
    func addViews(){
        view.addSubview(cityName)
        view.addSubview(temperature)
        view.addSubview(textDependsOnTemperatire)
        view.addSubview(changeModeButton)
        view.addSubview(loadDataButton)
        view.addSubview(textField)
    }
}


//MARK: - Add target
private extension MainView{
    func addTargets(){
        changeModeButton.addTarget(self, action: #selector(buttonChangeIsTaped), for: .touchUpInside)
        loadDataButton.addTarget(self, action: #selector(buttonLoadWeatherIsTapped), for: .touchUpInside)
    }
}


//MARK: - Setup Layout
private extension MainView{
    func setupLayout(){
        
        //MARK: - Constraint for textField
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
        
        
        
        //MARK: - Constraint for cityName
        cityName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityName.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 180)
        ])
        
        
        //MARK: - Constraint for temperature
        temperature.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperature.centerYAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 50)
        ])
        
        
        //MARK: - Constraint for textDependsOnTemperature
        textDependsOnTemperatire.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textDependsOnTemperatire.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textDependsOnTemperatire.centerYAnchor.constraint(equalTo: temperature.bottomAnchor, constant: 60)
        ])
        
        
        //MARK: - Constraint for getDataButton
        changeModeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changeModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeModeButton.centerYAnchor.constraint(equalTo: textDependsOnTemperatire.bottomAnchor, constant: 30)
        ])
        
        
        //MARK: - Constraint for loadDataButton
        loadDataButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadDataButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadDataButton.centerYAnchor.constraint(equalTo: changeModeButton.bottomAnchor, constant: 60)
        ])
        
    }
}


//
//  MainView_Controller.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 13.09.2023.
//

import Foundation
//import Combine

class MainController{
//    @Published var city = ""
//    @Published var temperature: Int = 0
//    @Published var tempForWeek: [Int] = []
    
    
    let networkService = NetworkService()
    
    let coreDataManager = CoreDataManager()
    
    
    //MARK: - get temperature now for current City
    func getData(){
        if coreDataManager.getDataFromCoreData() != []{
            let mass = coreDataManager.getDataFromCoreData().first
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "specialNotofocation"),object: nil,userInfo: ["city": mass?.city ?? "", "temperature": (mass?.temperature ?? 0) - 273])
        }else{
            networkService.getTemperature { temp, city in
                DispatchQueue.main.sync {
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "specialNotofocation"),object: nil,userInfo: ["city": city, "temperature": temp - 273])
                }
                self.coreDataManager.saveCityAndTemp(city: city, temp: Int16(temp))
            }
        }
    }
    
    
    //MARK: - get temperatur now fot chosen city
    func getDataForCity(city: String){
        networkService.getTemperatureForCity(city: city) { temp in
            DispatchQueue.main.sync {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "specialNotofocation"),object: nil,userInfo: ["temperature": temp - 273])
            }
        }
    }
    
    
    //MARK: - get temperature for week (chosen or current city)
    func getDataForWeek(city: String){
        networkService.getTempForWeek(city: city) { tempForWeek in
            DispatchQueue.main.sync {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "specialNotofocations"),object: nil,userInfo: ["tempForWeek": tempForWeek])
                //print(tempForWeek)
            }
        }
    }
    
    
}

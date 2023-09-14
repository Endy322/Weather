//
//  CoordinateService.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 13.09.2023.
//

import Foundation
import CoreLocation

class CoordinateService: NSObject, CLLocationManagerDelegate{
    private var locationManager : CLLocationManager?
    override init(){
        super.init()
        isEnabled()
    }
    
    func isEnabled(){
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled(){
                self.locationManager = CLLocationManager()
                self.locationManager?.delegate = self
                self.checkLocationAuthorization()
                
            }else{
                print("Show an alert")
            }
        }
       
    }
    
    func location() -> (lat: Double, lon: Double)?{
        guard let coordinate = locationManager?.location?.coordinate else {return nil}
        return (lat: coordinate.latitude, lon: coordinate.longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        switch locationManager.authorizationStatus{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("Go to settings")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
}

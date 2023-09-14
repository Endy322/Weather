//
//  CoreDataManager.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 13.09.2023.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistenContainer : NSPersistentContainer
    
    init(){
        persistenContainer = NSPersistentContainer(name: "Entity")
        persistenContainer.loadPersistentStores { description, error in
            if error != nil{
                fatalError("Core Data Strore failed")
            }
        }
    }
    
    func saveCityAndTemp(city: String, temp: Int16){
        let entity = Entity(context: persistenContainer.viewContext)
        entity.city = city
        entity.temperature = temp
        do{
            try persistenContainer.viewContext.save()
        }catch{
            print("error with save")
        }
    }
    
    func getDataFromCoreData() -> [Entity]{
        let fetchRequest: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        do{
            return try persistenContainer.viewContext.fetch(fetchRequest)
        }catch{
            return []
        }
    }
}


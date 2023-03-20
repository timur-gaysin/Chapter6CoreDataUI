//
//  CoreDataManager.swift
//  Chapter6CoreDataUI
//
//  Created by Timur on 20.03.2023.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistenceContainer: NSPersistentContainer
    
    init(){
        persistenceContainer = NSPersistentContainer(name: "DateModel")
        persistenceContainer.loadPersistentStores {(description, error) in
            if let error = error{
                fatalError("Core Data failed to initialize \(error.localizedDescription)")
            }
        }
    }
    
    func savePet(name: String, breed: String){
        let pet = Animal(context: persistenceContainer.viewContext)
        pet.name = name
        pet.breed = breed
        
        do{
            try persistenceContainer.viewContext.save()
            print("Pet saved!")
        }catch{
            print("Failed to save movie \(error)")
        }
    }
    
    func getAllPets() -> [Animal]{
        
        let fetchRequest: NSFetchRequest<Animal> = Animal.fetchRequest()
        do{
            return try persistenceContainer.viewContext.fetch(fetchRequest)
        }catch{
            return[]
        }
    }
    
    func deletePet(animal: Animal){
        
        persistenceContainer.viewContext.delete(animal)
        
        do{
            try persistenceContainer.viewContext.save()
        }catch{
            persistenceContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
    }
    
}

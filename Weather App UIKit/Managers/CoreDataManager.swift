import Foundation
import CoreData
import UIKit
import os

class CoreDataManager {
    static let ENTITY = "Entity"
    static let LATITUDE = "latitude"
    static let LONGITITUDE = "longitude"
    
    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    static func saveLocationData(_ entityName: String, latitude: String, longitude: String)
    {
        let context = getContext()
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        
        entity.setValue(latitude, forKey: LATITUDE)
        entity.setValue(longitude, forKey: LONGITITUDE)
        
        do {
            try context.save()
            LoggingManager.debug("Data saved successfully.")
        } catch {
            LoggingManager.debug("Failed to save data: \(error.localizedDescription)")
        }
    }
    
    static func deleteLocationData(_ entityName: String)
    {
        let context = getContext()
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
        } catch {
            LoggingManager.debug("Failed to reset the entity")
        }
    }
    
    static func loadLocationData(_ entityName: String) -> (String, String)?
    {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            if let results = try context.fetch(fetchRequest) as? [NSManagedObject],
               let latitude = results.first?.value(forKey: LATITUDE) as? String,
               let longitude = results.first?.value(forKey: LONGITITUDE) as? String {
                return (latitude, longitude)
            }
        } catch {
            LoggingManager.debug("Failed to fetch data: \(error.localizedDescription)")
        }
        return nil
    }
}

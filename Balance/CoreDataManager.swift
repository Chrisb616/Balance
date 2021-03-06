//
//  CoreDataManager.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import CoreData

class CoreDataManager {
    private init() {}
    
    // MARK: - Core Data stack
    
    private static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Balance")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - Existing Entities
    
    static var storedUser: StoredUser? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<StoredUser> = StoredUser.fetchRequest()
        
        do{
            return try context.fetch(fetchRequest).first
        }catch{
            return nil
        }

    }
    
    //MARK: - Save Data
    
    static func saveUser(_ user: User) {
        let context = persistentContainer.viewContext
        
        clearStoredUserData()
        
        let storedUser = StoredUser(context: context)
        
        storedUser.name = user.name
        storedUser.points = String(describing: user.points)
        
        saveContext()
    }
    
    //MARK: - Clear Data
    
    static func clearAllData() {
        clearStoredUserData()
    }
    
    static func clearStoredUserData() {
        let context = persistentContainer.viewContext
        
        if let existingUserData = CoreDataManager.storedUser {
            context.delete(existingUserData)
        }
        
        saveContext()
    }

}

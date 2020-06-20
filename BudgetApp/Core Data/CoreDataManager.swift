//
//  CoreDataManager.swift
//  Budget
//
//  Created by Bobby Rehm on 11/16/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataManager: ObservableObject {
    
    // MARK: - Properties
    
    private let modelName: String
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        return managedObjectContext
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        guard let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd") else {
            fatalError("Unable to Find Data Model")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to Load Data Model")
        }
        
        return managedObjectModel
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let storeName = "\(modelName).sqlite"
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        
        // Start with a clean slate for development purposes
        do {
            try persistentStoreCoordinator.destroyPersistentStore(at: persistentStoreURL, ofType: NSSQLiteStoreType, options: nil)
        }
        catch let error {
            fatalError("Failed to destroy persistent store: \(error.localizedDescription)")
        }
        
        do {
            let options = [
                NSMigratePersistentStoresAutomaticallyOption: true,
                NSInferMappingModelAutomaticallyOption: true
            ]
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL, options: options)
        }
        catch let error {
            fatalError("Failed to Add Persistent Store: \(error.localizedDescription)")
        }
        
        return persistentStoreCoordinator
    }()
    
    // MARK: - Init
    
    init(modelName: String) {
        
        self.modelName = modelName
    }
    
    // MARK: - Public Methods
    
    func setUpTestData() {
        
        let user = User(context: managedObjectContext)
        user.firstName = "Bobby"
        user.lastName = "Rehm"
        user.username = "brehm"
        user.password = "password"
        user.email = "bobbyrehm502@gmail.com"
        
        let groceriesBudget = Budget(name: "Groceries", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        let goingOutBudget = Budget(name: "Going Out", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        let clothesBudget = Budget(name: "Clothes", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        let miscBudget = Budget(name: "Misc", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        
        for budget in [groceriesBudget, goingOutBudget, clothesBudget, miscBudget] {
            budget.addBudgetPeriod()
            budget.user = user
        }
        
        try? managedObjectContext.save()
    }
    
    func fetchObject<T: NSManagedObject>(entity: T.Type) -> T? {
        
        let request = NSFetchRequest<T>(entityName: String(describing: entity))
        
        request.fetchLimit = 1
        
        do {
            return try managedObjectContext.fetch(request).first
        }
        catch {
            print("Error fetching object: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchObjects<T: NSManagedObject>(entity: T.Type) -> [T] {
        
        let request = NSFetchRequest<T>(entityName: String(describing: entity))
        
        do {
            return try managedObjectContext.fetch(request)
        }
        catch {
            print("Error fetching objects: \(error.localizedDescription)")
            return []
        }
    }
}

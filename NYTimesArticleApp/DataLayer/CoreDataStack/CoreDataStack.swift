//
//  CoreDataStack.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

  private let modelName = "Model"

  private lazy var model: NSManagedObjectModel = {
    let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")

    guard let model = NSManagedObjectModel(contentsOf: modelURL!) else { fatalError("model not found") }

    return model
  }()

  private lazy var persistentCoordinator: NSPersistentStoreCoordinator = {

    let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
    let fileURL = URL(string: "DataModel.sql", relativeTo: dirURL)

    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)

    do {
      try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: fileURL, options: nil)
    } catch let error as NSError {
      print("Failed to add persistent store: \(error)")
    }

    return coordinator
  }()

  lazy var context: NSManagedObjectContext = {
    let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    moc.persistentStoreCoordinator = persistentCoordinator
    return moc
  }()

}

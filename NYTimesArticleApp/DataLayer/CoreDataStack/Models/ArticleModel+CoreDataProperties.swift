//
//  ArticleModel+CoreDataProperties.swift
//  
//
//  Created by Alya Filon  on 06.05.2020.
//
//

import Foundation
import CoreData


extension ArticleModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleModel> {
        return NSFetchRequest<ArticleModel>(entityName: "ArticleModel")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var abstract: String?
    @NSManaged public var section: String?
    @NSManaged public var author: String?
    @NSManaged public var url: String?
    @NSManaged public var creationDate: String?
    @NSManaged public var mediaURL: String?
    @NSManaged public var caption: String?
    @NSManaged public var mediaRatio: Double

}

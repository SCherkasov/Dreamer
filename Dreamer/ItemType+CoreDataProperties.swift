//
//  ItemType+CoreDataProperties.swift
//  Dreamer
//
//  Created by Stanislav Cherkasov on 23.08.17.
//  Copyright © 2017 Stanislav Cherkasov. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}

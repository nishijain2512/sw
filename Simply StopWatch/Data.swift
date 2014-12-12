//
//  Data.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 12/9/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import Foundation
import CoreData

class Data: NSManagedObject {

    @NSManaged var date: String
    @NSManaged var details: String
    @NSManaged var duration: String
    @NSManaged var time: String

}

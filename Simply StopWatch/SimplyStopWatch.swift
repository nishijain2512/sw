//
//  SimplyStopWatch.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 11/11/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import Foundation
import CoreData

class SimplyStopWatch: NSManagedObject {

    @NSManaged var date: String
    @NSManaged var details: String
    @NSManaged var time: String

}

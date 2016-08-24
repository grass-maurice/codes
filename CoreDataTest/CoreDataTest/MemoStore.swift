//
//  MemoStore.swift
//  CoreDataTest
//
//  Created by takayoshi on 2016/05/07.
//  Copyright © 2016年 takayoshi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc(MemoStore)
class MemoStore: NSManagedObject{
    @NSManaged var memo:String
    @NSManaged var date:NSDate
}
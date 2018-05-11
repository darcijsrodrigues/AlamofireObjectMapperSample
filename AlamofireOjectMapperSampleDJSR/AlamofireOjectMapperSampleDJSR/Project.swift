//
//  Project.swift
//  AlamofireOjectMapperSampleDJSR
//
//  Created by Fourtime on 24/04/2018.
//  Copyright © 2018 Fourtime. All rights reserved.
//

import Foundation
import ObjectMapper

class Project: NSObject,Mappable {
    
    var projectId: Int?
    var accountId: Int?
    var dateCreated: Int?
    var dateModified: Int?
    var name: String?
    var status: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.projectId <- map["id"]
        self.accountId <- map["account_id"]
        self.dateCreated <- map["date_created"]
        self.dateModified <- map["date_modified"]
        self.name <- map["name"]
        self.status <- map["status"]
    }
    
}

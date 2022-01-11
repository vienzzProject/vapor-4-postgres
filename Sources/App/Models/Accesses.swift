//
//  File.swift
//  
//
//  Created by The FED Shoes on 05/01/22.
//

import Foundation
import Fluent
import Vapor

final class Accesses: Model, Content {
    
    struct _Input: Content {
        let name: String
    }
    
    struct _Output: Content {
        let success: Bool?
        let message: String?
        let data: Form
    }
    
    struct dd: Content {
        let success: Bool?
        let message: String?
    }
    
    struct _Form: Content {
//        let id: String
        let name: String
    }
    
        
    typealias Input = _Input
    typealias Output = _Output
    typealias Form = _Form
    typealias Dd = dd
        
    // MARK: - model
    
    static let schema = "accesses"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

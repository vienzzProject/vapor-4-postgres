//
//  File.swift
//  
//
//  Created by The FED Shoes on 10/01/22.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateAccesses: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("accesses") // table name
        .id()
        .field("name", .string) // column name
        .create()
    }
    
    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("accesses").delete() // drop the table
    }
    
}

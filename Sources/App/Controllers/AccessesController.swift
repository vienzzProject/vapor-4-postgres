//
//  File.swift
//  
//
//  Created by The FED Shoes on 04/01/22.
//

import Foundation
import Vapor
import Network

struct AccessesController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let accesses = routes.grouped("accesses")
        accesses.get(use: index)
        accesses.post(use: create)
        accesses.group(":accessesID") { accesses in
            accesses.put(use: update)
        }
        accesses.group(":accessesID") { accesses in
            accesses.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture <[Accesses]> {
        return Accesses.query(on: req.db).all()
    }
    
    func create(_ req: Request) throws -> EventLoopFuture<Accesses.Output> {
        let input = try req.content.decode(Accesses.Input.self)
        let accesses = Accesses(name: input.name)
        let gForm = Accesses.Form(name: accesses.name)
        return accesses.save(on: req.db).map {
            Accesses.Output(success: true, message: "Success", data : gForm)

        }
    }
    
    func update(_ req: Request) throws -> EventLoopFuture<Accesses> {
        let updateAccesses = try req.content.decode(Accesses.self)
        return Accesses.find(req.parameters.get("accessesID"),on: req.db)
            .unwrap(or: Abort(.notFound)).flatMap { accesses in
                accesses.name = updateAccesses.name
//          accesses.nmfield = updatedAcronym.nmfield
            return accesses.save(on: req.db).map {
                accesses
            }
        }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
            guard let id = req.parameters.get("accessesID", as: UUID.self) else {
                throw Abort(.badRequest)
            }
            return Accesses.find(id, on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap { $0.delete(on: req.db) }
                .map { .ok }
        }
    
}

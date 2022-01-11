import Fluent
import Vapor

func routes(_ app: Application) throws {
//    app.get { req in
//        return "It works!"
//    }
//
//    app.get("hello") { req -> String in
//        return "Hello, world!"
//    }

//    try app.register(collection: TodoController())
    try app.register(collection: AccessesController())
    
//    app.post("accesses"){ req -> EventLoopFuture<Accesses> in
//
//        let accesses = try req.content.decode(Accesses.self)
//        return accesses.create(on: req.db).map { accesses }
//    }
}

import Fluent
import Vapor

func routes(_ app: Application) throws {
  app.get { req in
    return "It works!"
  }

  app.get("hello") { req -> String in
    return "Hello, world!"
  }

  /*
  app.post("api", "acronyms") { req -> EventLoopFuture<Acronym> in
    let acronym = try req.content.decode(Acronym.self)

    return acronym.save(on: req.db).map {
      acronym
    }
  }

  app.get("api", "acronyms", ":acronymID") {   req -> EventLoopFuture<Acronym> in
    // 2
    Acronym.find(req.parameters.get("acronymID"), on: req.db)
      // 3
      .unwrap(or: Abort(.notFound))
  }

  app.put("api", "acronyms", ":acronymID") {
    req -> EventLoopFuture<Acronym> in
    // 2
    let updatedAcronym = try req.content.decode(Acronym.self)
    return Acronym.find(
      req.parameters.get("acronymID"),
      on: req.db)
      .unwrap(or: Abort(.notFound)).flatMap { acronym in
        acronym.short = updatedAcronym.short
        acronym.long = updatedAcronym.long
        return acronym.save(on: req.db).map {
          acronym
        }
    }
  }

  app.delete("api", "acronyms", ":acronymID") {
    req -> EventLoopFuture<HTTPStatus> in
    // 2
    Acronym.find(req.parameters.get("acronymID"), on: req.db)
      .unwrap(or: Abort(.notFound))
      // 3
      .flatMap { acronym in
        // 4
        acronym.delete(on: req.db)
          // 5
          .transform(to: .noContent)
    }
  }

  app.get("api", "acronyms", "search") {
    req -> EventLoopFuture<[Acronym]> in
    // 2
    guard let searchTerm =
      req.query[String.self, at: "term"] else {
      throw Abort(.badRequest)
    }
    // 3
    return Acronym.query(on: req.db)
      .filter(\.$short == searchTerm)
      .all()
  }
  */

  let acronymsController = AcronymsController()
  try app.register(collection: acronymsController)
}

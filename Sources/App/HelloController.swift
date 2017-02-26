import Foundation
import Vapor
import HTTP

public class HelloController {
    let logger: Logger
    init(logger: Logger) {
        self.logger = logger
    }

    public func get(request: Request) throws -> ResponseRepresentable {
        guard let queryParams = request.query?["name"]?.string else {
            throw Abort.badRequest
        }
        logger.info(message: "Get request with parameters: \(queryParams)")
        return "Hello world " + queryParams
    }

    public func post(request: Request) throws -> ResponseRepresentable {
        let person = try Person(request: request)
        let firstName = person.firstName.value
        let lastName = person.lastName.value
        logger.info(message: "Post request with parameters : \(firstName) \(lastName)")
        return "Hello world " + firstName + " " + lastName
    }
}

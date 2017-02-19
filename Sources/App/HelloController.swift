import Foundation
import Vapor
import HTTP

public class HelloController {
    public func get(request: Request) throws -> ResponseRepresentable {
        guard let queryParams = request.query?["name"]?.string else {
            throw Abort.badRequest
        }
        return "Hello world " + queryParams
    }

    public func post(request: Request) throws -> ResponseRepresentable {
        let person = try Person(request: request)
        return "Hello world " + person.firstName.value + " " + person.lastName.value
    }
}

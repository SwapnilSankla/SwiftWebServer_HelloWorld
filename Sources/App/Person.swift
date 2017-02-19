import Vapor
import HTTP

struct Person {
    let firstName: Valid<NameValidationSuite>
    let lastName: Valid<NameValidationSuite>

    init(request: Request) throws {
        firstName = try request.data["firstName"].validated()
        lastName = try request.data["lastName"].validated()
    }
}

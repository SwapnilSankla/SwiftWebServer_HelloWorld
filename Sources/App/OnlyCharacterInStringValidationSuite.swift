import Foundation
import Vapor

class NameValidationSuite: ValidationSuite {
    static func validate(input value: String) throws {
        if(value.range(of:"[0-9]", options: .regularExpression) != nil) {
            throw Abort.badRequest
        }
        return try OnlyAlphanumeric.validate(input: value)
    }
}

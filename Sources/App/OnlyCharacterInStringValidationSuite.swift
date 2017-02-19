import Foundation
import Vapor

class NameValidationSuite: ValidationSuite {
    static func validate(input value: String) throws {
        if(value.range(of:"[0-9]", options: .regularExpression) != nil) {
            throw Abort.badRequest
        }
        do {
            return try OnlyAlphanumeric.validate(input: value)
        } catch {
            throw Abort.badRequest
        }

    }
}

import Foundation
import Vapor
import HTTP

final class GlobalErrorHandlerMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        do {
            return try next.respond(to: request)
        } catch Abort.badRequest {
            throw Abort.custom(status: .badRequest, message: "Request parameter validation failed")
        }
    }
}

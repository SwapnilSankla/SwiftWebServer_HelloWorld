import Foundation
import HTTP

class VersioningMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        let response = try next.respond(to: request)
        response.headers["Version"] = "HelloWorld API 1.0"
        return response
    }
}

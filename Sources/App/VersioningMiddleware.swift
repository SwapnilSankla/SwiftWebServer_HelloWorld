import Foundation
import HTTP

class VersioningMiddleware: Middleware {
    let version: String

    init(version: String) {
        self.version = version
    }

    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        let response = try next.respond(to: request)
        response.headers["Version"] = "HelloWorld API \(version)"
        return response
    }
}

import HTTP
import Foundation
import Cookies

class CookieMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        let response = try next.respond(to: request)
        let cookie = Cookie(name: "HelloWorld Cookie", value: "HelloWorld xyz")
        response.headers["Set-Cookie"] = cookie.serialize()
        return response
    }
}

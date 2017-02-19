import Foundation
import Vapor

extension Droplet {
    func registerHelloController() {
        let helloController = HelloController()
        get("/hello", handler: helloController.get)
        post("/hello", handler: helloController.post)
    }
}

let drop = Droplet()
drop.middleware.append(GlobalErrorHandlerMiddleware())
drop.registerHelloController()
drop.run()

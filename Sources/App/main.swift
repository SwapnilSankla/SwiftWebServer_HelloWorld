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
drop.registerHelloController()
drop.run()

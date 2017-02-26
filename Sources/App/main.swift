import Foundation
import Vapor

extension Droplet {
    func registerHelloController(logger: Logger) {
        let helloController = HelloController(logger: logger)
        get("/hello", handler: helloController.get)
        post("/hello", handler: helloController.post)
    }

    func createLogger() -> Logger {
        return environment == .development ? Logger(loggingEnabled: true) :
                                             Logger(loggingEnabled: false)
    }
}

let drop = Droplet()

drop.middleware.append(GlobalErrorHandlerMiddleware())
drop.middleware.append(VersioningMiddleware())
drop.middleware.append(CookieMiddleware())

let logger = drop.createLogger()

drop.registerHelloController(logger: logger)
drop.run()

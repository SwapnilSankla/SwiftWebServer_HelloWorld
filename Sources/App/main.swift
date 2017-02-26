import Foundation
import Vapor

private func registerMiddlewares(droplet: Droplet) {
    droplet.middleware.append(GlobalErrorHandlerMiddleware())
    droplet.middleware.append(VersioningMiddleware())
    droplet.middleware.append(CookieMiddleware())
}

private func registerHelloController(droplet: Droplet, logger: Logger) {
    let helloController = HelloController(logger: logger)
    droplet.get("/hello", handler: helloController.get)
    droplet.post("/hello", handler: helloController.post)
}

let droplet = Droplet()
let logger = droplet.createLogger()
registerMiddlewares(droplet: droplet)
registerHelloController(droplet: droplet, logger: logger)
droplet.run()


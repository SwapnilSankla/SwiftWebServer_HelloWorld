import Foundation
import Vapor

private func registerMiddlewares(droplet: Droplet, version: String) {
    droplet.middleware.append(GlobalErrorHandlerMiddleware())
    droplet.middleware.append(VersioningMiddleware(version: version))
    droplet.middleware.append(CookieMiddleware())
}

private func registerVersionController(droplet: Droplet, version: String) {
    let versionController = VersionController(version: version)
    droplet.get("/version", handler: versionController.get)
}

private func registerHelloController(droplet: Droplet, logger: Logger) {
    let helloController = HelloController(logger: logger)
    droplet.get("/hello", handler: helloController.get)
    droplet.post("/hello", handler: helloController.post)
}

let droplet = Droplet()
let version = droplet.config["app", "version"]?.string ?? "not specified"

let logger = droplet.createLogger()
registerMiddlewares(droplet: droplet, version: version)
registerHelloController(droplet: droplet, logger: logger)
registerVersionController(droplet: droplet, version: version)
droplet.run()


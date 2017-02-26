import Vapor
import HTTP

public class VersionController {
    let version: String

    init(version: String) {
        self.version = version
    }

    public func get(request: Request) throws -> ResponseRepresentable {
        return try JSON(node: ["version": "\(version)"])
    }
}

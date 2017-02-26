import Vapor

extension Droplet {
    func createLogger() -> Logger {
        return environment == .development ? Logger(loggingEnabled: true) :
            Logger(loggingEnabled: false)
    }
}

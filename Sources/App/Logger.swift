struct Logger {
    let loggingEnabled: Bool

    init(loggingEnabled: Bool) {
        self.loggingEnabled = loggingEnabled
    }

    public func info(message: String) {
        if(loggingEnabled) {
            log(message: "INFO: " + message)
        }
    }

    public func error(message: String) {
        if(loggingEnabled) {
            log(message: "ERROR: " + message)
        }
    }

    private func log(message: String) {
        print(message)
    }
}

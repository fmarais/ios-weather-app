import Foundation
import UIKit
import os

class LoggingManager {
    static func initLogger() -> Logger {
        return Logger(
            subsystem: Bundle.main.bundleIdentifier!,
            category: "App"
        )
    }

    static func debug(_ message: String) {
        AppDelegate.logger.debug("\(message)")
    }
}

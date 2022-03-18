#if canImport(UserNotifications)
import UserNotifications

public extension o {
    /// Output using UserNotifications
    enum notification {
        public static var board: UNUserNotificationCenter = UNUserNotificationCenter.current()
    }
}
#endif

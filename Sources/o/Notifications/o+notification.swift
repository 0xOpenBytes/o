#if canImport(UserNotifications)
import UserNotifications

public extension o {
    enum notification {
        public static var board: UNUserNotificationCenter = UNUserNotificationCenter.current()
    }
}
#endif

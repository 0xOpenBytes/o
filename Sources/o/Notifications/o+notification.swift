#if canImport(UserNotifications)
import UserNotifications

public extension o {
    /// Output using UserNotifications
    enum notification {
        public class DefaultNotificationCenterDelegate: NSObject, UNUserNotificationCenterDelegate { }
        
        public static var center: UNUserNotificationCenter = UNUserNotificationCenter.current()
        public static var delegate: UNUserNotificationCenterDelegate = DefaultNotificationCenterDelegate()
    }
}
#endif

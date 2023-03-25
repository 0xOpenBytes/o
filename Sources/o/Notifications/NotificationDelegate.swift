//
//  NotificationDelegate.swift
//  
//
//  Created by Leif on 3/17/22.
//

#if canImport(UserNotifications) && !os(tvOS)
import UserNotifications

public extension o.notification {
    
    /// Set UNUserNotificationCenter.current's delegate to `o.notification.delegate`
    static func registerDelegate() {
        center.delegate = delegate
    }
}

public extension o.notification.DefaultNotificationCenterDelegate {
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        defer { completionHandler([.banner, .sound, .badge]) }
        
        o.console.out("Received Notification (\(dump(notification))")
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        defer { completionHandler() }
        
        o.console.out("User Tapped Notification (\(dump(response))")
    }
}
#endif

//
//  NotificationAuthorization.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications)
import UserNotifications

public extension o.notification {
    /// Request notification authorization
    static func requestAuthorization(
        options: UNAuthorizationOptions = [.alert, .sound, .badge],
        completionHandler: @escaping (Bool, Error?) -> Void = { _, _ in }
    ) {
        board.requestAuthorization(options: options, completionHandler: completionHandler)
    }
}
#endif

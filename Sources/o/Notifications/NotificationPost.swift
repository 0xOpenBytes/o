//
//  NotificationPost.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications) && !os(tvOS)
import UserNotifications

public extension o.notification {
    /// Create a new notification request
    static func post(
        request: UNNotificationRequest,
        withCompletionHandler completionHandler: ((Error?) -> Void)? = nil
    ) {
        center.add(request, withCompletionHandler: completionHandler)
    }
    
    /// Create a new notification request
    static func post(
        id: String = UUID().uuidString,
        categoryIdentifier: String = UUID().uuidString,
        threadIdentifier: String = UUID().uuidString,
        title: String,
        subtitle: String,
        body: String,
        badge: Int = 0,
        sound: UNNotificationSound = .default,
        attachments: [UNNotificationAttachment] = [],
        trigger: UNNotificationTrigger?,
        withCompletionHandler completionHandler: ((Error?) -> Void)? = nil
    ) {
        let content = UNMutableNotificationContent()
        
        content.threadIdentifier = threadIdentifier
        content.categoryIdentifier = categoryIdentifier
        
        content.title = title
        content.subtitle = subtitle
        content.body = body
        
        content.badge = NSNumber(value: badge)
        content.sound = sound
        content.attachments = attachments
        
        post(
            request: UNNotificationRequest(
                identifier: id,
                content: content,
                trigger: trigger
            ),
            withCompletionHandler: completionHandler
        )
    }
}
#endif

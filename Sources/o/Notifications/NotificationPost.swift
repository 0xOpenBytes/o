//
//  NotificationPost.swift
//  
//
//  Created by Leif on 3/15/22.
//

#if canImport(UserNotifications)
import UserNotifications

public extension o.notification {
    static func post(
        request: UNNotificationRequest,
        withCompletionHandler completionHandler: ((Error?) -> Void)? = nil
    ) {
        board.add(request, withCompletionHandler: completionHandler)
    }
    
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
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        post(request: request, withCompletionHandler: completionHandler)
    }
}
#endif

# o

*Output and Input*

## What is `o`?

`o` is a simple framework to output to a file, url, the console, or even register notification using UserNotifications. `o` can also get input from a file, url, or console.

## Where can `o` be used?

Currently, `o` can be used on macOS, iOS, and watchOS. 

## Examples

### o.console
```swift
o.console.out("Value to print: ", terminator: "") //    (oTests/oTests.swift@7) [testExample()]: Value to print:
o.console.out(o.console.in()) // Type in "???";         (oTests/oTests.swift@8) [testExample()]: Optional("???")
```

### o.file
```swift
let fileContents = 4
let folderPath = "./TestFolder"
let filename = "SomeNumber"

try o.file.createDirectory(path: folderPath)

// Write the value 4, an Int, to a file named `filename` in the `folderPath` directory. Files using o.file are base64Encoded by default.
try o.file.out(fileContents, path: folderPath, filename: filename, base64Encoded: false)

// Asserts
XCTAssertEqual(try o.file.in(path: folderPath, filename: filename), 4)

// Delete the File
try o.file.delete(path: folderPath, filename: filename)

// Assert deletion
XCTAssertThrowsError(try o.file.in(path: folderPath, filename: filename) as Int)
```

### o.url
```swift
struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// GET Request

let (data, response) = try await o.url.get(
    url: URL(string: "api/posts")!
)

// POST Request

let post = Post(userId: 1, id: 1, title: "First!", body: "")

let (_, response) = try await o.url.post(
    url: URL(string: "api/posts/\(post.id)")!,
    body: try? JSONEncoder().encode(post)
)

print(response)
```

### o.notification
```swift
// Request Notification Authorization 
o.notification.requestAuthorization()

// Set UNUserNotificationCenter.current's delegate to `o.notification.delegate`
o.notification.registerDelegate()

// Schedule a Notification
o.notification.post(
    title: "Hello!",
    subtitle: "o.notification",
    body: "Woo Hoo!",
    trigger: UNTimeIntervalNotificationTrigger(
        timeInterval: 3,
        repeats: false
    )
)
```

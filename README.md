# o

*Output and Input*

## What is `o`?

`o` is a simple framework that makes output and input easy. Output can be to a file, console, url, or notification. Input can be from a file, url, or console.

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
let filename: String = ...

// Write the value 4, an Int, to the file named `filename`. Files using o.file are base64Encoded.
try o.file.out(4, filename: filename)

// Asserts
XCTAssertNoThrow(try o.file.in(filename: filename) as Int)
XCTAssertEqual(try? o.file.in(filename: filename), 4)

// Delete the File
try o.file.delete(filename: filename)

// Assert deletion
XCTAssertThrowsError(try o.file.in(filename: filename) as Int)
```

### o.url
### o.notification
```swift
// Request Notification Authorization 
o.notification.requestAuthorization()



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

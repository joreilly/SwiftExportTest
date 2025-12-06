Sample project to test Swift Export functionality


Testing coroutine cancellation for example by opening 2nd SwiftUI view (`SomeOtherView` below) that calls Kotlin suspend function (using `await` from task view modifier).  That suspend function calls `delay` and if we go back from view before that finishes then we get following:  

"Failed to get greeting: CancellationError()"

#### Kotlin
```kotlin
class Greeting {
    private val platform = getPlatform()

    suspend fun suspendGreet(): String {
        delay(5000)
        return "Hi there (suspend), ${platform.name}!"
    }
}
```

#### Swift/SwiftUI
```swift
struct SomeOtherView: View {
    @State private var greeting = ""
    var body: some View {
        VStack {
            Text(greeting)
        }
        .task {
            do {
                greeting = try await Greeting().suspendGreet()
                print(greeting)
            } catch {
                print("Failed to get greeting: \(error)")
            }
        }
    }
}
```


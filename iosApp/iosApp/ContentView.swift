import SwiftUI
import Shared

struct ContentView: View {
    @State private var showContent = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the first view!")
                
                // Button to navigate to the second view
                NavigationLink(destination: SomeOtherView()) {
                    Text("Go to Second View")
                }
            }
            .navigationTitle("First View")
        }
    }
}

struct SomeOtherView: View {
    var body: some View {
        VStack {
            Text("hi")
        }
        .task {
            do {
                let greeting = try await Greeting().suspendGreet()
                print(greeting)
            } catch {
                print("Failed to get greeting: \(error)")
            }
        }
    }
}

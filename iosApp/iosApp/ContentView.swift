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
        .task {
            let g = Greeting()
            do {
                for try await v in g.flowTest() {
                    print(v)
                }
            } catch {
                print("Failed to iterate greetings: \(error)")
            }
        }
    }
}

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

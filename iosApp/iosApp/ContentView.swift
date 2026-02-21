import SwiftUI
import Shared

struct ContentView: View {
    @State private var showContent = false
    @State private var streamedValues: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the first view!")
                
                // Show results from for-await
                if streamedValues.isEmpty {
                    Text("No streamed values yet")
                        .foregroundStyle(.secondary)
                } else {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(streamedValues.indices, id: \.self) { idx in
                            Text(streamedValues[idx])
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.top, 4)
                }
                
                // Button to navigate to the second view
                NavigationLink(destination: SomeOtherView()) {
                    Text("Go to Second View")
                }
            }
            .navigationTitle("First View")
        }
        .task {
            streamedValues.removeAll()
            let g = Greeting()
            do {
                for try await v in g.flowTest() {
                    print(v)
                    streamedValues.append(v)
                }
            } catch {
                let err = "Failed to iterate greetings: \(error)"
                print(err)
                streamedValues.append(err)
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

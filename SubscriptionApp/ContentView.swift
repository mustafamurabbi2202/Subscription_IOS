import SwiftUI

struct ContentView: View {
    @State private var showingEditSubscription = false

    var body: some View {
        VStack {
            Button("Edit Subscription") {
                showingEditSubscription = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .fullScreenCover(isPresented: $showingEditSubscription) {
            EditSubscriptionView()
        }
    }
}

#Preview {
    ContentView()
}

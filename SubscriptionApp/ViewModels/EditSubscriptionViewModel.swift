import Foundation
import SwiftUI

class EditSubscriptionViewModel: ObservableObject {
    @Published var subscription: Subscription
    @Published var showingAppSheet = false
    @Published var showingAmountSheet = false
    @Published var showingCategorySheet = false
    @Published var showingDateSheet = false
    @Published var showingFrequencySheet = false
    
    @Published var searchText = ""
    @Published var tempAmount = ""
    
    init(subscription: Subscription = Subscription()) {
        self.subscription = subscription
        self.tempAmount = String(format: "%.0f", subscription.amount)
    }
    
    var filteredApps: [Apps] {
        if searchText.isEmpty {
            return Apps.allApps
        } else {
            return Apps.allApps.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func selectApp(_ app: Apps) {
        subscription.app = app
        showingAppSheet = false
    }
    
    func updateAmount() {
        if let amount = Double(tempAmount) {
            subscription.amount = amount
        }
        showingAmountSheet = false
    }
    
    func selectCategory(_ category: Category) {
        subscription.category = category
        showingCategorySheet = false
    }
    
    func selectDate(_ date: Date) {
        subscription.startDate = date
        showingDateSheet = false
    }
    
    func selectFrequency(_ frequency: Frequency) {
        subscription.frequency = frequency
        showingFrequencySheet = false
    }
    
    func save() {
        print("Saving subscription: \(subscription)")
    }
    
    func delete() {
        print("Deleting subscription")
    }
}

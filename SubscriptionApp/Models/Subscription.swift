import Foundation

struct Subscription: Identifiable {
    let id = UUID()
    var app: Apps
    var amount: Double
    var category: Category
    var startDate: Date
    var frequency: Frequency
    var remindMe: String
    var isActive: Bool
    
    init(app: Apps = .netflix, amount: Double = 50.00, category: Category = .loan, startDate: Date = Date(), frequency: Frequency = .weekly, remindMe: String = "2 days before", isActive: Bool = true) {
        self.app = app
        self.amount = amount
        self.category = category
        self.startDate = startDate
        self.frequency = frequency
        self.remindMe = remindMe
        self.isActive = isActive
    }
}

struct Apps: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let iconName: String
    let color: String
    
    static let netflix = Apps(name: "Netflix", iconName: "netflix_icon", color: "red")
    static let spotify = Apps(name: "Spotify", iconName: "spotify_icon", color: "green")
    static let newYorkTimes = Apps(name: "New York Times", iconName: "new_york_icon", color: "black")
    static let wallStreetJournal = Apps(name: "Wall Street Journal", iconName: "wsj_icon", color: "blue")
    static let hulu = Apps(name: "Hulu", iconName: "hulu_icon", color: "green")
    static let apple = Apps(name: "Apple", iconName: "apple_icon", color: "black")
    static let amazon = Apps(name: "Amazon", iconName: "amazon_icon", color: "orange")

    static let allApps = [netflix, spotify, newYorkTimes, wallStreetJournal, hulu, apple, amazon]
}

enum Category: String, CaseIterable {
    case subscription = "Subscription"
    case utility = "Utility"
    case cardPayment = "Card Payment"
    case loan = "Loan"
    case rent = "Rent"
    
    var iconName: String {
        switch self {
        case .subscription: return "arrow.clockwise.circle"
        case .utility: return "bolt.circle"
        case .cardPayment: return "creditcard"
        case .loan: return "dollarsign.circle"
        case .rent: return "house"
        }
    }
}

enum Frequency: String, CaseIterable {
    case weekly = "Weekly"
    case monthly = "Monthly"
    case annually = "Anually"
}

import Foundation

extension DateFormatter {
    static let monthDayYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
}

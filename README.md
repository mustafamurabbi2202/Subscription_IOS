# SubscriptionApp

A modern iOS app built with SwiftUI for managing subscription services. Track your monthly subscriptions, set reminders, and organize your recurring payments in one place.

## Features

### 📱 Core Functionality
- **Subscription Management**: Add, edit, and delete subscription services
- **Custom App Icons**: Support for custom icons for popular services (Netflix, Spotify, Hulu, Amazon, etc.)
- **Amount Tracking**: Monitor subscription costs with easy input
- **Category Organization**: Categorize subscriptions (Subscription, Utility, Card Payment, Loan, Rent)
- **Date Management**: Track start dates and billing frequencies
- **Reminder System**: Set up payment reminders
- **Active/Inactive Toggle**: Enable or disable subscription tracking

### 🎨 User Interface
- **Card-based Design**: Clean, modern interface with organized cards
- **Modal Sheets**: Intuitive popup interfaces for editing
- **Custom Icons**: Beautiful custom icons for major subscription services
- **Responsive Layout**: Optimized for different screen sizes
- **Dark Mode Support**: Native iOS dark mode compatibility

### 📊 Supported Services
- Netflix
- Spotify
- Hulu
- Amazon
- Apple
- Wall Street Journal
- New York Times
- And more...

## Project Structure

```
SubscriptionApp/
├── Models/
│   └── Subscription.swift          # Core data models
├── Views/
│   ├── EditSubscriptionView.swift  # Main editing interface
│   └── Sheets/
│       ├── AmountInputSheet.swift  # Amount input modal
│       ├── AppSelectionSheet.swift # App selection modal
│       ├── CategorySelectionSheet.swift # Category selection modal
│       ├── DatePickerSheet.swift   # Date picker modal
│       └── FrequencySelectionSheet.swift # Frequency selection modal
├── ViewModels/
│   └── EditSubscriptionViewModel.swift # Business logic
├── Extensions/
│   └── DateFormatter+Extensions.swift # Date formatting utilities
└── Assets.xcassets/               # Custom icons and assets
    ├── netflix_icon.imageset/
    ├── spotify_icon.imageset/
    ├── hulu_icon.imageset/
    ├── amazon_icon.imageset/
    ├── apple_icon.imageset/
    ├── wsj_icon.imageset/
    ├── back_button_icon.imageset/
    └── unfold_more.imageset/
```

## Technical Details

### Built With
- **SwiftUI**: Modern declarative UI framework
- **iOS 15+**: Latest iOS features and capabilities
- **Xcode**: Apple's development environment

### Key Components

#### Models
- `Subscription`: Main data model containing app, amount, category, dates, and settings
- `Apps`: Predefined subscription services with custom icons
- `Category`: Subscription categories for organization
- `Frequency`: Billing frequency options (Weekly, Monthly, Annually)

#### Views
- **EditSubscriptionView**: Main interface with card-based layout
- **Modal Sheets**: Specialized input interfaces for different data types
- **Custom Components**: Reusable UI components like SubscriptionRow

#### Features
- **Custom Icon Support**: Automatic detection and display of custom vs system icons
- **Modal Presentations**: Content-sized modals with proper detents
- **Form Validation**: Input validation and data management
- **State Management**: ObservableObject pattern for data binding

## Getting Started

### Prerequisites
- Xcode 13.0 or later
- iOS 15.0 or later
- macOS 12.0 or later (for development)

### Installation
1. Clone the repository
2. Open `SubscriptionApp.xcodeproj` in Xcode
3. Build and run on your device or simulator

### Usage
1. **Adding a Subscription**: Tap the + button to add a new subscription
2. **Editing**: Tap on any subscription to edit its details
3. **Selecting Apps**: Choose from predefined services or add custom ones
4. **Setting Amounts**: Use the amount input sheet with decimal pad
5. **Organizing**: Categorize subscriptions for better management
6. **Reminders**: Set up payment reminders for each subscription

## Customization

### Adding New App Icons
1. Add your icon to `Assets.xcassets`
2. Create a new imageset with your icon
3. Update the `Apps` enum in `Subscription.swift`
4. Add the icon name to the custom icon detection logic

### Modifying Categories
Edit the `Category` enum in `Subscription.swift` to add or modify subscription categories.

### Styling
The app uses SwiftUI's built-in styling with custom colors and fonts. Modify the color schemes and typography in the respective view files.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is available under the MIT License. See the LICENSE file for more details.

## Acknowledgments

- Custom icons designed for major subscription services
- SwiftUI community for best practices and examples
- iOS Human Interface Guidelines for design inspiration

---

**Note**: This app is designed for personal use and subscription management. Always verify subscription details with the actual service providers.

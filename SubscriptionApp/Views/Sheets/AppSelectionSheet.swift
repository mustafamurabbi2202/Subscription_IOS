import SwiftUI

struct AppSelectionSheet: View {
    @ObservedObject var viewModel: EditSubscriptionViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button("Cancel") {
                        viewModel.showingAppSheet = false
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("App")
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Button("Done") {
                        viewModel.showingAppSheet = false
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                
                Divider()
                
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    
                    TextField("Search", text: $viewModel.searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                
                // App List
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.filteredApps) { app in
                            AppRow(
                                app: app,
                                isSelected: app.id == viewModel.subscription.app.id
                            ) {
                                viewModel.selectApp(app)
                            }
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
        }
        .navigationBarHidden(true)
    }
}

struct AppRow: View {
    let app: Apps
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                if app.iconName.contains("_icon") {
                    // Custom icons (netflix_icon, spotify_icon, hulu_icon, amazon_icon, wsj_icon, apple_icon)
                    Image(app.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                } else {
                    // System icons for other apps
                    Circle()
                        .fill(Color(app.color))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(systemName: app.iconName)
                                .foregroundColor(.white)
                                .font(.title3)
                        )
                }
                
                Text(app.name)
                    .font(.body)
                    .foregroundColor(.primary)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                        .font(.body)
                        .fontWeight(.medium)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

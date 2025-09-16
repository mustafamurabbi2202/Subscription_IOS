import SwiftUI

struct CategorySelectionSheet: View {
    @ObservedObject var viewModel: EditSubscriptionViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Cancel") {
                    viewModel.showingCategorySheet = false
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                Text("Category")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button("Done") {
                    viewModel.showingCategorySheet = false
                }
                .foregroundColor(.blue)
                .fontWeight(.medium)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Divider()
            
            // Category List
            VStack(spacing: 0) {
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryRow(
                        category: category,
                        isSelected: category == viewModel.subscription.category
                    ) {
                        viewModel.selectCategory(category)
                    }
                    
                    if category != Category.allCases.last {
                        Divider()
                            .padding(.leading, 20)
                    }
                }
            }
            .background(Color(.systemBackground))
        }
        .background(Color(.systemBackground))
    }
}

struct CategoryRow: View {
    let category: Category
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                // Circular icon background
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 32, height: 32)
                    .overlay(
                        Image(systemName: category.iconName)
                            .foregroundColor(.primary)
                            .font(.system(size: 16, weight: .medium))
                    )
                
                Text(category.rawValue)
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
            .padding(.vertical, 15)
            .background(Color(.systemBackground))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

import SwiftUI

struct FrequencySelectionSheet: View {
    @ObservedObject var viewModel: EditSubscriptionViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button("Cancel") {
                        viewModel.showingFrequencySheet = false
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("Frequency")
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Button("Done") {
                        viewModel.showingFrequencySheet = false
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                
                Divider()
                
                // Frequency List
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(Frequency.allCases, id: \.self) { frequency in
                            FrequencyRow(
                                frequency: frequency,
                                isSelected: frequency == viewModel.subscription.frequency
                            ) {
                                viewModel.selectFrequency(frequency)
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

struct FrequencyRow: View {
    let frequency: Frequency
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(frequency.rawValue)
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

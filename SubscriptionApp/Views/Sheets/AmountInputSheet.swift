import SwiftUI

struct AmountInputSheet: View {
    @ObservedObject var viewModel: EditSubscriptionViewModel
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button("Cancel") {
                    viewModel.showingAmountSheet = false
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                Text("Amount")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button("Done") {
                    viewModel.updateAmount()
                }
                .foregroundColor(.blue)
                .fontWeight(.medium)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            
            Divider()
            
            // Text Field
            VStack(alignment: .leading, spacing: 8) {
                Text("Amount")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 20)
                
                HStack {
                    Text("$")
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    TextField("Enter amount", text: $viewModel.tempAmount)
                        .font(.title)
                        .fontWeight(.light)
                        .keyboardType(.decimalPad)
                        .focused($isTextFieldFocused)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
                .padding(.horizontal, 20)
            }
            .padding(.vertical, 20)
        }
        .background(Color(.systemBackground))
        .onAppear {
            isTextFieldFocused = true
        }
    }
}

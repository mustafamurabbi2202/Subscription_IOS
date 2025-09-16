import SwiftUI

struct DatePickerSheet: View {
    @ObservedObject var viewModel: EditSubscriptionViewModel
    @State private var selectedDate: Date
    
    init(viewModel: EditSubscriptionViewModel) {
        self.viewModel = viewModel
        self._selectedDate = State(initialValue: viewModel.subscription.startDate)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button("Cancel") {
                        viewModel.showingDateSheet = false
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("Start Date")
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    Spacer()
                    
                    Button("Done") {
                        viewModel.selectDate(selectedDate)
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                
                Divider()
                
                Spacer()
                
                // Date Picker
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .background(Color(.systemGroupedBackground))
        }
        .navigationBarHidden(true)
    }
}

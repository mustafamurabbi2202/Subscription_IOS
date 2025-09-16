import SwiftUI

struct EditSubscriptionView: View {
    @StateObject private var viewModel = EditSubscriptionViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Button(action: { dismiss() }) {
                        Image("back_button_icon")
                            .foregroundColor(.primary)
                            .font(.title2)
                    }

                    Spacer()

                    Text("Edit Subscription")
                        .font(.headline)
                        .fontWeight(.medium)

                    Spacer()

                    Button("Save") {
                        viewModel.save()
                    }
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)

                HStack(spacing: 12) {
                    if viewModel.subscription.app.iconName.contains("_icon") {
                        Image(viewModel.subscription.app.iconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    } else {
                        Circle()
                            .fill(Color(viewModel.subscription.app.color))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: viewModel.subscription.app.iconName)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            )
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text(viewModel.subscription.app.name)
                            .font(.headline)
                            .fontWeight(.medium)
                        Text(String(format: "$%.2f", viewModel.subscription.amount))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .padding(.top, 10)

                ScrollView {
                    VStack(spacing: 20) {
                        Spacer()
                            .frame(height: 16)
                        VStack(spacing: 0) {
                            SubscriptionRow(
                                title: "App",
                                value: viewModel.subscription.app.name,
                                showChevron: true,
                                titleColor: .pink,
                                isFirst: true
                            ) {
                                viewModel.showingAppSheet = true
                            }

                            Divider()
                                .padding(.leading, 20)

                            SubscriptionRow(
                                title: "Amount",
                                value: String(format: "$%.2f", viewModel.subscription.amount)
                            ) {
                                viewModel.showingAmountSheet = true
                            }

                            Divider()
                                .padding(.leading, 20)

                            SubscriptionRow(
                                title: "Category",
                                value: viewModel.subscription.category.rawValue,
                                showChevron: true,
                                icon: viewModel.subscription.category.iconName,
                                isLast: true
                            ) {
                                viewModel.showingCategorySheet = true
                            }
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)

                        VStack(spacing: 0) {
                            SubscriptionRow(
                                title: "Start Date",
                                value: DateFormatter.monthDayYear.string(from: viewModel.subscription.startDate),
                                isFirst: true
                            ) {
                                viewModel.showingDateSheet = true
                            }

                            Divider()
                                .padding(.leading, 20)

                            SubscriptionRow(
                                title: "Frequency",
                                value: viewModel.subscription.frequency.rawValue,
                                showChevron: true
                            ) {
                                viewModel.showingFrequencySheet = true
                            }

                            Divider()
                                .padding(.leading, 20)

                            SubscriptionRow(
                                title: "Remind Me",
                                value: viewModel.subscription.remindMe,
                                showChevron: true
                            ) {
                            }

                            Divider()
                                .padding(.leading, 20)

                            HStack {
                                Text("Active")
                                    .font(.body)
                                    .foregroundColor(.primary)

                                Spacer()

                                Toggle("", isOn: $viewModel.subscription.isActive)
                                    .toggleStyle(SwitchToggleStyle(tint: .green))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 15)
                            .background(Color(.systemBackground))
                        }
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .padding(.horizontal, 20)

                        Button(action: {
                            viewModel.delete()
                        }) {
                            Text("Delete")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .background(Color(.systemBackground))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray4), lineWidth: 1)
                                )
                                .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.showingAppSheet) {
            AppSelectionSheet(viewModel: viewModel)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $viewModel.showingAmountSheet) {
            AmountInputSheet(viewModel: viewModel)
                .presentationDetents([.fraction(0.25)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $viewModel.showingCategorySheet) {
            CategorySelectionSheet(viewModel: viewModel)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $viewModel.showingDateSheet) {
            DatePickerSheet(viewModel: viewModel)
                .presentationDetents([.height(350)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $viewModel.showingFrequencySheet) {
            FrequencySelectionSheet(viewModel: viewModel)
                .presentationDetents([.height(280)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct SubscriptionRow: View {
    let title: String
    let value: String
    var showChevron: Bool = false
    var titleColor: Color = .primary
    var icon: String? = nil
    var isFirst: Bool = false
    var isLast: Bool = false
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.body)
                    .foregroundColor(titleColor)

                Spacer()

                HStack(spacing: 8) {
                    if let icon = icon {
                        Image(systemName: icon)
                            .foregroundColor(.primary)
                            .font(.body)
                    }

                    Text(value)
                        .font(.body)
                        .foregroundColor(.primary)

                    if showChevron {
                        Image("unfold_more")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color(.systemBackground))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

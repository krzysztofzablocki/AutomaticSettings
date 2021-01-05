import SwiftUI
import AutomaticSettings

struct SettingsView: View, AutomaticSettingsViewDSL {
    private enum Subscreen: Swift.Identifiable {
        case review

        var id: String {
            switch self {
            case .review:
                return "review"
            }
        }
    }

    @ObservedObject
    var viewModel: AutomaticSettingsViewModel<Settings, SettingsExternal>

    @State(initialValue: nil)
    private var subscreen: Subscreen?

    var body: some View {
        NavigationView {
            content
                .sheet(item: $subscreen, content: { subscreen in
                    Group {
                        switch subscreen {
                        case .review:
                            reviewScreen
                        }
                    }
                })
                .navigationBarTitle("Beta Settings")
                .navigationBarItems(
                    leading: Button("Cancel") {
                        viewModel.cancel()
                    },
                    trailing: Group {
                        if viewModel.applicableChanges.isEmpty {
                            EmptyView()
                        } else {
                            Button("Review") {
                                subscreen = .review
                            }
                        }
                    }
                )
        }
    }

    var reviewScreen: some View {
        NavigationView {
            Form {
                if let changes = viewModel.applicableChanges, !changes.isEmpty {
                    ForEach(changes) { change in
                        VStack {
                            HStack {
                                Text(change.name)
                                Spacer()
                                if change.requiresRestart {
                                    Image(systemName: "goforward")
                                        .renderingMode(.template)
                                        .foregroundColor(.red)
                                }
                            }
                            HStack {
                                Spacer()
                                Text(change.change)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Review changes")
            .navigationBarItems(
                leading: Button("Cancel") {
                    subscreen = nil
                },
                trailing: Button("Save\(viewModel.needsRestart ? " & Restart" : "")") {
                    subscreen = nil
                    viewModel.saveChanges()
                }
            )
        }
    }
}

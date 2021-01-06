import SwiftUI
import AutomaticSettings

extension SettingsView {
    var content: some View {
        Form {
            calculationLink(headerView: {
                Button("I'm custom header action") {

                }
            })
            smoothingLink()
        }
    }
}

extension SettingsView {
    func smoothingSectionFooter() -> some View {
        Text("I'm injected footer")
    }
}

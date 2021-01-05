import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State
    var showsSetting = false


    /// Note: In real app use real storage handling and preferably not userDefaults as settings can be pretty big, I normally use real DB
    var settings: Settings {
        guard let data = UserDefaults.standard.object(forKey: "Settings") as? Data, let decoded = try? JSONDecoder().decode(Settings.self, from: data) else {
            return .init()
        }
        return decoded
    }

    func save(_ settings: Settings) {
        let encoded = try? JSONEncoder().encode(settings)
        UserDefaults.standard.setValue(encoded, forKey: "Settings")
    }

    var body: some View {
        Button("Launch Settings") {
            showsSetting = true
        }
        .sheet(isPresented: $showsSetting, content: {
            SettingsView(viewModel:
                            .init(
                                settings: settings,
                                externalData: .init(),
                                save: { save($0) },
                                dismiss: { showsSetting = false }
                            ))
        })
    }
}

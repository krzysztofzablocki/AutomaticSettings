import AutomaticSettings

struct Settings: AutomaticSettings {
    struct Calculation: AutomaticSettings {
        var text = "Default"
    }

    var calculation: Calculation = .init()
}

final class SettingsExternal: ObservableObject {
}

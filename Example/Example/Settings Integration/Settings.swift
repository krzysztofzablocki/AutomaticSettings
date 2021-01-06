import AutomaticSettings

struct Settings: AutomaticSettings {
    enum Mode: String, AutomaticSettingsEnum {
        case linearRegression
        case weightedAverage
    }

    struct Calculation: AutomaticSettings {
        var text = ""
        var mode: Mode = .linearRegression
    }

    var calculation: Calculation = .init()
}

final class SettingsExternal: ObservableObject {
}

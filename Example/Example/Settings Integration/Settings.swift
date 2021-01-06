import AutomaticSettings

struct Settings: AutomaticSettings {
    enum Mode: String, AutomaticSettingsEnum {
        case linearRegression
        case weightedAverage
    }

    enum Algorithm: String, AutomaticSettingsEnum {
        case movingAverage
        case weightedMovingAverage
        case expotentialAverage
    }

    struct Calculation: AutomaticSettings {
        var text = ""
        var mode = Mode.linearRegression
    }

    // sourcery: injectFooter
    struct Smoothing: AutomaticSettings {
        var dayPeriod = 7
        var algorithm = Algorithm.movingAverage

        struct Grouped: AutomaticSettings {
            // sourcery: range = 1...4
            var level: Float = 1

            var prettyCool = true
        }

        var grouped: Grouped = .init()
    }

    var calculation: Calculation = .init()
    var smoothing: Smoothing = .init()
}

final class SettingsExternal: ObservableObject {
}

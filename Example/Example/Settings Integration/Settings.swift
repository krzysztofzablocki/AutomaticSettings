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

    struct Smoothing: AutomaticSettings {
        var dayPeriod = 7
        var algorithm = Algorithm.movingAverage
    }

    var calculation: Calculation = .init()
    var smoothing: Smoothing = .init()
}

final class SettingsExternal: ObservableObject {
}

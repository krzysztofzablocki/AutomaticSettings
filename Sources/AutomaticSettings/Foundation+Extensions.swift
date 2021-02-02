import Foundation

public extension String {
    var automaticSettingsNilIfEmpty: String? {
        isEmpty ? nil : self
    }

    /// Returns string with uppercased first character
    var automaticSettingsUppercasedFirst: String {
        return first
            .map { String($0).uppercased() + dropFirst() }
            ?? ""
    }

    /// Changes `somethingNamedLikeThis` into `Something Named Like This`
    var automaticSettingsTitleCase: String {
        replacingOccurrences(of: "([a-z])([A-Z](?=[A-Z])[a-z]*)", with: "$1 $2", options: .regularExpression)
            .replacingOccurrences(of: "([A-Z])([A-Z][a-z])", with: "$1 $2", options: .regularExpression)
            .replacingOccurrences(of: "([a-z]vis)([A-Z][a-z])", with: "$1 $2", options: .regularExpression)
            .replacingOccurrences(of: "([a-z])([A-Z][a-z])", with: "$1 $2", options: .regularExpression)
            .automaticSettingsUppercasedFirst
    }
}

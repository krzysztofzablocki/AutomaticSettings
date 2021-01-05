import SwiftUI

/// Marks a type to auto generate automatic settings section
/// Supported annotations:
/// - skipSetting: will not automatically generate setting UI for the given variable
/// - requiresRestart: marks variable as one that requires restart after it's changed
/// - sideEffect: automatically execute when the value changes
/// - range: range for Float/Double variables e.g. `range = 0.0...1.0`
/// - injectFooter: automatically injects section footer via function you define named `sectionNameFooter`
/// - injectHeader: automatically injects section header via function you define named `sectionNameHeader`
/// - note: If you decide to auto-inject either header or footer then the codegen won't generate functions that would allow you to pass them manually to prevent developers from causing inconsistent behaviour
public protocol AutomaticSettings: Codable, Equatable {}

/// Enum type that's automatically supported by AutomaticSettings
public protocol AutomaticSettingsEnum: RawRepresentable, Codable, Equatable, CaseIterable {}

/// A Number type that can be converted from/to String, _FormatSpecifiable is required by SwiftUI Components dealing with numeric display
public protocol StringConvertibleNumber: _FormatSpecifiable {
    init?(_ description: String)
}

extension Int: StringConvertibleNumber {}
extension Float: StringConvertibleNumber {}

/// Protocol allowing you to customize display of settings options e.g. custom enums
public protocol SettingsDisplayable: Hashable {
    var settingsTitle: String { get }
    static var settingsVariants: [Self] { get }
}

public extension SettingsDisplayable where Self: CaseIterable {
    static var settingsVariants: [Self] {
        Array(allCases)
    }
}

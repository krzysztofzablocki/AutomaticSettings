import Combine
import SwiftUI

public class AutomaticSettingsViewModel<Settings: Equatable, ExternalData: ObservableObject>: ObservableObject {
    @Published
    public var current: Settings

    @ObservedObject
    public private(set) var externalData: ExternalData

    private let initial: Settings
    private let save: (Settings) -> Void
    private let dismiss: () -> Void

    @Published
    private var fieldChecker = [String: (Settings, Settings) -> Change?]()

    public init(settings: Settings, externalData: ExternalData, save: @escaping (Settings) -> Void, dismiss: @escaping () -> Void) {
        self.externalData = externalData
        current = settings
        initial = settings
        self.save = save
        self.dismiss = dismiss
    }

    public func cancel() {
        dismiss()
    }

    public func saveChanges() {
        applySideEffects()
        save(current)
        dismiss()

        if needsRestart {
            DispatchQueue.main.async {
                exit(0)
            }
        }
    }

    public func binding<Type>(keyPath: WritableKeyPath<Settings, Type>, requiresRestart: Bool, uniqueIdentifier: String, sideEffect: (() -> Void)? = nil) -> Binding<Type> where Type: Equatable {
        return Binding(get: {
            return self.current[keyPath: keyPath]
        }, set: {
            self.change(keyPath: keyPath, requiresRestart: requiresRestart, uniqueIdentifier: uniqueIdentifier, to: $0, sideEffect: sideEffect)
        })
    }

    public func change<Type>(keyPath: WritableKeyPath<Settings, Type>, requiresRestart: Bool, uniqueIdentifier: String, to newValue: Type, sideEffect: (() -> Void)? = nil) where Type: Equatable {
        trackChange(keyPath: keyPath, requiresRestart: requiresRestart, uniqueIdentifier: uniqueIdentifier, sideEffect: sideEffect)
        current[keyPath: keyPath] = newValue
    }

    private func trackChange<Type>(keyPath: WritableKeyPath<Settings, Type>, requiresRestart: Bool, uniqueIdentifier: String, sideEffect: (() -> Void)?) where Type: Equatable {
        fieldChecker[uniqueIdentifier] = { current, initial in
            guard current[keyPath: keyPath] != initial[keyPath: keyPath] else {
                return nil
            }
            return Change(name: uniqueIdentifier, change: "\(initial[keyPath: keyPath]) → \(current[keyPath: keyPath])", requiresRestart: requiresRestart, sideEffect: sideEffect)
        }
    }

    public struct Change: Swift.Identifiable {
        public var id: String { name }

        public let name: String
        public let change: String
        public let requiresRestart: Bool
        fileprivate let sideEffect: (() -> Void)?

        init(name: String, change: String, requiresRestart: Bool, sideEffect: (() -> Void)?) {
            self.name = name
            self.change = change
            self.requiresRestart = requiresRestart
            self.sideEffect = sideEffect
        }
    }

    public var applicableChanges: [Change] {
        fieldChecker.values.compactMap { $0(current, initial) }
    }

    public var needsRestart: Bool {
        applicableChanges.contains(where: { $0.requiresRestart })
    }

    private func applySideEffects() {
        applicableChanges.forEach { $0.sideEffect?() }
    }
}

// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import AutomaticSettings

import UIKit



extension SettingsView {

// MARK: - Views

struct CalculationView<HeaderView: View, FooterView: View>: View, AutomaticSettingsViewDSL {
  typealias ViewModel = AutomaticSettingsViewModel<Settings, SettingsExternal>

  @ObservedObject
  var viewModel: ViewModel

  var headerView: HeaderView
  var footerView: FooterView

  init(viewModel: ViewModel, headerView: HeaderView, footerView: FooterView) {
    self.viewModel = viewModel
    self.headerView = headerView
    self.footerView = footerView
  }

  init(viewModel: ViewModel) where HeaderView == EmptyView, FooterView == EmptyView {
    self.viewModel = viewModel
    self.headerView = EmptyView()
    self.footerView = EmptyView()
  }

  init(viewModel: ViewModel, headerView: HeaderView) where FooterView == EmptyView {
    self.viewModel = viewModel
    self.headerView = headerView
    self.footerView = EmptyView()
  }

  init(viewModel: ViewModel, footerView: FooterView) where HeaderView == EmptyView {
    self.viewModel = viewModel
    self.headerView = EmptyView()
    self.footerView = footerView
  }

  var body: some View {
    Group {
      headerView
      settings()
      footerView
    }
  }


  /// `Group` containing all Calculation views
  func settings() -> some View {
    Section {
       Group { 
        setting(
          "text", 
          keyPath: \.calculation.text, 
          requiresRestart: false,
          sideEffect: nil, 
          uniqueIdentifier: "\\.calculation.text"
        ) 
        setting(
          "mode", 
          keyPath: \.calculation.mode, 
          requiresRestart: false,
          sideEffect: nil, 
          uniqueIdentifier: "\\.calculation.mode"
        ) 
       } 
    }
  }

}

struct SmoothingView<HeaderView: View, FooterView: View>: View, AutomaticSettingsViewDSL {
  typealias ViewModel = AutomaticSettingsViewModel<Settings, SettingsExternal>

  @ObservedObject
  var viewModel: ViewModel

  var headerView: HeaderView
  var footerView: FooterView

  init(viewModel: ViewModel, headerView: HeaderView, footerView: FooterView) {
    self.viewModel = viewModel
    self.headerView = headerView
    self.footerView = footerView
  }

  init(viewModel: ViewModel) where HeaderView == EmptyView, FooterView == EmptyView {
    self.viewModel = viewModel
    self.headerView = EmptyView()
    self.footerView = EmptyView()
  }

  init(viewModel: ViewModel, headerView: HeaderView) where FooterView == EmptyView {
    self.viewModel = viewModel
    self.headerView = headerView
    self.footerView = EmptyView()
  }

  init(viewModel: ViewModel, footerView: FooterView) where HeaderView == EmptyView {
    self.viewModel = viewModel
    self.headerView = EmptyView()
    self.footerView = footerView
  }

  var body: some View {
    Group {
      headerView
      settings()
      footerView
    }
  }


  /// `Group` containing all Smoothing views
  func settings() -> some View {
    Section {
       Group { 
        setting(
          "dayPeriod", 
          keyPath: \.smoothing.dayPeriod, 
          requiresRestart: false,
          sideEffect: nil, 
          uniqueIdentifier: "\\.smoothing.dayPeriod"
        ) 
        setting(
          "algorithm", 
          keyPath: \.smoothing.algorithm, 
          requiresRestart: false,
          sideEffect: nil, 
          uniqueIdentifier: "\\.smoothing.algorithm"
        ) 
        Section(header: Text("Grouped".automaticSettingsTitleCase)) {
          GroupedView(
            viewModel: self.viewModel
          )
        }
       } 
    }
  }

}

struct GroupedView<HeaderView: View, FooterView: View>: View, AutomaticSettingsViewDSL {
  typealias ViewModel = AutomaticSettingsViewModel<Settings, SettingsExternal>

  @ObservedObject
  var viewModel: ViewModel

  var headerView: HeaderView
  var footerView: FooterView

  init(viewModel: ViewModel, headerView: HeaderView, footerView: FooterView) {
    self.viewModel = viewModel
    self.headerView = headerView
    self.footerView = footerView
  }

  init(viewModel: ViewModel) where HeaderView == EmptyView, FooterView == EmptyView {
    self.viewModel = viewModel
    self.headerView = EmptyView()
    self.footerView = EmptyView()
  }

  init(viewModel: ViewModel, headerView: HeaderView) where FooterView == EmptyView {
    self.viewModel = viewModel
    self.headerView = headerView
    self.footerView = EmptyView()
  }

  init(viewModel: ViewModel, footerView: FooterView) where HeaderView == EmptyView {
    self.viewModel = viewModel
    self.headerView = EmptyView()
    self.footerView = footerView
  }

  var body: some View {
    Group {
      headerView
      settings()
      footerView
    }
  }


  /// `Group` containing all Grouped views
  func settings() -> some View {
    Section {
       Group { 
        setting(
          "level", 
          keyPath: \.smoothing.grouped.level, 
          requiresRestart: false,
          sideEffect: nil, 
          uniqueIdentifier: "\\.smoothing.grouped.level",
          range: 1...4
        ) 
        setting(
          "prettyCool", 
          keyPath: \.smoothing.grouped.prettyCool, 
          requiresRestart: false,
          sideEffect: nil, 
          uniqueIdentifier: "\\.smoothing.grouped.prettyCool"
        ) 
       } 
    }
  }

}


// MARK: -

/// All generated section links:
    // Group { 
      // calculationLink()
      // smoothingLink()
    // } 

// MARK: - Top Level Link wrappers


  func calculationLink<HeaderView: View, FooterView: View>(
    label: String = "Calculation", 
    @ViewBuilder headerView: () -> HeaderView,
    @ViewBuilder footerView: () -> FooterView
  ) -> some View {
    NavigationLink(
      label.automaticSettingsTitleCase, 
      destination: 
        Form {
          CalculationView(viewModel: viewModel, headerView: headerView(), footerView: footerView())
        }
        .navigationBarTitle("Calculation".automaticSettingsTitleCase)
      )
  }

  func calculationLink<HeaderView: View>(
    label: String = "Calculation", 
    @ViewBuilder headerView: () -> HeaderView
  ) -> some View {
    NavigationLink(
      label.automaticSettingsTitleCase, 
      destination: 
        Form {
          CalculationView(viewModel: viewModel, headerView: headerView())
        }
        .navigationBarTitle("Calculation".automaticSettingsTitleCase)
      )
  }

  func calculationLink<FooterView: View>(
    label: String = "Calculation", 
    @ViewBuilder footerView: () -> FooterView
  ) -> some View {
    NavigationLink(
      label.automaticSettingsTitleCase, 
      destination: 
        Form {
          CalculationView(viewModel: viewModel, footerView: footerView())
        }
        .navigationBarTitle("Calculation".automaticSettingsTitleCase)
      )
  }
  func calculationLink(
    label: String = "Calculation"
  ) -> some View {
    NavigationLink(
      label.automaticSettingsTitleCase,
      destination:
        Form {
          CalculationView(viewModel: self.viewModel)
        }
        .navigationBarTitle("Calculation".automaticSettingsTitleCase)
      )
  }

  func smoothingLink(
    label: String = "Smoothing"
  ) -> some View {
    NavigationLink(
      label.automaticSettingsTitleCase, 
      destination: 
        Form {
          SmoothingView(
            viewModel: self.viewModel,
             footerView: SettingsView.smoothingSectionFooter(self)() 
          )
        }
        .navigationBarTitle("Smoothing".automaticSettingsTitleCase)
      )
  }
}

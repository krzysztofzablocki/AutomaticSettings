// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI
import AutomaticSettings

import UIKit



extension SettingsView {

// MARK: - Views

struct SettingsView<HeaderView: View, FooterView: View>: View, AutomaticSettingsViewDSL {
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


  /// `Group` containing all Settings views
  func settings() -> some View {
    Group {
       Group { 
        Section(header: Text("Calculation".settings_titleCase)) {
          CalculationView(
            viewModel: self.viewModel
          )
        }
       } 
    }
  }

}

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
    Group {
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


// MARK: -

/// All generated section links:
    // Group { 
      // calculationLink()
    // } 

// MARK: - Top Level Link wrappers


  func calculationLink<HeaderView: View, FooterView: View>(
    label: String = "Calculation", 
    @ViewBuilder headerView: () -> HeaderView,
    @ViewBuilder footerView: () -> FooterView
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          CalculationView(viewModel: viewModel, headerView: headerView(), footerView: footerView())
        }
        .navigationBarTitle("Calculation".settings_titleCase)
      )
  }

  func calculationLink<HeaderView: View>(
    label: String = "Calculation", 
    @ViewBuilder headerView: () -> HeaderView
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          CalculationView(viewModel: viewModel, headerView: headerView())
        }
        .navigationBarTitle("Calculation".settings_titleCase)
      )
  }

  func calculationLink<FooterView: View>(
    label: String = "Calculation", 
    @ViewBuilder footerView: () -> FooterView
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          CalculationView(viewModel: viewModel, footerView: footerView())
        }
        .navigationBarTitle("Calculation".settings_titleCase)
      )
  }

  func calculationLink(
    label: String = "Calculation"
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          CalculationView(
            viewModel: self.viewModel
          )
        }
        .navigationBarTitle("Calculation".settings_titleCase)
      )
  }
}

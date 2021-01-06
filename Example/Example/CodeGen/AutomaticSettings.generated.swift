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
        Section(header: Text("Smoothing".settings_titleCase)) {
          SmoothingView(
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
    Group {
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

  func smoothingLink<HeaderView: View, FooterView: View>(
    label: String = "Smoothing", 
    @ViewBuilder headerView: () -> HeaderView,
    @ViewBuilder footerView: () -> FooterView
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          SmoothingView(viewModel: viewModel, headerView: headerView(), footerView: footerView())
        }
        .navigationBarTitle("Smoothing".settings_titleCase)
      )
  }

  func smoothingLink<HeaderView: View>(
    label: String = "Smoothing", 
    @ViewBuilder headerView: () -> HeaderView
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          SmoothingView(viewModel: viewModel, headerView: headerView())
        }
        .navigationBarTitle("Smoothing".settings_titleCase)
      )
  }

  func smoothingLink<FooterView: View>(
    label: String = "Smoothing", 
    @ViewBuilder footerView: () -> FooterView
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          SmoothingView(viewModel: viewModel, footerView: footerView())
        }
        .navigationBarTitle("Smoothing".settings_titleCase)
      )
  }

  func smoothingLink(
    label: String = "Smoothing"
  ) -> some View {
    NavigationLink(
      label.settings_titleCase, 
      destination: 
        Form {
          SmoothingView(
            viewModel: self.viewModel
          )
        }
        .navigationBarTitle("Smoothing".settings_titleCase)
      )
  }
}

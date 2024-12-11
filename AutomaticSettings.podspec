Pod::Spec.new do |s|
  s.name             = 'AutomaticSettings'
  s.version          = '1.2.1'
  s.summary          = 'Data driven settings UI.'

  s.description      = <<-DESC
  Almost every app contain some kind of settings screens, most apps usually contain debug settings along user facing ones, the implementation of those screens in UIKit could really get complicated, emergence of SwiftUI had simplified this a lot, but I believe this could be streamlined even more by leveraging data driven approach and Sourcery.
                       DESC

  s.homepage         = 'https://github.com/krzysztofzablocki/AutomaticSettings'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'krzysztofzablocki' => 'krzysztof.zablocki@pixle.pl' }
  s.source           = { :git => 'https://github.com/krzysztofzablocki/AutomaticSettings.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/merowing_'

  s.ios.deployment_target = '15.0'

  s.source_files = 'Sources/AutomaticSettings/**/*'
  s.frameworks = 'SwiftUI'
end

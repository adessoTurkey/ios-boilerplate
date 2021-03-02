# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'ios-boilerplate' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ios-boilerplate

  # Utils
  pod 'SwiftLint', '~> 0.41.0' # A tool to enforce Swift style and conventions.
  pod 'Swifter', '~> 1.5.0', :configurations => ['Swifter']
  pod 'CocoaDebug', '1.4.8', :configurations => ['Development','Swifter']
  pod 'CocoaLumberjack/Swift' # Powerful & flexible logging framework
  pod 'Alamofire' , '~> 5.1.0'
  pod 'CodableAlamofire', '~> 1.2.1'
  pod 'RxSwift'
  
  target 'ios-boilerplateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ios-boilerplateUITests' do
    # Pods for testing
  end

end

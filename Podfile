# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

workspace 'ios-boilerplate'

# Comment the next line if you don't want to use dynamic frameworks
use_frameworks!

def ios_boilerplate_pods
  pod 'Alamofire' , '~> 5.1.0'
  pod 'CodableAlamofire'
  pod 'RxSwift'
  pod 'SwiftLint'
end

def adesso_newtwork_pods
  pod 'Alamofire' , '~> 5.1.0'
  pod 'CodableAlamofire'
  pod 'RxSwift'
  pod 'SwiftLint'
end

target 'ios-boilerplate' do

  # Pods for ios-boilerplate
	ios_boilerplate_pods

  target 'ios-boilerplateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ios-boilerplateUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'AdessoNetwork' do

  project 'Modules/AdessoNetwork/AdessoNetwork.xcodeproj'

  # Pods for AdessoNetwork
  adesso_newtwork_pods
end

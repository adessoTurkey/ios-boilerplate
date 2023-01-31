# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'ios-boilerplate' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ios-boilerplate

  # Utils
  pod 'CocoaDebug', '1.7.1', :configurations => ['Development','Swifter']

  target 'ios-boilerplateTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ios-boilerplateUITests' do
    # Pods for testing
  end

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
  end
 end
end

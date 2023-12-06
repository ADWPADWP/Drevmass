# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Drevmass' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'SnapKit', '~> 5.6.0'
  pod 'Alamofire', '~> 5.5.0'
  pod 'SVProgressHUD'
  pod 'SDWebImage', '~> 5.0'
  pod 'Localize-Swift', '~> 3.2'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'YouTubePlayer'
  # Pods for Drevmass

  target 'DrevmassTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DrevmassUITests' do
    # Pods for testing
  end
  # Setup target iOS version for all pods after install
  # Setup target iOS version for all pods after install
  post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
        end
    end
  end
end

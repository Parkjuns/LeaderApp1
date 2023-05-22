# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LeaderApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LeaderApp

pod 'Alamofire'
pod 'KakaoSDK'
pod 'JWTDecode', '~> 3.0'
pod 'AlamofireImage', '~> 4.1'

post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
  end
end

end

# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'Marvelopedia' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Marvelopedia

  # plugin 'cocoapods-keys', {
  #   :project => "Marvelopedia",
  #   :keys => [
  #     "MarvelApiKey",
  #     "MarvelPrivateKey"
  #   ]}


pod 'SwiftSoup'
pod 'SwiftGen'
pod 'RxSwift' # ,'~> 3.0.0-beta.2'
pod 'Moya/RxSwift' # ,'~> 8.0.0-beta.6'
pod 'Moya-ObjectMapper/RxSwift', :git => 'https://github.com/ivanbruel/Moya-ObjectMapper'
pod 'CryptoSwift'
pod 'Dollar'
pod 'Kingfisher'
pod 'Reusable'

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end

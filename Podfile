# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

workspace 'FreeMarket'
project 'FreeMarket.xcodeproj'
project 'FreeMarketUI/FreeMarketUI.xcodeproj'

target 'FreeMarket' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FreeMarket
  
  pod 'Kingfisher', '~> 5.0'
  pod 'Alamofire', '~> 4.0'
  pod 'lottie-ios'
  pod 'Result', '~> 4.0.0'
  pod 'SwiftyJSON', '~> 4.0'

  target 'FreeMarketTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Nimble', '~> 6.0.0'
  end
  
  target 'FreeMarketUITests' do
      inherit! :search_paths
      # Pods for testing
      pod 'KIF', :configurations => ['Debug']
  end

end

target 'FreeMarket' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # Pods for FreeMarket
    
    pod 'SnapKit', '~> 4.0.0'
    
end

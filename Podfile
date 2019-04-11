# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'FreeMarket' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # ignore all warnings from all pods
    inhibit_all_warnings!
    
    # Pods for FreeMarket
    
    pod 'Kingfisher', '~> 5.0'
    pod 'Alamofire', '~> 4.0'
    pod 'lottie-ios'
    pod 'Result', '~> 4.0.0'
    pod 'SwiftyJSON', '~> 4.0'
    pod 'SwiftLint'
    
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

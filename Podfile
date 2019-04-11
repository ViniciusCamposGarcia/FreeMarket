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
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
    
    target 'FreeMarketTests' do
        inherit! :search_paths
        # Pods for testing
        pod 'Result', '~> 4.0.0'
        pod 'Quick', '~> 1'
        pod 'Nimble', '~> 7'
    end
    
    target 'FreeMarketUITests' do
        inherit! :search_paths
        # Pods for testing
        pod 'KIF', :configurations => ['Debug']
    end
    
end

#############################
# Config                    #
#############################

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'Yes'
            config.build_settings['CLANG_WARN_STRICT_PROTOTYPES'] = 'Yes'
        end
    end
end

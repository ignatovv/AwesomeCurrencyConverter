source 'https://github.com/cocoapods/Specs.git'

platform :ios, '8.0'

# ignore all warnings from all pods
inhibit_all_warnings!

def appPods
    # Networking
    pod 'AFNetworking', '2.6.3'
    pod 'SDWebImage', '3.7.3'
    
    # Core Layer
    pod 'VVJSONSchemaValidation', '~> 1.5.0'
    
    # Mapping
    pod 'EasyMapping', '0.15.1'
    pod 'XMLDictionary', '1.4.1'
    
    # CoreData
    pod 'MagicalRecord', '2.3.2'
    pod 'KCOrderedAccessorFix', '0.0.1'
    
    # Dependency injection
    pod 'Typhoon', '3.4.3'
    
    # UI & Storyboard routing
    pod 'FXBlurView', '1.6.4'
    
    # Presentation Pod
    pod 'iCarousel', '~> 1.8.2'
    
    # Helpers
    pod 'ViperMcFlurry', :git => 'https://github.com/rambler-digital-solutions/ViperMcFlurry.git', :tag => '1.1.4'
    pod 'RamblerTyphoonUtils/AssemblyCollector', :git => 'https://github.com/rambler-digital-solutions/RamblerTyphoonUtils.git', :tag => '1.2.0'

end

def testPods
    pod 'OCMock', '3.3'
    pod 'OHHTTPStubs', '3.1.12'
    pod 'RamblerTyphoonUtils/AssemblyTesting', :git => 'https://github.com/rambler-digital-solutions/RamblerTyphoonUtils.git', :tag => '1.2.0'
end

target 'AwesomeCurrencyConverter' do
    appPods
end

target 'AwesomeCurrencyConverterTests’ do
    appPods
    testPods
end

# fix ENABLE_STRICT_OBJC_MSGSEND for KCOrderedAccessorFix POD
post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        if target.name == 'Pods-KCOrderedAccessorFix' or target.name == 'Pods-test-KCOrderedAccessorFix' or target.name == 'Pods-AwesomeCurrencyConverterTests-KCOrderedAccessorFix' or target.name == 'KCOrderedAccessorFix'
            target.build_configurations.each do |config|
                config.build_settings['ENABLE_STRICT_OBJC_MSGSEND'] = 'NO'
            end
        end
    end
end

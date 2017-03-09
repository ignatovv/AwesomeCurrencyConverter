source 'https://github.com/cocoapods/Specs.git'

platform :ios, '8.0'

# ignore all warnings from all pods
inhibit_all_warnings!

def appPods
    # Networking
    pod 'AFNetworking', '2.6.3'
    
    # Mapping
    pod 'EasyMapping', '0.15.1'
    pod 'XMLDictionary', '1.4.1'
    
    # Dependency injection
    pod 'Typhoon', '3.4.3'
    
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

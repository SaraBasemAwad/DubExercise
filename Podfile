# Uncomment the next line to define a global platform for your project
workspace 'DubizzleSample.xcworkspace'
use_frameworks!
platform :ios, '10.0'
inhibit_all_warnings!
use_modular_headers!

def common
  pod 'ReactiveSwift', '6.2.1'
  pod 'ReactiveCocoa', '10.2.0'
  pod 'RestKit/Network', '0.27.3'
  pod 'Moya/ReactiveSwift', '14.0.0'
  pod 'Wormholy', '1.5.0', :configurations => ['Debug']
  pod 'XCGLogger'
  pod 'SDWebImage'
end

def test_common
#  pod 'Kiwi'
#  pod 'Quick'
#  pod 'Nimble'
#  pod 'Cuckoo'
end

target 'DubizzleSample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for DubizzleSample
 common
 test_common
 
#  target 'DubizzleSampleTests' do
#    inherit! :search_paths
#    # Pods for testing
#    test_common
#  end
#
#  target 'DubizzleSampleUITests' do
#    # Pods for testing
#    test_common
#  end
end

target 'Domain' do
  project 'common-ios/Domain/Domain'
  common

  target 'DomainTests' do
    test_common
  end
end

target 'Platform' do
  project 'common-ios/Platform/Platform'
  common

  target 'PlatformTests' do
    test_common
  end
end

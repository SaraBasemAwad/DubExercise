workspace 'DubizzleSample.xcworkspace'
use_frameworks!
platform :ios, '10.0'
inhibit_all_warnings!
use_modular_headers!

def common
  pod 'ReactiveSwift'
  pod 'ReactiveCocoa'
  pod 'RestKit/Network'
  pod 'Moya/ReactiveSwift'
  pod 'Wormholy', :configurations => ['Debug']
  pod 'XCGLogger'
  pod 'SDWebImage'
end

def test_common
  pod 'Kiwi'
  pod 'Quick'
  pod 'Nimble'
  pod 'Cuckoo'
end

target 'DubizzleSample' do
 common
 test_common
 
  target 'DubizzleSampleTests' do
    test_common
  end
end

target 'Domain' do
  project 'common-ios/Domain/Domain'
  common

#  target 'DomainTests' do
#    test_common
#  end
end

target 'Platform' do
  project 'common-ios/Platform/Platform'
  common

  target 'PlatformTests' do
    test_common
  end
end

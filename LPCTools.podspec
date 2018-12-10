#
# Be sure to run `pod lib lint LPCTools.podspec' to ensure this is a valid spec before submitting.
#
# run 'pod trunk push LPCTools.podspec' to push

Pod::Spec.new do |s|
  s.name             = 'LPCTools'
  s.version          = '0.3.1'
  s.summary          = 'a component of Tools on iOS'
  s.description      = <<-DESC
  李沛池工具汇总、5年iOS架构经验总结出的一套用于快速搭建新启动App的框架、持续完善、普惠天下
                       DESC
  s.homepage         = 'https://github.com/GodlikeLPC/LPCTools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Godlike' => 'godlikelpc@126.com' }
  s.source           = { :git => 'https://github.com/GodlikeLPC/LPCTools.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  
  s.source_files = 'LPCSource/*.{h,m}','LPCSource/**/*.{h,m}','LPCSource/**/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'LPCTools' => ['LPCTools/Assets/*.png']
  # }

  s.public_header_files = 'LPCSource/*.h','LPCSource/**/*.h','LPCSource/**/**/*.h'
  s.frameworks = 'UIKit', 'MapKit', 'CoreLocation'
  s.dependency 'AFNetworking', 'JSONModel'
  
  s.prefix_header_contents = '#import "LPCToolPrefix.h"'
end

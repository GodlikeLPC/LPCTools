#
# Be sure to run `pod lib lint LPCTools.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = 'LPCTools'
  s.version          = '0.3.0'
  s.summary          = 'a component of Tools on iOS'
  s.description      = <<-DESC
  李沛池工具汇总、5年iOS架构经验总结出的一套用于快速搭建新启动App的框架、持续完善、普惠天下
                       DESC
  s.homepage         = 'https://github.com/lipeichi/LPCTools'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Godlike' => 'godlikelpc@126.com' }
  s.source           = { :git => 'https://github.com/lipeichi/LPCTools.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  
  s.source_files = 'LPCSource/*.(h,m)','LPCSource/**/*.h','LPCSource/**/**/*.(h,m)'
  
  # s.resource_bundles = {
  #   'LPCTools' => ['LPCTools/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

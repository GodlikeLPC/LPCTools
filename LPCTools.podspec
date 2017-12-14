#
#  Be sure to run `pod spec lint LPCTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = 'LPCTools'
s.version      = '0.2.0'
s.summary      = 'a component of Tools on iOS'
s.homepage     = 'https://github.com/lipeichi/LPCTools'
s.description  = <<-DESC
李沛池工具汇总、5年iOS架构经验总结出的一套用于快速搭建新启动App的框架、持续完善、普惠天下
DESC
s.license      = 'MIT'
s.authors      = {'Godlike' => 'godlikelpc@126.com'}
s.platform     = :ios, '10.0'
s.source       = {:git => 'https://github.com/lipeichi/LPCTools.git', :tag => s.version}
s.source_files = 'LPCGodlike/*.{h,m}'
s.public_header_files = 'LPCGodlike/LPCTools.h'
s.dependency     "AFNetworking"
s.dependency     "MBProgressHUD"
s.requires_arc = true

# 文件夹分类

  s.subspec 'LPCTools' do |ss|
    ss.dependency 'LPCTools/LPCBaseKit'
    ss.source_files = 'LPCGodlike/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/*.h'
  end

  s.subspec 'LPCDefine' do |ss|
    ss.source_files = 'LPCGodlike/LPCDefine/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCDefine/*.h'
  end

  s.subspec 'LPCBaseKit' do |ss|
    ss.dependency 'LPCTools/LPCDefine'
    ss.dependency 'LPCTools/LPCUIKit'
    ss.source_files = 'LPCGodlike/LPCBaseKit/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCBaseKit/*.h'
  end

  s.subspec 'LPCCategory' do |ss|
    ss.source_files = 'LPCGodlike/LPCCategory/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCCategory/*.h'
  end

  s.subspec 'LPCFoundation' do |ss|
    ss.dependency 'LPCTools/LPCBaseKit'
    ss.source_files = 'LPCGodlike/LPCFoundation/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCFoundation/*.h'
  end

  s.subspec 'LPCSDK' do |ss|
    ss.dependency 'LPCTools/LPCTools'
    ss.source_files = 'LPCGodlike/LPCSDK/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCSDK/*.h'
  end

  s.subspec 'LPCManager' do |ss|
    ss.dependency 'LPCTools/LPCBaseKit'
    ss.source_files = 'LPCGodlike/LPCManager/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCManager/*.h'
  end

  s.subspec 'LPCUI' do |ss|
    s.subspec 'LPCUIKit' do |ss|
      ss.source_files = 'LPCGodlike/LPCUI/LPCUIKit/*.{h,m}'
    ss.public_header_files = 'LPCGodlike/LPCUI/LPCUIKit/*.h'
    end

    s.subspec 'LPCUtilView' do |ss|
      s.subspec 'LPCShareView' do |ss|
        ss.dependency 'LPCTools/LPCBaseKit'
        ss.source_files = 'LPCGodlike/LPCUI/LPCUtilView/LPCShareView/*.{h,m}'
        ss.public_header_files = 'LPCGodlike/LPCUI/LPCUtilView/LPCShareView/*.h'
      end

      s.subspec 'LPCUIKit' do |ss|
        ss.source_files = 'LPCGodlike/LPCUI/LPCUtilView/LPCErrorcodeView/*.{h,m}'
        ss.public_header_files = 'LPCGodlike/LPCUI/LPCUtilView/LPCErrorcodeView/*.h'
      end

      s.subspec 'LPCUIKit' do |ss|
        ss.source_files = 'LPCGodlike/LPCUI/LPCUtilView/LPCGestureUnlockView/*.{h,m}'
        ss.public_header_files = 'LPCGodlike/LPCUI/LPCUtilView/LPCGestureUnlockView/*.h'
      end
    end
  end

end


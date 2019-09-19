#
#  Be sure to run `pod spec lint XPButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "XPButton"
  s.version      = "1.0.4"
  s.summary      = "frist Commit"
  s.description  = <<-DESC
			XPButton
                   DESC

  s.homepage     = "https://github.com/zhuxiaoping1112/UIButton-XPButton"
  s.license      = "MIT"
  s.author             = { "zhuzhu" => "849194273@qq.com" }
  s.frameworks   = 'Foundation','UIKit'
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/zhuxiaoping1112/UIButton-XPButton.git", :tag => "#{s.version}" }
  s.source_files  = "XPButton/*.{h,m}"
  s.requires_arc = true

end

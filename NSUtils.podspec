#
# Be sure to run `pod lib lint NSUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSUtils'
  s.version          = '0.2.2'
  s.summary          = 'A handy set of functions and extensions for your project.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A handy set of functions and extensions for your project. A project full of helper functions and extensions to give you a boost when starting a new project.
                       DESC

  s.homepage         = 'https://github.com/netsells/NSUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jackcolley' => 'jack.colley@netsells.co.uk' }
  s.source           = { :git => 'https://github.com/netsells/NSUtils.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/netsells'

  s.ios.deployment_target = '10.0'

  s.source_files = 'NSUtils/Classes/**/*'
  s.swift_version = '4.0'
  
  # s.resource_bundles = {
  #   'NSUtils' => ['NSUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

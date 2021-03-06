#
# Be sure to run `pod lib lint SSSheetLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSSheetLayout'
  s.version          = '1.0.0'
  s.summary          = 'This project is written for custom collection view layout like sheet form.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
- This project is written for custom collection view layout like sheet form
- In fact, many applications need to show view like sheet, so this project focus to make the collection view scrollable horizontal and vertical. The main feature is keep top and left dock

                       DESC

  s.homepage         = 'https://github.com/ngodacdu/SSSheetLayout'
  s.screenshots      = 'https://raw.githubusercontent.com/ngodacdu/SSSheetLayout/master/Screenshots/sheetlayout.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ngô Đắc Du' => 'ngodacdu92@gmail.com' }
  s.source           = { :git => 'https://github.com/ngodacdu/SSSheetLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SSSheetLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SSSheetLayout' => ['SSSheetLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

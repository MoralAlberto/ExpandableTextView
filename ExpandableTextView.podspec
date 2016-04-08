#
# Be sure to run `pod lib lint ExpandableTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ExpandableTextView"
  s.version          = "0.1.0"
  s.summary          = "Expand your UITextView (optimized for iOS 9 and above)."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
s.description      = <<-DESC

    The main purpose of this repo is to add a UITextView within a UIToolbar and expand dynamically the height of this UIToolbar depending on the UITextView’s height. The UITextView’s content size may vary depends on the text introduced.

DESC

  s.homepage         = "https://github.com/MoralAlberto/ExpandableTextView"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Alberto Moral" => "alberto.moral.g@gmail.com" }
  s.source           = { :git => "https://github.com/MoralAlberto/ExpandableTextView.git", :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/AlbertMoral'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ExpandableTextView' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

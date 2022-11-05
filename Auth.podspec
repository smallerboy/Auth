#
# Be sure to run `pod lib lint Auth.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Auth'
  s.version          = '1.0.1'
  s.summary          = 'Auth library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'WalletConnectV2 library'

  s.homepage         = 'https://github.com/smallerboy/Auth'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'david zhang,' => 'zmao008@gmail.com' }
  s.source           = { :git => 'https://github.com/smallerboy/Auth.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'Auth/Classes/**/*'

  s.dependency 'WalletConnectPairing', '~> 1.0.1' 
  s.dependency 'WalletConnectWeb3', '~> 1.0.1'
  #s.subspec 'WalletConnectWeb3' do |ss|
   # ss.dependency "CryptoSwift", "1.6.0"
  #end

  s.swift_version = '5'

  
end

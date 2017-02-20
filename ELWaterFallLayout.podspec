#
# Be sure to run `pod lib lint ELWaterFallLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ELWaterFallLayout'
  s.version          = '0.1.0'
  s.summary          = 'A simple UICollectionFlowLayout of Waterfall effective.'
  s.description      = <<-DESC
                       This flowlayout can config horizontal/vertical item space、section space linecount at realtime
                       DESC
  s.homepage         = 'https://github.com/jinqiucheng1006@live.cn/ELWaterFallLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jinqiucheng1006@live.cn' => 'jinqiucheng@autohome.com.cn' }
  s.source           = { :git => 'https://github.com/jinqiucheng1006@live.cn/ELWaterFallLayout.git', :tag => s.version.to_s }
  s.social_media_url = 'http://www.jianshu.com/u/62fd4a3ecff1'
  s.ios.deployment_target = '8.0'
  s.source_files = 'ELWaterFallLayout/Classes/*.swift'
end

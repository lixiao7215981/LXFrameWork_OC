Pod::Spec.new do |s|
  s.name         = "LXFrameWork_OC"
  s.version      = "2.5.6"
  s.summary      = "This is my(lixiao) LXFrameWork_OC "
  s.homepage     = "https://github.com/lixiao7215981"
  s.license      = "MIT"
  s.author       = { "SuperlX" => "1019661666@qq.com" }
  s.social_media_url   = "http://weibo.com/2106002880/profile?topnav=1&wvr=6"
  s.source       = { :git => "https://github.com/lixiao7215981/LXFrameWork_OC.git", :tag => s.version }
  s.source_files  = "LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/**/*.{h,m}"
  s.resources = "LXFrameWork_OC/LXFrameWork_OC/LXFrameWork/source/**/LXFrameWork.bundle"
  s.platform     = :ios,'7.0'
  s.requires_arc = true
  s.dependency 'FMDB'
  s.dependency 'SSZipArchive'
  s.dependency 'AFNetworking'
  s.dependency 'SDWebImage'
  s.dependency 'MJRefresh'
  s.dependency 'MJExtension'
  s.dependency 'SVProgressHUD'
  s.dependency 'PureLayout'
  s.dependency 'IQKeyboardManager'
  s.dependency 'Reachability'
  #s.ios.deployment_target = "6.0"
  #s.osx.deployment_target = "10.8"
end
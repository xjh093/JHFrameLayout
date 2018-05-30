Pod::Spec.new do |s|
  s.name         = 'JHFrameLayout'
  s.summary      = 'A simple methods for frame layout. It can autolayout in version 2.0.'
  s.version      = '2.0.0'
  s.license      = { :type => 'MIT'}
  s.authors      = { 'Haocold' => 'xjh093@126.com' }
  s.homepage     = 'https://github.com/xjh093/JHFrameLayout'

  s.platform     = :ios

  s.source       = { :git => 'https://github.com/xjh093/JHFrameLayout.git', :tag => s.version}
  
  s.source_files = 'JHFrameLayout/*.{h,m}'
  s.requires_arc = true
  s.framework    = 'UIKit'

end
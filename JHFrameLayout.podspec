
Pod::Spec.new do |s|
  s.name         = 'JHUIAlertView'
  s.summary      = 'A simple custom AlertView.'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT'}
  s.authors      = { 'Haocold' => 'xjh093@126.com' }
  s.homepage     = 'https://github.com/xjh093/JHUIAlertView'

  s.platform     = :ios

  s.source       = { :git => 'https://github.com/xjh093/JHUIAlertView.git', :tag => "1.0.0"}
  
  s.source_files = 'JHUIAlertView/JHUIAlertView/*.{h,m}'
  s.requires_arc = true
  s.frameworks = 'UIKit'

end
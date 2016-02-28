
Pod::Spec.new do |s|

  s.name         = "JMRoundedCorner"
  s.version      = "1.0.0"
  s.summary      = "UIView set Corner Radius"
  s.homepage     = "https://github.com/raozhizhen/JMRoundedCorner.git"
  s.license             = { :type => "MIT", :file => "LICENSE" } 
  s.author       = { "raozhizhen" => "raozhizhen@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/raozhizhen/JMRoundedCorner.git", :tag => s.version }
  s.source_files = "JMRoundedCorner/*.{h,m}"
  s.requires_arc = true

end

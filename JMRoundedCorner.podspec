
Pod::Spec.new do |s|

  s.name         = "JMRoundedCorner"
  s.version      = "0.0.1"
  s.summary      = "Add a rounded corner to view"
  s.homepage     = "https://github.com/raozhizhen/JMRoundedCorner.git"
  s.author       = { "raozhizhen" => "raozhizhen@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/raozhizhen/JMRoundedCorner.git", :tag => s.version }
  s.source_files = "JMRoundedCorner/*.{h,m}"
  s.requires_arc = true

end

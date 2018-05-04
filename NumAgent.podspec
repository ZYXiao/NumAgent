Pod::Spec.new do |s|
  s.name         = "NumAgent"

  s.version      = "0.0.1"

  s.summary      = "Number format utils."

  s.homepage     = "https://github.com/ZYXiao/NumAgent"

  s.license      = "MIT"

  s.author       = { "ZYXiao" => "304983615@qq.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ZYXiao/NumAgent.git", :tag => "0.0.1" }

  s.source_files  = "NumAgent/*.{h,m}"

  s.requires_arc = true
end

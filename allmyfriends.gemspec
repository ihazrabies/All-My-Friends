# coding utf-8
lib = File.expand_path(".../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name			 = "NAME"
  spec.version		 = "1.0"
  spec.authors		 = ["CLARK TEEPLE"]
  spec.email		 = ["cteeple91@gmail.com"]
  spec.summary		 = %q{project summary}
  spec.description	 = %q{longer description}
  spec.homepage		 = "http://projectdomain.com"
  spec.license		 = "MIT"
  
  spec.files		 = ["lib/NAME.rb"]
  spec.executables   = ["bin/allmyfriends.rb"]
  spec.test_files	 = ["tests/test_NAME.rb"]
  spec.require_paths = ["lib"]
end 
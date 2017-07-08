$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'defuser/version'

Gem::Specification.new do |s|
  s.name     = 'defuser'
  s.version  = ::Defuser::VERSION
  s.authors  = ['Cameron Dutro']
  s.email    = ['camertron@gmail.com']
  s.homepage = 'https://github.com/camertron/defuser'

  s.description = s.summary = "Automatic solver for Lumosity's Fuse Clues game."

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.require_path = 'lib'
  s.executables  = ['defuse']

  s.files = Dir['{lib,spec}/**/*', 'README.md', 'defuser.gemspec', 'LICENSE']
end

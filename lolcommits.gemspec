lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lolcommits/version'

Gem::Specification.new do |s|
  s.name        = Lolcommits::GEM_NAME.dup
  s.version     = Lolcommits::VERSION.dup

  s.authors     = ['Matthew Rothenberg', 'Matthew Hutchinson']
  s.email       = ['mrothenberg@gmail.com', 'matt@hiddenloop.com']
  s.homepage    = 'http://mroth.github.com/lolcommits/'
  s.license     = 'LGPL-3'
  s.summary     = 'Capture webcam image on git commit for lulz.'

  s.description = <<-DESC
  lolcommits takes a snapshot with your webcam every time you git commit code,
  and archives a lolcat style image with it. It's selfies for software
  developers. `git blame` has never been so much fun.
DESC

  s.post_install_message = <<-POSTINSTALL
  -------------------------------------------------------------------------------

  Lolcommits: A quick message from the dev team! All plugins have now been
  extracted to external gems. To continue using a (previously built-in) plugin,
  first install the gem then configure to enable it e.g.

    gem install lolcommits-twitter
    lolcommits --config

  See https://github.com/mroth/lolcommits/wiki/Configuring-Plugins for details.

  Future plugin developers should check out this repo to get started:
  https://github.com/lolcommits/lolcommits-plugin-sample

  Happy Lol'ing!

  -------------------------------------------------------------------------------
POSTINSTALL

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = 'lolcommits'
  s.require_paths = ['lib']

  # non-gem dependencies
  s.required_ruby_version = '>= 2.0'
  s.requirements << 'imagemagick'
  s.requirements << 'a webcam'

  # hold back upgrading (and why)
  s.add_development_dependency('aruba', '=0.6.2') # upgrading requires a lot of test code changes
  s.add_development_dependency('rake', '=10.5.0') # ~> 11+ introduces lots of warnings from other deps
  s.add_development_dependency('cucumber', '~> 2.4.0') # > 2.4 breaks aruba, since aruba_timeout_seconds not set
  s.add_runtime_dependency('net-http-persistent', '=2.9.4') # ~> 3+ requires Ruby 2.1
  s.add_runtime_dependency('public_suffix', '~>2.0.0') # ~> 3+ requires Ruby 2.1

  # core
  s.add_runtime_dependency('methadone', '~> 1.9.5')
  s.add_runtime_dependency('mercurial-ruby', '~> 0.7.12')
  s.add_runtime_dependency('mini_magick', '~> 4.6.0')
  s.add_runtime_dependency('launchy', '~> 2.4.3')
  s.add_runtime_dependency('open4', '~> 1.3.4')
  s.add_runtime_dependency('git', '~> 1.3.0')

  # included plugins
  s.add_runtime_dependency('lolcommits-loltext', '~> 0.0.4')

  # development & test gems
  s.add_development_dependency('rdoc')
  s.add_development_dependency('pry')
  s.add_development_dependency('rubocop')
  s.add_development_dependency('minitest')
  s.add_development_dependency('coveralls')
  s.add_development_dependency('ffaker')
end

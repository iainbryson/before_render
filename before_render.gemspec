# -*- encoding: utf-8 -*-
require File.expand_path('../lib/before_render/version', __FILE__)

Gem::Specification.new do |gem|
    gem.authors       = ["iainbryson", "nilesh", "tknarr"]
    gem.email         = ["iain@iain-bryson.ca","mail@nilesh.org", "tknarr@silverglass.org"]
    gem.description   = %q{provides a before_render method for action_controllers in Rails 5 and 6}
    gem.summary       = %q{before_render will be called after your action and before the view is rendered}
    gem.homepage      = "https://github.com/iainbryson/before_render"

    gem.files         = `git ls-files`.split($\)
    gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
    gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
    gem.name          = "before_render"
    gem.require_paths = ["lib"]
    gem.version       = BeforeRender::VERSION
    gem.licenses      = ["MIT"]

    gem.add_dependency 'rails', '> 5.0'

    gem.add_development_dependency "bundler", "> 1.17"
    gem.add_development_dependency "rake", "~> 12.3"
    gem.add_development_dependency "minitest", "~> 5.0"
end

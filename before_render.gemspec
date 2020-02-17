# frozen_string_literal: true

require File.expand_path('lib/before_render/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors = %w[iainbryson nilesh tknarr]
  gem.email         = ['iain@iain-bryson.ca', 'mail@nilesh.org', 'tknarr@silverglass.org']
  gem.description   = 'provides a before_render method for action_controllers in Rails 5 and 6'
  gem.summary       = 'before_render will be called after your action and before the view is rendered'
  gem.homepage      = 'https://github.com/iainbryson/before_render'

  gem.files         = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'before_render'
  gem.require_paths = ['lib']
  gem.version       = BeforeRender::VERSION
  gem.licenses      = ['MIT']

  gem.add_dependency 'rails', '> 5.0'

  gem.add_development_dependency 'bundler', '> 1.17'
  gem.add_development_dependency 'minitest', '~> 5.0'
  gem.add_development_dependency 'rake', '~> 12.3'
end

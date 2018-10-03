# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cabify_challenge/version'

Gem::Specification.new do |spec|
  spec.name          = 'cabify_challenge'
  spec.version       = CabifyChallenge::VERSION
  spec.authors       = ['Matias Garcia']
  spec.email         = ['garcia.matias92@gmail.com']

  spec.summary       = 'Cabify Ruby Challenge'
  spec.description   = 'Solution for Cabify Ruby Challenge'
  spec.homepage      = 'https://github.com/matiasgarcia/cabify_challenge'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    REJECTABLE_REGEXP = %r{^(test|spec|features)/}
    `git ls-files -z`.split("\x0").reject { |f| f.match(REJECTABLE_REGEXP) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.59'
  spec.add_development_dependency 'pry'
end

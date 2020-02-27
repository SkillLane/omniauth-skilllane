
require File.expand_path(
  File.join('..', 'lib', 'omniauth', 'skilllane', 'version'),
  __FILE__
)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-skilllane"
  spec.version       = Omniauth::Skilllane::VERSION
  spec.authors       = ["Chatthana Janethanakarn"]
  spec.email         = ["chatthana.janethanakarn@scb.co.th"]

  spec.summary       = "Skilllane Identity strategy for OmniAuth"
  spec.description   = "Skilllane Identity strategy for OmniAuth"
  spec.homepage      = "https://www.skilllane.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://www.skilllane.com"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com"
    spec.metadata["changelog_uri"] = "https://github.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.0"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "omniauth"
  spec.add_runtime_dependency "omniauth-oauth2"
end

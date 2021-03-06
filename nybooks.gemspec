
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nybooks/version"

Gem::Specification.new do |spec|
  spec.name          = "nybooks"
  spec.version       = Nybooks::VERSION
  spec.authors       = ["KTAmoguis"]
  spec.email         = ["ktamoguis@gmail.com"]

  spec.summary       = %q{Lists NY Times Best Seller books according to category}
  spec.description   = %q{Lists NY Times Best Seller books according to category. Also gives brief information about each book}
  spec.homepage      = "https://github.com/ktamoguis/nybooks.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files`.split($\)
  spec.bindir        = "bin"
  spec.executables   = ["nybooks"]
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"

end

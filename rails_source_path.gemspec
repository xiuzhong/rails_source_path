
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_source_path/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_source_path"
  spec.version       = RailsSourcePath::VERSION
  spec.authors       = ["Leo Li"]
  spec.email         = ["lxz.tty@gmail.com"]

  spec.summary       = %q{Remember the route before entering the current controller and use later}
  spec.description   = %q{In rails project, one common case is one form used to create or update
    an object can be routed from more than one page, when the object is created or updated, it
    should be redirected back to wherever it came from. Rails redirect_back doesn't work in this
    case because: 1. redirect_back in create/update action will go back to new/edit form. 2.
    usually the form is re-rendered if any error exists, which basically breaks the redirect_back.
    rails-source-path can hanlde this by explicily specifying the entry actions and remember the
    previous route in session store, hence can be used in the whole controller. Also a helper
    method is providered so it can be used in view like 'back' or 'cancel' button.}
  spec.homepage      = "https://github.com/xiuzhong/rails_source_path"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
    spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

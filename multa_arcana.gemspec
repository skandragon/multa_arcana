require File.expand_path('../lib/multa_arcana/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "multa_arcana"
  gem.version     = MultaArcana::VERSION
  gem.authors     = ["Michael Graff"]
  gem.email       = ["explorer@flame.org"]
  gem.homepage    = "http://github.com/skandragon/multa_arcana"
  gem.summary     = "Keep secrets secret"
  gem.description = "Store secrets in one file, and access them from anywhere inside a Rails app (or any Ruby code)."
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  gem.test_files = Dir["spec/**/*"]

  gem.add_development_dependency 'rspec'
  
  unless ENV['CI']
    if RUBY_PLATFORM =~ /java/
      gem.add_development_dependency 'ruby-debug'
    elsif RUBY_VERSION == '1.9.3'
      gem.add_development_dependency 'debugger', '~> 1.1.2'
    end
  end
end

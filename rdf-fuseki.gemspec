# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdf/fuseki/version'

Gem::Specification.new do |spec|
  spec.name          = "rdf-fuseki"
  spec.version       = RDF::Fuseki::VERSION
  spec.authors       = ["Jacob Brown"]
  spec.email         = ["j.h.brown@tcu.edu"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_runtime_dependency     'rdf',            '>= 0.3.11.1'
  spec.add_runtime_dependency     'linkeddata',     '>= 0.3.5'
  spec.add_runtime_dependency     'sparql-client',  '>= 0.3.3'
  spec.add_runtime_dependency     'equivalent-xml', '>= 0.3.0'
end

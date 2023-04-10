# frozen_string_literal: true

require_relative "lib/fitness_ontology/version"

Gem::Specification.new do |spec|
  spec.name = "fitness_ontology"
  spec.version = FitnessOntology::VERSION
  spec.authors = ["John Faucett"]
  spec.email = ["jwaterfaucett@gmail.com"]

  spec.summary = "Health, Fitness and Exercise Ontology"
  spec.description = "Health, Fitness and Exercise Ontology"
  spec.homepage = "https://github.com/DataDaoDe/rb-fitness_calculator"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "linkeddata", "~> 3"
end

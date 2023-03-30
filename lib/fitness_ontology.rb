require "rdf"
require "sparql"
require "rdf/rdfxml"

module FitnessOntology
  autoload :VERSION, "fitness_ontology/version"

  module Repos
    autoload :Base, "fitness_ontology/repos/base"
    autoload :ExerciseDatabase, "fitness_ontology/repos/exercise_database"
  end
end

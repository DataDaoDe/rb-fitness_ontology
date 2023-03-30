module FitnessOntology
  module Repos
    class ExerciseDatabase < Base

      def connect
        @repo = RDF::Repository.load(
          load_filepath("exercise-database-ontology.owl")
        )
      end

    end
  end
end
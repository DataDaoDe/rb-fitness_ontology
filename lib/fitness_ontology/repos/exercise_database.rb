module FitnessOntology
  module Repos
    class ExerciseDatabase < Base
      def prefix
        @prefix ||= %(
          PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
          PREFIX owl: <http://www.w3.org/2002/07/owl#>
          PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
          PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
          PREFIX edb: <http://www.semanticweb.org/johnfaucett/ontologies/2023/2/exercise-database#>
        )
      end

      def connect
        @repo = RDF::Repository.load(
          load_filepath("exercise-database-ontology.owl")
        )
      end

      def query(query)
        prefixed_query = [prefix, query].join("\n")
        q = SPARQL.parse(prefixed_query)
        repo.query(q)
      end

      def exercises_by(types: [])
        if types.size > 1
          q = %(
            SELECT *
            WHERE {
              ?subject rdf:type ?exercise_type .
              FILTER (?exercise_type IN ( #{types.join(",")} )  ) .
            }
          )
          query(q).map do |result|
            {exercise: result[:subject].fragment,
             type: result[:exercise_type].fragment}
          end
        else
          q = %(
            SELECT *
            WHERE {
              ?subject rdf:type #{types.first} .
            }
          )
          query(q).map do |result|
            {exercise: result[:subject].fragment,
             type: types.first.split(":").last}
          end
        end
      end

      def labels_for(name)
        results = {}
        query("SELECT * WHERE { edb:#{name} rdfs:label ?label }").map do |x|
          results[x[:label].language] = x[:label].value
        end
        results
      end
    end
  end
end

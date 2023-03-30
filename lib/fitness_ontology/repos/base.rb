module FitnessOntology
  module Repos
    class Base
      ROOT_DIR = begin
        f = File.absolute_path(__FILE__)
        4.times { f = File.dirname(f) }
        f
      end

      attr_reader :repo

      def initialize
        @repo = connect
      end

      def connect
        raise "implement"
      end 

      def load_filepath(filename)
        File.join(ROOT_DIR, "data", filename)
      end
    end
  end
end
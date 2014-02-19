require 'sparql/client'
require 'rdf/fuseki/client'
require 'rdf/fuseki/query'

module RDF
  module Fuseki
    class Repository < ::SPARQL::Client::Repository
    
      def initialize(endpoint, options = {})
        @options = options.dup
        @client  = Client.new(endpoint, options)
      end
      
      def insert_statement(statement)
        unless has_statement?(statement)
          @client.set("INSERT DATA { #{dump_statement(statement)} }")
        end
      end
      
      def insert_statements(statements)
        @client.set("INSERT DATA { #{dump_statements(statements)} }")
      end
      
      def delete_statements(statements)
        @client.set("DELETE DATA { #{dump_statements(statements)} }")
      end
      
      def delete_statement(statement)
        if has_statement?(statement)
          dump = dump_statement(statement)
          @client.set("DELETE DATA { #{dump} }")
        end
      end
      
      def dump_statements(statements)
        RDF::Writer.for(:ntriples).dump(statements)
      end
      
      def dump_statement(statement); dump_statements([statement]); end
      
      def writable?; true; end
      def durable?;  true; end      
      def empty?; count.zero?; end
    
    end
  end
end

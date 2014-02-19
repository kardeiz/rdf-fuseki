module RDF
  module Fuseki
    class Client < ::SPARQL::Client

      def uri_constructor(path)
        ( val = options[:dataset] ) ? File.join(val, path) : path
      end

      def sparql_uri
        @sparql_uri ||= uri_constructor("/query")
      end

      def update_uri
        @update_uri ||= uri_constructor("/update")
      end
      
      def request(query, headers = {}, &block)
        request = Net::HTTP::Post.new sparql_uri, @headers.merge(headers)
        request.set_form_data({
          'query' => query.to_s
        })
        handle_response request, &block
      end

      def set(query)
        request = Net::HTTP::Post.new update_uri
        request.set_form_data({
          'update' => query
        })
        handle_response request
      end

      protected

      def handle_response request, &block
        response = @http.request @url, request
        if block_given?
          block.call response
        else
          response
        end
      end
    end
  end
end

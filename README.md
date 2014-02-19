# RDF::Fuseki

A very minimal `RDF::Repository` implementation for Fuseki.

Initialize the repository like:

    repo = RDF::Fuseki::Repository.new('http://localhost:3030/', { :dataset => '/ds' })

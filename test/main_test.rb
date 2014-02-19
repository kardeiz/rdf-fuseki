require 'minitest/spec'
require 'minitest/autorun'

require 'rdf/fuseki'

describe RDF::Fuseki::Repository do

  before do
    @repo = RDF::Fuseki::Repository.new('http://localhost:3000/', {
      :dataset => '/ds'
    })
  end

  after do
    @repo.clear!
  end


  it "tests must run" do
    true.must_be :==, true
  end
  
  it "must count" do
    @repo.count.must_be :==, 0
  end

  it "must add a statement" do
    st = RDF::Statement.new(RDF::URI('info:repository/test'), RDF::DC.title, "Test")
    @repo.insert_statement(st)
    @repo.count.must_be :==, 1
  end

end

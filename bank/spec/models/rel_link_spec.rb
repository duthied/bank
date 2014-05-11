# /spec/models/rel_link_spec.rb
require 'spec_helper'

describe RelLink do

	@rel = 'self'
	@uri = 'http://foo.com'
	let(:rel_link) { RelLink.new(@rel, @uri) }
	subject { rel_link }

  it { should respond_to(:type, :uri) }

  it 'should report the rel correctly' do
    expect(subject.type).to eq(@uri)
  end

  it 'should report the uri' do
    expect(subject.uri).to eq(@type)
  end
  
end

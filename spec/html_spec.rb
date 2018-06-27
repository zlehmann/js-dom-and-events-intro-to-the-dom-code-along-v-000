require "pry"

RSpec.describe 'structure' do

  context 'within index.html' do

    it 'contains a <body> tag' do
      body = parsed_html.search('body')[0]
      expect(body).to_not be_nil, "No <body> tag was found"
    end

  end

end

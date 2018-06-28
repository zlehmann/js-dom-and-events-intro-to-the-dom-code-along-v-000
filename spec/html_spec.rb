require "pry"

RSpec.describe 'In this lab,' do

  context 'in index.html' do

    it 'contains a <body> tag' do
      body = parsed_html.search('body')[0]
      expect(body).to_not be_nil, "No <body> tag was found"
    end

    context 'the <body> tag' do

      it 'contains an <h1> tag' do
        h1 = parsed_html.search('h1')[0]
        expect(h1).to_not be_nil, "No <h1> tag was found"
      end

      it 'contains an <p> tag' do
        p = parsed_html.search('p')[0]
        expect(p).to_not be_nil, "No <p> tag was found"
      end

      it 'contains an <a> tag' do
        a = parsed_html.search('a')[0]
        expect(a).to_not be_nil, "No <a> tag was found"
      end

      it 'contains an <table> tag' do
        table = parsed_html.search('table')[0]
        expect(table).to_not be_nil, "No <table> tag was found"
      end

    end

    context 'the <table> tag' do

      it 'contains a <thead> tag' do
        table = parsed_html.search('table')[0]
        expect(table.children.any? {|child| child.name == "thead"}).to be true
      end

      it 'contains a <tbody> tag' do
        table = parsed_html.search('table')[0]
        expect(table.children.any? {|child| child.name == "thead"}).to be true
      end

    end

  end

end

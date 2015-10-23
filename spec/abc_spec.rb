require 'spec_helper'

describe Abc do
	let(:sorter) { Abc.new }

	it 'simple happy path' do
		expect(sorter.order_list("a\nb\nc")).to eq("a\nb\nc")
		expect(sorter.order_list("b\nc\na")).to eq("a\nb\nc")
		expect(sorter.order_list("c\na\nb")).to eq("a\nb\nc")

	end

	xit 'sorts same letter, different case' do
		expect(sorter.order_list("Cat\ncat\nbat\nBat")).to eq("Cat\ncat\nBat\nbat")
	end

	it 'strips newlines' do
		expect(sorter.order_list("turkey\n\nostrich\n\n\npenguin\n")).to eq("ostrich\npenguin\nturkey")
	end

	it 'strips lines containing only whitespace' do
		expect(sorter.order_list("turkey\n\t\nostrich\n \n   \n\npenguin\n")).to eq("ostrich\npenguin\nturkey")
	end
end
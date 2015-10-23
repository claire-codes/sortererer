require 'spec_helper'

describe Abc do
	let(:sorter) { Abc.new }

	it 'simple happy path' do
		expect(sorter.order_list("a\nb\nc")).to eq("a\nb\nc")
		expect(sorter.order_list("b\nc\na")).to eq("a\nb\nc")
		expect(sorter.order_list("c\na\nb")).to eq("a\nb\nc")

	end

	it 'sorts alphabet with ASCII order' do
		expect(sorter.order_list("Cat\ncat\nbat\nBat", true)).to eq("Bat\nCat\nbat\ncat")
		expect(sorter.order_list("Cat\ncat\nbat\nBat", false)).to eq("Bat\nbat\ncat\nCat")
		expect(sorter.order_list("Cat\ncat\nbat\nBat")).to eq("Bat\nbat\ncat\nCat")
	end

	it 'sorts same letter, different case' do
		expect(sorter.order_list("Cat\ncat\nbat\nBat")).to eq("Bat\nbat\ncat\nCat")
	end

	it 'strips newlines' do
		expect(sorter.order_list("turkey\n\nostrich\n\n\npenguin\n")).to eq("ostrich\npenguin\nturkey")
	end

	it 'strips lines containing only whitespace' do
		expect(sorter.order_list("turkey\n\t\nostrich\n \n   \n\npenguin\n")).to eq("ostrich\npenguin\nturkey")
	end
end
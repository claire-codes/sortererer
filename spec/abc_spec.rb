require 'spec_helper'

xdescribe Abc do
	let(:sorter) { Abc.new }

	it 'simple happy path' do
		expect(sorter.order_list(['a', 'b', 'c'])).to eq(['a', 'b', 'c'])
		expect(sorter.order_list(['b', 'c', 'a'])).to eq(['a', 'b', 'c'])
		expect(sorter.order_list(['c', 'a', 'b'])).to eq(['a', 'b', 'c'])

	end

	it 'sorts same letter, different case' do
		expect(sorter.order_list(['Cat', 'cat', 'mat', 'Mat'])).to eq(['Cat', 'cat', 'Mat', 'mat'])
	end
end
require 'spec_helper'

describe Abc do
	let(:sorterer) { Abc.new }

	it 'simple happy path' do
		expect(sorterer.order_list(['a', 'b', 'c'])).to eq(['a', 'b', 'c'])
		expect(sorterer.order_list(['b', 'c', 'a'])).to eq(['a', 'b', 'c'])
		expect(sorterer.order_list(['c', 'a', 'b'])).to eq(['a', 'b', 'c'])

	end

	it 'sorts same letter, different case' do
		expect(sorterer.order_list(['Cat', 'cat', 'mat', 'Mat'])).to eq(['Cat', 'cat', 'Mat', 'mat'])
	end
end
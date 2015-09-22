require 'spec_helper'

describe Abc do
	let(:sorterer) { Abc.new }

	it 'should work' do
		expect(sorterer.order_list(['a', 'b', 'c'])).to eq(['a', 'b', 'c'])
		expect(sorterer.order_list(['b', 'c', 'a'])).to eq(['a', 'b', 'c'])
		expect(sorterer.order_list(['c', 'a', 'b'])).to eq(['a', 'b', 'c'])

	end
end
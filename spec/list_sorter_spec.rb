require 'spec_helper'

describe List_Sorter do
  let(:sorter) { List_Sorter.new }

  it 'simple happy path' do
    expect(sorter.order_list("a\nb\nc")).to eq("a\nb\nc")
    expect(sorter.order_list("b\nc\na")).to eq("a\nb\nc")
    expect(sorter.order_list("c\na\nb")).to eq("a\nb\nc")
  end

  it 'sorts same letter, different case' do
    expect(sorter.order_list("Cat\ncat\nbat\nBat")).to eq("Bat\nbat\ncat\nCat")
  end

  it 'strips newlines' do
    expect(sorter.order_list("turkey\n\nostrich\n\n\npenguin\n")).to eq("ostrich\npenguin\nturkey")
  end

  it 'keeps leading and trailing whitespace on lines with text' do
    expect(sorter.order_list(" yacht\nzoo\nwitch")).to eq(" yacht\nwitch\nzoo")
    expect(sorter.order_list("yacht \nzoo\nwitch")).to eq("witch\nyacht \nzoo")
  end

  it 'strips lines containing only whitespace' do
    expect(sorter.order_list("turkey\n\t\nostrich\n \n   \n\npenguin\n")).to eq("ostrich\npenguin\nturkey")
  end

  it 'doesn\'t go crazy when given an empty list' do
    expect(sorter.order_list('')).to eq('')
  end

  describe 'optional sort arguments' do
    it 'sorts alphabet with ASCII order' do
      expect(sorter.order_list("Cat\ncat\nbat\nBat", ascii: true)).to eq("Bat\nCat\nbat\ncat")
      expect(sorter.order_list("Cat\ncat\nbat\nBat", ascii: false)).to eq("Bat\nbat\ncat\nCat")
      expect(sorter.order_list("Cat\ncat\nbat\nBat")).to eq("Bat\nbat\ncat\nCat")
    end

    it 'reverse sorts' do
      expect(sorter.order_list("b\nc\na", reverse: true)).to eq("c\nb\na")
      expect(sorter.order_list("b\nc\na", reverse: false)).to eq("a\nb\nc")
      expect(sorter.order_list("b\nc\na")).to eq("a\nb\nc")
    end

    it 'reverses and ASCII sorts' do
      expect(sorter.order_list("B\nb\nd\nD\nc\na")).to eq("a\nb\nB\nc\nd\nD")
      expect(sorter.order_list("B\nb\nd\nD\nc\na", ascii: true, reverse: true)).to eq("d\nc\nb\na\nD\nB")
    end
  end
end

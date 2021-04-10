require './lib/item'

describe Item do
  let(:item) { Item.new(name = 'wah', sell_in = 1, quality = 1, conjured = false) }
  it 'items have a sellin value' do
    expect(item.sell_in).to eq(1)
  end
  it 'items have a name' do
    expect(item.name).to eq('wah')
  end
  it 'items have a quality' do
    expect(item.quality).to eq(1)
  end
  it 'items can be to_s-ed' do
    expect(item.to_s).to eq('wah, 1, 1, conjured: false')
  end
  it 'items can be conjured' do
    expect(item.conjured).to eq(false)
  end
end

require './lib/rose'
require './lib/item'

describe GildedRose do
  context 'unconjured' do
    context 'update_quality general' do
      let(:items) { items = [Item.new('foo', 10, 10, conjured = false), Item.new('bar', 5, 50, conjured = false)] }
      it 'does not change the name' do
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq 'foo'
      end
      it 'if sellin is greater than 0, update_quality updates both sell-by and quality by 1' do
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq(9)
        expect(items[1].quality).to eq(49)
      end
      it 'if sellin is 0, update_quality updates quality by twice the given speed' do
        rose = GildedRose.new(items)
        5.times { rose.update_quality }
        expect(items[1].quality).to eq(45)
        rose.update_quality
        expect(items[1].quality).to eq(43)
        rose.update_quality
        expect(items[1].quality).to eq(41)
      end
      it 'quality of item is never negative' do
        rose = GildedRose.new(items)
        10.times { rose.update_quality }
        expect(items[0].quality).to eq(0)
        rose.update_quality
        expect(items[0].quality).to eq(0)
      end
      context 'aged brie' do
        it 'Aged Brie increases in quality the older it gets' do
          brie = Item.new('Aged Brie', 11, 10, conjured = false)
          rose = GildedRose.new([brie])
          rose.update_quality
          expect(brie.quality).to eq(11)
        end
        it 'Aged Brie increases by 2 when there are 10 days or less' do
          brie = Item.new('Aged Brie', 11, 10, conjured = false)
          rose = GildedRose.new([brie])
          5.times { rose.update_quality }
          expect(brie.quality).to eq(19)
        end
        it 'Aged Brie increases by 3 when there are 5 days or less' do
          brie = Item.new('Aged Brie', 6, 10, conjured = false)
          rose = GildedRose.new([brie])
          rose.update_quality
          expect(brie.quality).to eq(12)
          rose.update_quality
          expect(brie.quality).to eq(15)
        end
        it 'Quality of an item is never more than 50' do
          brie = Item.new('Aged Brie', 6, 10, conjured = false)
          rose = GildedRose.new([brie])
          40.times { rose.update_quality }
          expect(brie.quality).to eq(50)
        end
      end
      context 'sulfuras' do
        it 'Sulfuras never has to be sold' do
          sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 1, 80, conjured = false)
          rose = GildedRose.new([sulfuras])
          rose.update_quality
          expect(sulfuras.sell_in).to eq(1)
        end
        it 'Sulfuras quality never changes' do
          sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 1, 80, conjured = false)
          rose = GildedRose.new([sulfuras])
          rose.update_quality
          expect(sulfuras.quality).to eq(80)
        end
      end
    end
    context 'backstage passes' do
      it 'backstage pass increases by 2 when there are 10 days or less' do
        bp = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10, conjured = false)
        rose = GildedRose.new([bp])
        5.times { rose.update_quality }
        expect(bp.quality).to eq(19)
      end
      it 'backstage pass increases by 3 when there are 5 days or less' do
        bp = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 10, conjured = false)
        rose = GildedRose.new([bp])
        rose.update_quality
        expect(bp.quality).to eq(12)
        rose.update_quality
        expect(bp.quality).to eq(15)
      end
      it 'backstage pass quality to 0 after concert' do
        bp = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 10, conjured = false)
        rose = GildedRose.new([bp])
        7.times { rose.update_quality }
        expect(bp.quality).to eq(0)
      end
    end
  end

  context 'conjured' do
    context 'update_quality general' do
      let(:items) { items = [Item.new('foo', 10, 10, conjured = true), Item.new('bar', 5, 50, conjured = true)] }
      it 'does not change the name' do
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq 'foo'
      end
      it 'if sellin is greater than 0, update_quality updates both sell-by and quality by 2' do
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq(8)
        expect(items[1].quality).to eq(48)
      end
      it 'if sellin is 0, update_quality updates quality by twice the given speed' do
        rose = GildedRose.new(items)
        5.times { rose.update_quality }
        expect(items[1].quality).to eq(34)
        rose.update_quality
        expect(items[1].quality).to eq(30)
        rose.update_quality
        expect(items[1].quality).to eq(26)
      end
      it 'quality of item is never negative' do
        rose = GildedRose.new(items)
        10.times { rose.update_quality }
        expect(items[0].quality).to eq(0)
        rose.update_quality
        expect(items[0].quality).to eq(0)
      end
      context 'aged brie' do
        it 'Aged Brie increases in quality the older it gets' do
          brie = Item.new('Aged Brie', 11, 10, conjured = false)
          rose = GildedRose.new([brie])
          rose.update_quality
          expect(brie.quality).to eq(11)
        end
        it 'Aged Brie increases by 2 when there are 10 days or less' do
          brie = Item.new('Aged Brie', 11, 10, conjured = false)
          rose = GildedRose.new([brie])
          5.times { rose.update_quality }
          expect(brie.quality).to eq(19)
        end
        it 'Aged Brie increases by 3 when there are 5 days or less' do
          brie = Item.new('Aged Brie', 6, 10, conjured = false)
          rose = GildedRose.new([brie])
          rose.update_quality
          expect(brie.quality).to eq(12)
          rose.update_quality
          expect(brie.quality).to eq(15)
        end
        it 'Quality of an item is never more than 50' do
          brie = Item.new('Aged Brie', 6, 10, conjured = false)
          rose = GildedRose.new([brie])
          40.times { rose.update_quality }
          expect(brie.quality).to eq(50)
        end
      end
      context 'sulfuras' do
        it 'Sulfuras never has to be sold' do
          sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 1, 80, conjured = false)
          rose = GildedRose.new([sulfuras])
          rose.update_quality
          expect(sulfuras.sell_in).to eq(1)
        end
        it 'Sulfuras quality never changes' do
          sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 1, 80, conjured = false)
          rose = GildedRose.new([sulfuras])
          rose.update_quality
          expect(sulfuras.quality).to eq(80)
        end
      end
    end
    context 'backstage passes' do
      it 'backstage pass increases by 2 when there are 10 days or less' do
        bp = Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 10, conjured = false)
        rose = GildedRose.new([bp])
        5.times { rose.update_quality }
        expect(bp.quality).to eq(19)
      end
      it 'backstage pass increases by 3 when there are 5 days or less' do
        bp = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 10, conjured = false)
        rose = GildedRose.new([bp])
        rose.update_quality
        expect(bp.quality).to eq(12)
        rose.update_quality
        expect(bp.quality).to eq(15)
      end
      it 'backstage pass quality to 0 after concert' do
        bp = Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 10, conjured = false)
        rose = GildedRose.new([bp])
        7.times { rose.update_quality }
        expect(bp.quality).to eq(0)
      end
    end
  end
end

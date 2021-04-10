class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.conjured == false
        if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
          item.quality = item.quality - 1 if item.quality > (0) && (item.name != 'Sulfuras, Hand of Ragnaros')
        elsif item.quality < 50
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert' || 'Aged Brie'
            item.quality = item.quality + 1 if item.sell_in < (11) && (item.quality < 50)
            item.quality = item.quality + 1 if item.sell_in < (6) && (item.quality < 50)
          end
        end
        item.sell_in = item.sell_in - 1 if item.name != 'Sulfuras, Hand of Ragnaros'
        if item.sell_in < 0
          if item.name != 'Aged Brie'
            if item.name != 'Backstage passes to a TAFKAL80ETC concert'
              item.quality = item.quality - 1 if item.quality > (0) && (item.name != 'Sulfuras, Hand of Ragnaros')
            else
              item.quality = item.quality - item.quality
            end
          elsif item.quality < 50
            item.quality = item.quality + 1
          end
        end

      elsif item.conjured == true
        if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
          item.quality = item.quality - 2 if item.quality > (0) && (item.name != 'Sulfuras, Hand of Ragnaros')
        elsif item.quality < 50
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert' || 'Aged Brie'
            item.quality = item.quality + 1 if item.sell_in < (11) && (item.quality < 50)
            item.quality = item.quality + 1 if item.sell_in < (6) && (item.quality < 50)
          end
        end
        item.sell_in = item.sell_in - 2 if item.name != 'Sulfuras, Hand of Ragnaros'
        if item.sell_in < 0
          if item.name != 'Aged Brie'
            if item.name != 'Backstage passes to a TAFKAL80ETC concert'
              item.quality = item.quality - 2 if item.quality > (0) && (item.name != 'Sulfuras, Hand of Ragnaros')
            else
              item.quality = item.quality - item.quality
            end
          elsif item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end
end

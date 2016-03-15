module Sky
  class StoreCollection
    def initialize(raw_data = {})
      @raw_data = raw_data
    end

    def total
      '£ %.2f' % @raw_data['total']
    end

    def items
      [rentals, purchases].flatten.map do |i|
        i.map do |k, v|
          v = '£ %.2f' % v if k == 'cost'
          [k, v]
        end.to_h
      end
    end

    private

    def rentals
      @raw_data['rentals'].map do |i|
        i.merge({ 'type' => 'rentals' })
      end
    end

    def purchases
      @raw_data['buyAndKeep'].map do |i|
        i.merge({ 'type' => 'purchases' })
      end
    end
  end
end

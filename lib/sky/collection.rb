module Sky
  class Collection
    def initialize(data: {}, type:)
      data = data || {}
      @items = data[type.to_s]
      @total = data['total']
    end

    def total
      '£ %.2f' % @total
    end

    def items
      @items.map do |i|
        i.map do |k, v|
          v = '£ %.2f' % v if k == 'cost'
          [k, v]
        end.to_h
      end
    end
  end
end

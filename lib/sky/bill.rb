module Sky
  class Bill
    def initialize(data)
      @data = data
    end

    def total
      '£ %.2f' % @data['total']
    end

    def due
      Date.parse(statement['due']).strftime('%d-%m-%Y')
    end

    def generated
      Date.parse(statement['generated']).strftime('%d-%m-%Y')
    end

    def from
      Date.parse(statement['period']['from']).strftime('%d %b')
    end

    def to
      Date.parse(statement['period']['to']).strftime('%d %b')
    end

    def subscriptions
      @subscriptions ||= Collection.new(data: @data['package'], type: 'subscriptions')
    end

    def calls
      @calls ||= Collection.new(data: @data['callCharges'], type: 'calls')
    end

    def store
      @store ||= StoreCollection.new(@data['skyStore'])
    end

    private

    def statement
      @data['statement']
    end
  end
end

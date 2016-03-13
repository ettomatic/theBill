require 'json'

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
      @data['package']['subscriptions']
    end

    private

    def statement
      @data['statement']
    end
  end
end

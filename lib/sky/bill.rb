require 'json'

module Sky
  class Bill
    def initialize(data)
      @data = JSON.parse(data)
    end

    def total
      @data['total']
    end

    def statement
      @data['statement']
    end

    def subscriptions
      @data['package']['subscriptions']
    end
  end
end

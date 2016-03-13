module Sky
  class BillRepository
    include HTTParty
    base_uri 'safe-plains-5453.herokuapp.com'

    # We assume in real life we have some
    # sort of id for this.
    def self.find
      get('/bill.json', timeout: 1).parsed_response
    end
  end
end

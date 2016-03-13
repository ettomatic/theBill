module Sky
  class BillRepository
    include HTTParty
    base_uri ENV['DATASOURCE_HOST']

    # We assume in real life we have some
    # sort of id for this.
    def self.find
      get('/bill.json', timeout: 1).parsed_response
    end
  end
end

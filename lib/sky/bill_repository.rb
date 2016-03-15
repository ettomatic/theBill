require 'httparty'

module Sky
  class BillRepository
    include HTTParty

    base_uri ENV['DATASOURCE_HOST']

    # We assume in real life we have some
    # sort of id for this.
    def self.find
      response = get('/bill.json', timeout: 1)
      if response.success?
        response.parsed_response
      end
    end
  end
end

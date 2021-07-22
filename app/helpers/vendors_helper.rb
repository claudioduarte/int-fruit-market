module VendorsHelper
  def get_countries_helper
    @all_countries = []

    countries = HTTParty.get('https://restcountries.eu/rest/v2/all')
    parsed_response = JSON.parse(countries.body)

    if countries.code == 200
      parsed_response.each do |c|
        @all_countries << c["name"]
        # puts @all_countries
      end
    else
      puts "Unable to fetch countries"
    end
  end
end

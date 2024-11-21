module VendorsHelper
  def get_countries_helper
    @all_countries = []

    countries = HTTParty.get('https://restcountries.com/v3.1/all')
    parsed_response = JSON.parse(countries.body)

    if countries.code == 200
      parsed_response.each do |c|
        @all_countries << c['name']['common']
      end
    else
      flash[:error] = 'Unable to fetch countries'
    end
  end
end

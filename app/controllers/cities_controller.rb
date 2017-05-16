class CitiesController < ApplicationController

  def index
    basepath = ENV['API_BASE_URL']
    uri = "#{basepath}"
    # uri = "#{basepath}/cidade"
    rest = RestClient::Resource.new(uri)
    cities = rest.get
    @cities = JSON.parse(cities, :symbolize_names => true)
  end

end

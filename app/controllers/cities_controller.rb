class CitiesController < ApplicationController
  require 'rest_client'
  BASEPATH = ENV['API_BASE_URL']

  def index
    uri = "#{BASEPATH}/cidade"
    rest = RestClient::Resource.new(uri)
    cities = rest.get
    @cities = JSON.parse(cities, :symbolize_names => true)
  end

  def show
    uri = "#{BASEPATH}/cidade/#{params[:geocodigo]}"
    rest = RestClient::Resource.new(uri)
    cities = rest.get
    @city = JSON.parse(cities, :symbolize_names => true).first
  end

  def new

  end

  def create
    uri = "#{BASEPATH}/cidade/nova"
    payload = params.to_json
    rest_resource = RestClient::Resource.new(uri)
    begin
      rest_resource.post payload , :content_type => "application/json"
      redirect_to cities_path
    rescue Exception => e
     render :new
    end
  end

  def distance
    uri = "#{BASEPATH}/cidade/#{params[:distance][:first_city]}/origem/#{params[:distance][:second_city]}/destino"
    rest = RestClient::Resource.new(uri)
    distance = rest.get
    @distance = JSON.parse(distance, :symbolize_names => true)
  end

  def truckage
    uri = "#{BASEPATH}/frete/#{params[:truckage][:first_city]}/origem/#{params[:truckage][:second_city]}/destino"
    rest = RestClient::Resource.new(uri)
    truckage = rest.get
    @truckage = JSON.parse(truckage, :symbolize_names => true)
  end


end

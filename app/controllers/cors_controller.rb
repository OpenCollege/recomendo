class CorsController < ApplicationController
  def get_title
    require 'open-uri'
    title = Nokogiri::HTML(open(params[:url],"User-Agent" => "Ruby/#{RUBY_VERSION}")).css('title').text
    render json: { title: title }
  end
end

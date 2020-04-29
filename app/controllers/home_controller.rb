class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'landing_page'
  def show

  end

end

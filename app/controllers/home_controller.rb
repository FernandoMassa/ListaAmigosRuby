class HomeController < ApplicationController
  def index
  end

  def about 
  	@about_me = "Meu nome é Fernando Massa"
  end
end

class StoreController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    page = params[:page].to_i
    @products = Product.page( page ).per(5)
  end

  def show

  end
end

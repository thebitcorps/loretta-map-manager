class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
    render layout: false
  end

  def help
  end

  def about
  end
end

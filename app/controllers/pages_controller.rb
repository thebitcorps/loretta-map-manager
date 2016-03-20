class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    render layout: false
  end

  def help
  end

  def about
  end
end

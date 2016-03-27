class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :lots]

  def home
    render layout: false
  end

  def lots
    respond_to do |format|
      format.json { render json: Lot.all, except: [:stage, :created_at, :updated_at]}
    end
  end

  def help
  end

  def about
  end
end

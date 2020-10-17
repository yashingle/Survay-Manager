class Api::V1::SurvayController < ApplicationController
  before_action :authenticate_api, only: [:create, :update, :destroy]
  protect_from_forgery :except => [:update, :destroy, :create]
  def index
  end

  def show
  end

  def create

    render :json => {}, :status => 200
  end

  def update
    render :json => {}, :status => 200
  end

  def destroy
  end

  private
    def param_sanity
    end
end

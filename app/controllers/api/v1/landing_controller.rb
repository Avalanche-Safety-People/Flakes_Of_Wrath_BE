class Api::V1::LandingController < ApplicationController
  def index
   render json: 'Hello World'
  end
 end
class Api::V1::TeasController < ApplicationController

  def index
    json_response(TeaSerializer.new(TeaFacade.get_all_teas), :ok)
  end

  def show
    json_response(TeaSerializer.new(TeaFacade.get_one_tea(params[:id])), :ok)
  end
end

class Api::V1::TeasController < ApplicationController

  def index
    this = TeaFacade.get_all_teas
    json_response(TeaSerializer.new(this), :ok)
  end

  def show
  end
end

class DojosController < ApplicationController
  def index
    @dojos = Dojo.all
  end

  def new
  end

  def create

    dojo = Dojo.create(name:params[:name], street:params[:street], city:params[:city], state:params[:state])

    if dojo.valid?

      redirect_to '/'

    else

      flash[:error] = dojo.errors.full_messages
      
      redirect_to '/dojos/new'
      
    end
  end
end

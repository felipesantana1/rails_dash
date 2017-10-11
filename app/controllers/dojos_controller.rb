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

  def show
    @dojo = Dojo.find(params[:id])
    @students = Student.all
    render 'display.html.erb'
  end

  def edit
    @dojo = Dojo.find(params[:id])
  end
  
  def update
    dojo = Dojo.find(params[:id])
    dojo.name = params[:name]
    dojo.street = params[:street]
    dojo.city = params[:city]
    dojo.state = params[:state]

    if dojo.valid?
      dojo.save
      redirect_to '/'
    else
      flash[:error] = dojo.errors.full_messages
      redirect_to "/dojos/edit/#{params[:id]}"
    end
  end

  def destroy
    dojo = Dojo.find(params[:id])
    dojo.destroy
    redirect_to '/'
  end
end

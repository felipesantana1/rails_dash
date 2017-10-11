class StudentsController < ApplicationController
  def index
    @student = Student.find(params[:id])
    @dojo = Dojo.find(params[:dojo_id])
    render 's_index.html.erb'
  end

  def new
    @dojo = Dojo.find(params[:dojo_id])
    @dojos = Dojo.all
    render 's_new.html.erb'
  end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @dojos = Dojo.all
    render 's_edit.html.erb'
  end

  def update
    student = Student.find(params[:id])
    student.first_name = params[:first_name]
    student.last_name = params[:last_name]
    student.email = params[:email] 
    student.dojo = Dojo.find(params[:dojo])

    if student.valid?
      student.save
      redirect_to "/dojos/show/#{params[:dojo_id]}"
    else
      flash[:error] = student.errors.full_messages
      redirect_to "/dojos/#{params[:dojo_id]}/edit/students/#{params[:id]}"
    end
  end

  def create
    student = Student.create(first_name:params[:first_name], last_name:params[:last_name], email:params[:email], dojo:Dojo.find(params[:dojo]))

    if student.valid?

      redirect_to '/'

    else

      flash[:error] = student.errors.full_messages

      redirect_to "/dojos/#{params[:dojo_id]}/students/new"
    end    
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to "/dojos/show/#{params[:dojo_id]}"
  end
end

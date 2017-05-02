class SubjectsController < ApplicationController
#layout false
  layout "admin"
  def index
    @subjects=Subject.order("position ASC")
  end

  def show
    @subject=Subject.find(params[:id])
  end

  def new
    @subject=Subject.new
    @subject_count=Subject.count + 1
  end
  def create
    #find an exiting object using form parameters
    @subject=Subject.new(subject_param)
    #save the object
     if @subject.save
    #if save succed  redirect to index
    flash[:notice] = "Successfully created..."
    redirect_to(:action => 'index')
  else
    #if not goto new again
    flash[:notice] = "try again..."
    @subject_count=Subject.count+1
    render('new')
    end

  end

  def edit
    @subject =Subject.find(params[:id])
    @subject_count=Subject.count
  end
  def Update
    #instantate a new object using form parameters
    @subject=Subject.find(params[:id])

    #update the object
      if @subject.update_attributes(subject_param)
    #if save succed  redirect to index
        flash[:notice] = "Successfully updated..."
    redirect_to(:action => 'show',:id=> @subject.id)
  else
    #if not goto new again
      @subject_count=Subject.count
    render('edit')
    end
  end
  def delete
        @subject =Subject.find(params[:id])
  end
  def destroy
      @subject =Subject.find(params[:id]).destroy
          flash[:notice] = "Successfully deleted..."
      redirect_to(:action =>'index')
  end
  private
  def subject_param
  params.require(:subject).permit(:name,:position, :visible)
  end

end

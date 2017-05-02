class SectionsController < ApplicationController
    layout "admin"
  def index
    @section=Section.all
  end

  def show
        @section =Section.find(params[:id])
  end

  def new
    @section= Section.new
  end
  def create
      @section=Section.new(section_param)
    if @section.save
   #if save succed  redirect to index
   flash[:notice] = "Successfully created..."

   redirect_to(:action => 'index')
 else
   #if not goto new again
   render('new')
   end
  end

  def edit
    @section =Section.find(params[:id])
  end
  def Update
    @section=Section.find(params[:id])

    #update the object
      if @section.update_attributes(section_param)
    #if save succed  redirect to index
    redirect_to(:action => 'show',:id=> @section.id)
  else
    #if not goto new again
    render('edit')
    end
  end

  def delete
        @section =Section.find(params[:id])
  end
  def destroy
    @section =Section.find(params[:id]).destroy

    redirect_to(:action =>'index')
  end
  private
  def section_param
  params.require(:section).permit(:page_id,:name,:position, :visible,:content_type,:content)
  end
end

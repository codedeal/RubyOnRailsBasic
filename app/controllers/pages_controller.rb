class PagesController < ApplicationController
  layout "admin"
  def index
    @page= Page.sorted
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page= Page.new
      @subject=Subject.order('position ASC')
    @page_count=Page.count + 1
  end
  def create
  @page=Page.new(page_param)
    #save the object
     if @page.save
    #if save succed  redirect to index
    flash[:notice] = "Successfully created..."

    redirect_to(:action => 'index')
  else
    #if not goto new again
      @subject=Subject.order('position ASC')
    @page_count=Page.count + 1
    render('new')
    end
  end
  def edit
    @page= Page.find(params[:id])
    @subject=Subject.order('position ASC')
    @page_count=Page.count
  end
  def Update
    @page=Page.find(params[:id])


    #update the object
      if @page.update_attributes(page_param)
    #if save succed  redirect to index
        flash[:notice] = "Successfully Updated..."
    redirect_to(:action => 'show',:id=> @page.id)
  else
    #if not goto new again
  @subject=Subject.order('position ASC')
    @page_count=Page.count
    render('edit')
  end
end

  def delete
      @page= Page.find(params[:id])
  end
  def destroy
    @page =Page.find(params[:id]).destroy
        flash[:notice] = "Successfully deleted..."
    redirect_to(:action =>'index')
  end
  private
  def page_param
  params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end

end

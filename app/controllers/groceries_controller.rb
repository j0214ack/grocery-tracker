class GroceriesController < ApplicationController
  def index
    @groceries = Grocery.all
  end

  def new
    @grocery = Grocery.new
  end

  def create
    @grocery = current_user.groceries.new(grocery_params)

    if @grocery.save
      redirect_to groceries_path
    else
      render :new
    end
  end

  def edit
    @grocery = Grocery.find(params[:id])
  end

  def update
    @grocery = Grocery.find(params[:id])
    if @grocery.update_attributes(grocery_params)
      redirect_to groceries_path
    else
      render :edit
    end
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    @grocery.destroy
    redirect_to groceries_path
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :count, :unit, :exp_date)
  end
end

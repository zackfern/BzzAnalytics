class FiltersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @filters = current_user.filters
  end

  def new
    @filter = current_user.filters.build
  end

  def create
    @filter = current_user.filters.build(filter_params)
    if @filter.save
      @filter.import_analytics
      redirect_to :root, notice: "Filter successfully created. #{@filter.visits.count} visits imported."
    else
      render :new
    end
  end

  def destroy
    @filter = current_user.filters.find_by_id(params[:id])
    if @filter.destroy
      redirect_to :root, notice: 'Filter deleted.'
    end
  end

  private
  def filter_params
    params.require(:filter).permit(:name, :path, :web_property_id)
  end
end

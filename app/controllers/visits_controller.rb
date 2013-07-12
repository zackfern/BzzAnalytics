class VisitsController < ApplicationController
  def index
    @filter = current_user.filters.find_by_id(params[:filter_id])
    @visits = @filter.visits
  end
end

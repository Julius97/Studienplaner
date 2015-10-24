class ProfController < ApplicationController
  def index
  	@profs = Prof.all.order(:name)
  end

  def create
  	Prof.create :name => params[:name], :subject_id => params[:subject_id].to_i
  	redirect_to prof_index_path
  end

  def destroy
  	Prof.find_by_id(params[:id]).destroy
  	redirect_to prof_index_path
  end
end

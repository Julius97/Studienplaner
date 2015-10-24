class SubjectController < ApplicationController
  def index
  	@subjects = Subject.all.order(:name)
  end

  def create
  	Subject.create :name => params[:name]
  	redirect_to subject_index_path
  end

  def destroy
  	Subject.find_by_id(params[:id]).destroy
  	redirect_to subject_index_path
  end
end

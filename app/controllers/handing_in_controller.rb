class HandingInController < ApplicationController
  def index
  	@handing_ins = HandingIn.all.order(:name)
  end

  def create
  	HandingIn.create :name => params[:name]
  	redirect_to handing_in_index_path
  end

  def destroy
  	HandingIn.find_by_id(params[:id]).destroy
  	redirect_to handing_in_index_path
  end
end

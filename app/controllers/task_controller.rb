class TaskController < ApplicationController

	def index
		@tasks = Task.where("handing_in_time > ?", DateTime.now).order(:handing_in_time)
	end

	def new

	end

	def create
		handing_in_time = DateTime.new(params[:year].to_i,params[:month].to_i,params[:day].to_i,params[:hour].to_i,params[:min].to_i,0)
		if (params[:event_id].to_i != 0 || params[:handing_in_id].to_i != 0) && !(params[:event_id].to_i != 0 && params[:handing_in_id].to_i != 0)
			if params[:event_id].to_i != 0
				task_type_id = params[:event_id].to_i
				task_type = "Event"
			else
				task_type_id = params[:handing_in_id].to_i
				task_type = "HandingIn"
			end
			Task.create :subject_id => params[:subject_id].to_i, :task_type_type => task_type, :task_type_id => task_type_id, :description => params[:description], :handing_in_time => handing_in_time, :room => params[:room], :comment => params[:comment]
		end
		redirect_to root_path
	end

	def edit
		if params[:id]
			if Task.find_by_id params[:id]
				@task = Task.find_by_id params[:id]
			else
				flash[:error] = "Fehler im System: Task konnte nicht gefunden werden"
				redirect_to root_path
			end
		else
			flash[:error] = "Fehler im System: Task konnte nicht gefunden werden"
			redirect_to root_path
		end
	end

	def update
		if params[:id]
			if Task.find_by_id params[:id]
				handing_in_time = DateTime.new(params[:year].to_i,params[:month].to_i,params[:day].to_i,params[:hour].to_i,params[:min].to_i,0)
				if (params[:event_id].to_i != 0 || params[:handing_in_id].to_i != 0) && !(params[:event_id].to_i != 0 && params[:handing_in_id].to_i != 0)
					if params[:event_id].to_i != 0
						task_type_id = params[:event_id].to_i
						task_type = "Event"
					else
						task_type_id = params[:handing_in_id].to_i
						task_type = "HandingIn"
					end
					Task.find_by_id(params[:id]).update_attributes :subject_id => params[:subject_id].to_i, :task_type_type => task_type, :task_type_id => task_type_id, :description => params[:description], :handing_in_time => handing_in_time, :room => params[:room], :comment => params[:comment]
				end
			else
				flash[:error] = "Fehler im System: Task konnte nicht gefunden werden"
				redirect_to root_path
			end
		else
			flash[:error] = "Fehler im System: Task konnte nicht gefunden werden"
			redirect_to root_path
		end
		redirect_to root_path
	end

	def destroy
		if params[:id]
			if Task.find_by_id params[:id]
				flash[:notice] = "Task-Nr." + Task.find_by_id(params[:id].to_i).id.to_s + " wurde erfolgreich gelöscht"
				Task.find_by_id(params[:id]).destroy
				redirect_to root_path
			else
				flash[:error] = "Fehler im System: Task konnte nicht gefunden werden"
				redirect_to root_path
			end
		else
			flash[:error] = "Fehler im System: Task konnte nicht gefunden werden"
			redirect_to root_path
		end
	end

end
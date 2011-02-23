class LogsController < ApplicationController
	def create
		Log.parse params[:log]
		render :text => "ok"
	rescue
		render :text => "error"
	end
end

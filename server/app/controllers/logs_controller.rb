class LogsController < ApplicationController
	def create
		Log.parse(request.env["REMOTE_ADDR"], params[:log])
		render :text => "ok"
	rescue
		render :text => "error"
	end
end

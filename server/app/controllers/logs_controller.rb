class LogsController < ApplicationController
  def index
		render :xml => Log.all.to_xml(
      :skip_types => true,
      :dasherize => false
    )
  end

  def create
		Log.parse(params[:log])
		render :text => "ok"
  rescue
		render :text => "error"
  end
end

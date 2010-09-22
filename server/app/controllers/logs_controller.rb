class LogsController < ApplicationController
  def index
		render :xml => Log.all.to_xml(
      :skip_types => true,
      :dasherize => false
    )
  end

  def create
  	params[:log].each {|log| Log.parse(log)}
		render :text => "ok"
  rescue
		render :text => "error"
  end
end

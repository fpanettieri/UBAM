UBAM::Application.routes.draw do
	post 'logs/create'
	root :to => "logs#create"
end

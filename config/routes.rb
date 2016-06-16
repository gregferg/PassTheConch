Rails.application.routes.draw do
  Rails.application.routes.draw do
    root to: "static#root"

    namespace :api, defaults: {format: :json} do
      resource :user, only: [:create, :show]
      resource :session, only: [:create, :destroy, :show]
      resource :stories, only: [:index, :create, :show, :update]
    end
  end

end

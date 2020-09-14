Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, :controllers => {:registrations => "registrations"}


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  root 'static_pages#home'
	get 'info', to: 'static_pages#info'
	get 'test-page', to: 'static_pages#test-page'
	get 'options', to: 'static_pages#options'
	get '/our-process', to: 'static_pages#our_process', as: 'our_process'
	get 'testing', to: 'static_pages#testing'
	get 'thanks', to: 'static_pages#thanks'
	get 'chats', to: 'static_pages#chats'

	get 'court-ordered-dna-testing-locations', to: 'static_pages#court_ordered_dna_testing_locations', as: 'court_ordered_dna_testing_locations'

	resources :charges, only: [:new, :create]
	resources :states
	# get 'testing-locations', to: 'states#index', as: 'testing_locations'

	# resources :towns, except: :index, :path => '' do
	resources :towns do
		collection do
			post :import
		end
	end

	resources :locations, except: [:show] do
		collection do
			post :import
		end
	end

	# resources :users, only: [:index]
	resources :guest_users
	resources :personal_messages, only: [:new, :create]
	resources :conversations, only: [:index, :show]


	resources :chatrooms, only: [:create] do
    member do
      post :close
    end

    resources :notes, only: [:create]
  end

  mount ActionCable.server => '/cable'
end

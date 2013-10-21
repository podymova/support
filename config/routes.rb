STest::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  constraints :format => 'json' do
    
    namespace :api do

      resources :streets do
        post 'address_line', :on => :collection
        scope :module => :streets do
          resources :houses
        end
      end

      resources :users do
        post 'search', :on => :collection
      end

      scope :module => :inventory do
        resources :tcabels, :only => [:search]  do
          post 'search', :on => :collection
          scope :module => :tcabels do
            resources :cabels, :only => [:edit, :create, :update]
          end
        end

        resources :tdevs, :only => [:search]  do
          post 'search', :on => :collection
          scope :module => :tdevs do
            resources :devs, :only => [:search] do
              get 'search', :on => :collection
            end
          end
        end

        resources :nodes, :only => [:search]  do
          post 'search', :on => :collection
          scope :module => :nodes do
            resources :devs, :only => [:search] do
              get 'search', :on => :collection
            end
          end
        end

      end


      scope :module => :special do
          scope :module => :services do
            resources :addresses
          end
      end


    end
  end









  
  scope :module => :web do

    root :to => 'welcome#show'

    resource :session, :only => [:new, :create, :destroy]

      resources :users
      resources :passwords

      resources :roles do
        scope :module => :roles do
          resources :rights

          resources :users  do
            get 'remove_from_role', :on => :member
            get 'edit_change_password', :on => :member
            put 'change', :on => :member
          end


        end
      end



    # Inventory section
    scope :module => :inventory do
        resources :tcabels  do
          scope :module => :tcabels do
            resources :cabels, :only => [:edit, :create, :update]
          end
        end
        resources :tdevs do
          scope :module => :tdevs do
            resources :devs, :only => [:edit, :create, :update]
          end
        end
        resources :nodes do
          scope :module => :nodes do
            resources :devs, :only => [:create, :destroy]
          end
        end
        resources :hardwares do
          scope :module => :hardwares do
            resources :topologies
          end
        end
        resources :pprs do
          scope :module => :pprs do
            resources :releases do
              post 'get_doc1'
              scope :module => :releases do
                 resources :hards do
                   scope :module => :hards do
                     resources :tops
                   end
                 end
                 resources :comments
                 resources :users
                 resources :attaches
            end
            end
        end
      end
        resources :cabels
        resources :devs
        resources :mastercomps
        resources :dmovings
    end

    # Root section
    namespace :special do
      resources :models do
        scope :module => :models do
          resources :actions
        end
      end
        resources :bugs
        resources :services
    end

    # Admin section
    namespace :admin do
      resources :streets do
        scope :module => :streets do
          resources :houses  do
            put :del, :on => :member
          end
        end
      end

#      resources :groups do
#        get 'all', :on => :collection
#        scope :module => :groups do
#          resources :users  do
#            get 'edit_change_password', :on => :member
#            put 'change', :on => :member
#          end
#        end
#      end

    end



  end
end


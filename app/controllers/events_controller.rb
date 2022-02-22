class EventsController < ApplicationController
    before_action :authenticate_user, only: [:index]
    def index
        params[:gossip_array] = Gossip.all
        
    end
    
    def show
        
    end
    
    def new
                                      
    end
    
    def create
        
        @post = Gossip.new('title' => params[:title],
                      'content' => params[:content],
                    'user_id' => User.find_by(id: session[:user_id]).id)
               
             if @post.save
                puts "c'est sauvegardé"
                redirect_to gossips_path
             else
                puts "error"
                render 'new'
             end
        end
    
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
      end
    
    
    
    
    
    end
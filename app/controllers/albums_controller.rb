class AlbumsController < ApplicationController
    def new
    end
    
    def create
        render plain: "hello"
    end
    
    def show
        @album = Album.find(params[:id])
    end
    
    def index
        @albums = Album.all
    end
end

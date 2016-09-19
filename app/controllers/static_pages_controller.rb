class StaticPagesController < ApplicationController
    def list
    end
    
    def album
    end
    
    def home
        render html: "hello, world!"
    end
    
end

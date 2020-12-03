class PhotoController < ApplicationController
    def index
        @photos = photo.all
      end
    
      def new
        @photo = photo.new
      end
    
      def create
        @photo = photo.new(photo_params)
        
        if @photo.valid?
          @photo.save
          redirect_to @photo
        else
          render :new
        end
      end
    
      def show
        @photo = photo.find(params[:id])
      end
    
      def update
        @photo = photo.find(params[:id])
        @photo.assign_attributes(photo_params)
    
        if @photo.valid?
          @photo.save
          redirect_to @photo
        else
          render :show
        end
      end
    
      def delete
        @photo.destroy
        redirect_to action: :index
      end
    
      private
    
      def photo_params
        params.require(:photo).permit(:image{})
      end
    end
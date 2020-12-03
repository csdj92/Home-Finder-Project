class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_account!, only: [:new,:create,:destroy]
    before_action :authorize, only:[:edit, :update, :destroy]
    
    
    
  
    def index
      if params[:company_id]
        @properties = Company.find(params[:company_id]).properties
      else
        @properties = Property.all
      end
    end
    
     
    
    def show
    end  

    def remax
      
    end
    
    
    def new
      @property = Property.new(company_id: params[:company_id])
    end
  
    
    def edit
    end
  
   
    def create
      @property = Property.new(property_params)
      @property.account_id = current_account.id
      
      
      
  
      if @property.save
        redirect_to @property, notice: 'Property was successfully created.'
      else
        render :new
      end
    end
  
    
    def update
      if @property.update(property_params)
        redirect_to @property, notice: 'Property was successfully updated.'
      else
        render :edit
      end
    end
  
   
    def destroy
      @property.destroy
      redirect_to properties_url, notice: 'Property was successfully destroyed.'
    end
  
    private      
      def set_property      
        @property = Property.find(params[:id])
      end
  
      
      def property_params
        params.require(:property).permit(:address, :price, :rooms, :bathrooms,:image,:accounts,:company_id,:company)
      end

      def authorize
        
      
        
        if current_account.id == @property.account_id
        else
          flash[:error] = "You do not have authorization to edit this Property" 
            
            redirect_to properties_path
        end
      end
      
end
class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]

    
    def index
      @companies = Company.all
    end
  
 
    def show
        set_company
    end
  

    def new
      @company = Company.new
    end
  
   
    def edit
    end
  
    
    def create
      @company = Company.new(company_params)
  
      if @company.valid?
        @company.save
        redirect_to @company
      else
        render :new
      end
    end
  
  
   
    def update      
        if @company.update(company_params)
            redirect_to @company, notice: 'Company was successfully updated.'
        else
            render :edit          
      end
    end
  
   
    def destroy
      accounts = Account.where(company_id: @company.id)
      accounts.each do |accounts|
        accounts.update({
          company_id: 0
        })
      end
      @company.destroy      
    end
    
  
    private
      def set_company
        @company = Company.find(params[:id])
      end
  
      def company_params
        params.fetch(:company, {}).permit(:name, :website, :address, :year_founded, :size, :revenue, :synopsis)
      end
  end

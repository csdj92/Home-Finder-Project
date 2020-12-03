class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_account!, only: [:new,:create,:destroy]
    before_action :authorize, only:[:edit, :update, :destroy]

    
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
      @company.account_id = current_account.id
  
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
        params.fetch(:company, {}).permit(:name, :website, :address, :year_founded, :size, :revenue, :synopsis,:image,:accounts)
      end

      def authorize
        if current_account.id == @company.account_id
        else
          flash[:error] = "You do not have authorization to edit this Company" 
          redirect_to companies_path
        end
             
    end
  end

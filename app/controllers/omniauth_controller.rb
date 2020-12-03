class OmniauthController < Devise::OmniauthCallbacksController 

    def github
        @account = Account.create_from_provider_data(request.env['omniauth.auth'])
        if @account.persisted?
            sign_in_and_redirect @account
            flash[:notice] = "Congratulations, you're signed up!"
        else
            flash[:error] = 'There was a problem.'
            redirect_to new_account_registration_path
        end
    end

    def google_oauth2
        @account = Account.create_from_provider_data(request.env['omniauth.auth'])
        
        if @account.persisted?           
            sign_in_and_redirect @account
           
            flash[:notice] = "Congratulations, you're signed up!"
        else
            flash[:error] = 'There was a problem.'
            redirect_to new_account_registration_path
        end
    end

    
     
        

    def failure
        flash[:error] = 'There was a problem'
        redirect_to new_account_registration_path        
    end

        private 

    def auth
        request.env['omniauth.auth']      
    end
    
end

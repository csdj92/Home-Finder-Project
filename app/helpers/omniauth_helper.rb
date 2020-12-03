module OmniauthHelper

    def authorize
        @account_id = current_account.id
        
    end
    
end

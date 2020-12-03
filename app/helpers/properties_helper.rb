module PropertiesHelper

    def small_thumb(property)
        image_tag property.image_url(:small), style: "width:250px; border: 5px solid black;height: fit-content; "
    end

    def prop_photo(property)
        image_tag property.image_url
    end
    
    def profile_picture
        image_tag   acct.image_remote_url
    end

    def avatar
        image_tag current_account.image, style:"width: 30px; height: 30px; border-radius: 50%;"
    end
    


   
    
    
end
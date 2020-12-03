class Property < ApplicationRecord
    include ImageUploader::Attachment(:image)   
    belongs_to :account
    belongs_to :company

    scope :latest, -> { order created_at: :desc}
    # Ex:- scope :active, -> {where(:active => true)}
    
end

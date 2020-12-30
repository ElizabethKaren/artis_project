class Device < ApplicationRecord

    has_many :heartbeats
    has_many :reports

    validates :phone_num, presence: true 
    validates :carrier, presence: true
    # validates :phone_num, phone: true
    
    # validates :phone_num, phone: { country_specifier: 'US' }
    # validate :country_code_check, on: [ :create, :update ]

    scope :active_devices, -> { where(disabled_at: nil ) }
    scope :inactive_devices, -> { where.not(disabled_at: nil ) }

    private 

    # def country_code_check
    #     # Phonelib.valid_country?(self.phone_check)
    #     self.phone_num = self.phone_num.e164

    # end 

end

class Device < ApplicationRecord
    has_many :heartbeats
    has_many :reports
    before_validation :check_country_code, on: [ :create, :update ]
    validates :phone_num, presence: true 
    validates :carrier, presence: true 
    validates :phone_num, length: { in: 10..14 }
    scope :active_devices, -> { where(disabled_at: nil ) }
    scope :inactive_devices, -> { where.not(disabled_at: nil ) }

    private 

     def check_country_code
        if self.phone_num && self.phone_num.size == 10
            self.phone_num = '1' + self.phone_num
        end 
     end 

end

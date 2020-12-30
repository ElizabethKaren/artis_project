class Device < ApplicationRecord

    has_many :heartbeats
    has_many :reports

    validates :phone_num, presence: true 
    validates :carrier, presence: true
    # validates :phone_num, phone: true
    
    # validates :phone_num, phone: { country_specifier: :us }
    # validate :country_code_check, on: [ :create, :update ]
    # validate :parse_num, on: :create
    validate :parse_num, on: :create 

    scope :active_devices, -> { where(disabled_at: nil ) }
    scope :inactive_devices, -> { where.not(disabled_at: nil ) }

    # def country_code_check
    #     if !Phonelib.valid_country?(self.phone_check)
    #         self.phone_num = '+1' + self.phone_num
    #     end 

    # end 

    private 

    def parse_num
        self.phone_num = Phonelib.parse(self.phone_num).sanitized
        if self.phone_num.size == 10
            self.phone_num = '+1' + self.phone_num
        else 
            self.phone_num = '+' + self.phone_num
        end 
    end

end

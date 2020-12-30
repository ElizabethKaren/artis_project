class Device < ApplicationRecord

    has_many :heartbeats
    has_many :reports

    validates :phone_num, presence: true 
    validates :carrier, presence: true

    validate :parse_num, on: :create 

    scope :active_devices, -> { where(disabled_at: nil ) }
    scope :inactive_devices, -> { where.not(disabled_at: nil ) }

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

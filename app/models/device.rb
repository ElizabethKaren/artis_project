class Device < ApplicationRecord
    has_many :heartbeats
    has_many :reports
    validates :phone_num, presence: true 
    validates :carrier, presence: true 
    validates :phone_num, length: { in: 9..15 }
    scope :active_devices, -> { where(disabled_at: nil ) }
    scope :inactive_devices, -> { where.not(disabled_at: nil ) }

end

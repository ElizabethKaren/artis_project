class Device < ApplicationRecord
    has_many :heartbeats
    has_many :reports
    validates :phone_num, length: { in: 9..15 }
    # validates :disabled_at, acceptance: { accept: nil }
    scope :active_devices, -> { where(disabled_at: nil) }
    scope :inactive_devices, -> { where(disabled_at: DateTime ) }

end

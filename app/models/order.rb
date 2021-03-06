class Order < ActiveRecord::Base
      belongs_to :frame
      has_one :brand, through: :frame

      validates :customer_name, presence: true
      validates :frame_id, presence: true
      validates :customer_email, presence: true
      validate :completed_on_cannot_be_earlier_than_paid_for_on

      scope :unfinished, -> { where(completed_on: nil) }
      
      def completed_on_cannot_be_earlier_than_paid_for_on
         if completed_on.present? && completed_on < paid_for_on
	    errors.add(:completed_on, "Can't be before order")
         end
      end

      def brand_id
        brand ? brand.id : nil
      end

      def self.paid
      	  where.not(paid_for_on: nil)
      end

      def self.unpaid
      	  where(paid_for_on: nil)
      end
end

class Order < ActiveRecord::Base
      belongs_to :frame

      validates :customer_name, presence: true
      validates :customer_email, presence: true
      validate :completed_on_cannot_be_earlier_than_paid_for_on


      
      def completed_on_cannot_be_earlier_than_paid_for_on
         if completed_on.present? && completed_on < paid_for_on
	    errors.add(:completed_on, "Can't be before order")
         end
      end


end

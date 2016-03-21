class Lot < ActiveRecord::Base
  belongs_to :salesman
  before_update :check_status

  private
    def check_status
      if salesman_id.blank?
        puts "yes"
        write_attribute(:status, 'available')
      else
        if Lot.find(id).salesman_id != salesman_id
          puts status
          write_attribute(:status, 'reserved')
          puts status
        end
      end
    end
end

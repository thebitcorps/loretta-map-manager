class Lot < ActiveRecord::Base
  belongs_to :salesman
  before_update :check_status

  private
    def check_status
      if Lot.find(id).salesman_id != salesman_id
        puts status
        write_attribute(:status, 'reserved')
        puts status
      end
    end
end

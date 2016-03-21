class Salesman < ActiveRecord::Base
	has_many :lots, dependent: :nullify
end

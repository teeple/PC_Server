class Deposit < ActiveRecord::Base
    has_many :sub_deposits
end

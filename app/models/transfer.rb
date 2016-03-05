class Transfer < ActiveRecord::Base
  belongs_to :payment, touch: true
end

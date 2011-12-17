class Block < ActiveRecord::Base
  belongs_to :program
  belongs_to :block_type
end

class Criterion < ApplicationRecord
  belongs_to :trigger_config, polymorphic: true
  has_many :actions
end

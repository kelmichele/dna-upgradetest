class State < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged

	validates :name, presence: true
	validates :abv, presence: true
	has_many :towns, dependent: :destroy
	has_many :clinics, through: :towns

	has_many :locations, through: :towns

  default_scope -> { order(name: :asc)}
	# State.find_each(&:save)
end

class Clinic < ApplicationRecord
	validates :address, presence: true, uniqueness: { scope: :town_id }
  validates :zipcode, presence: true
  # validates_uniqueness_of :address
	belongs_to :town
  validates :town_id, presence: true
  has_one :state, through: :town

  def full_address
    "#{address}" + "\n" + "#{town.townname}, #{state.abv} #{zipcode}"
  end



 	def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      clinic = find_by(address: row["address"]) || new
      clinic.attributes = row.to_hash
      clinic.save!
    end
  end

end

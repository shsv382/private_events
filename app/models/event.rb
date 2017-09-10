class Event < ApplicationRecord
	validates :name, presence: true
	validates :date, presence: true
	validates :location, presence: true

	belongs_to :creator, class_name: "User"
	has_many :event_attendings, foreign_key: "attended_event_id"
	has_many :attendees, through: :event_attendings, source: :event_attendee

	scope :past, 	 -> { where("date <  ?", Time.now).order(date: :desc) }
	scope :upcoming, -> { where("date >= ?", Time.now).order(date: :desc) }

end

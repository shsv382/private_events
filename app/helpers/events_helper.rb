module EventsHelper
	def attendees_count(event)
		count = event.attendees.count
		if count == 1 || (count%10 == 1 && count%100 > 20)
			count = "#{count.to_s} участник"
		elsif count <= 4 || (count%10 <= 4 && count%10 > 0 && count%100 > 20)
			count = "#{count.to_s} участника"
		else
			count = "#{count.to_s} участников"
		end
	end
end

class TicketDetail < ApplicationRecord
  belongs_to :ticket
  belongs_to :product

  def self.search_details(search)
    if search
      where('ticket_id = ?',search)
    else
      all
    end
  end
end

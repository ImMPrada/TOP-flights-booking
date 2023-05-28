class FlightsController < ApplicationController
  def index
    return @flights unless flights.empty?

    render_empty_list_message
  end

  private

  def flights
    @flights ||= Flight.search_departure_flights_for(params)
  end

  def render_flights_list
    render turbo_stream: turbo_stream.update(
      'flights-index-list'.to_sym,
      partial: 'partials/flights/list',
      locals: { flights: }
    )
  end

  def render_empty_list_message
    render turbo_stream: turbo_stream.update(
      'flights-index-list'.to_sym,
      'NO FLIGHTS FOR THIS FILTER'
    )
  end
end

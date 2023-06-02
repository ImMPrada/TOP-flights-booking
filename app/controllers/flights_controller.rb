class FlightsController < ApplicationController
  def index
    return redirect_to_booking if params[:submit_flight_id]
    return flights unless flights.empty?

    render_empty_list_message
  end

  private

  def flights
    @flights ||= Flight.search_departure_flights_for(params)
  end

  def redirect_to_booking
    redirect_to new_flight_booking_path(flight, { amount_of_passengers: params[:amount_of_passengers] })
  end

  def render_empty_list_message
    render turbo_stream: turbo_stream.update(
      'flights-index-list'.to_sym,
      'NO FLIGHTS FOR THIS FILTER'
    )
  end

  def flight
    @flight ||= Flight.find(flight_id)
  end

  def flight_id
    params[:submit_flight_id]
  end
end

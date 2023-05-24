class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def filter
    return render_flights_list unless flights.empty?

    render_empty_list_message
  end

  private

  def permitted_filter_params
    params.require(:search_flights_for).permit(
      :departure_city_id,
      :departure_date,
      :arrival_city_id,
      :return_date,
      :passengers
    )
  end

  def flights
    @flights ||= Flight.search_departure_flights_for(permitted_filter_params)
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

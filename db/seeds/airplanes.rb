class Airplanes
  AIRPLANE_MODELS = %w[
    Boeing502
    Airbus A320
    Embraer E175
    Bombardier CRJ900
    Boeing502
    Airbus A320
    Embraer E175
    Bombardier CRJ900
  ].freeze

  def plant
    AIRPLANE_MODELS.each do |model|
      airplane = Airplane.create!(model:)

      %w[A B E F].each do |row|
        (1..30).each do |number|
          Seat.create!(
            name: "#{row}#{number}", airplane:, price: rand(100.0..500.0)
          )
        end
      end
    end
  end
end

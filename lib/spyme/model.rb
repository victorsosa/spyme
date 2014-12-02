module Spyme
  module Model
    class Location
      include ActiveModel::Model

      attr_accessor :latitude, :longitude

      validates :latitude, presence: true
      validates :longitude, presence: true

      def to_s
        "#{latitude}, #{longitude}"
      end

      def to_hash
        { latitude: latitude, longitude: longitude }
      end

      def coords
        [latitude,longitude]
      end

      class << self
        def from_session(session) 
          latitude = session[:latitude] || ''
          longitude = session[:longitude] || ''

          self.new(latitude: latitude.to_f, longitude: longitude.to_f)
        end
      end
    end
  end
end


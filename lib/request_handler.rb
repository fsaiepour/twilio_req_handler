require 'rabbit_feed'
require 'twilio-ruby'
require_relative 'sample_conference_data'
require 'pry'
require_relative '../config/initializers/rabbit_feed'

module RequestHandler

  class CallHandler
    def self.call_joined
      response = Twilio::TwiML::Response.new do |r|
        r.Dial do |d|
          d.Conference SampleConferenceData::CONFERENCE_NAME
        end
      end
      response.text #Dumb XML response containing the conference name
    end
  end

  class StatusHandler
    def self.status_changed(call_status,called)
      puts 'status changed...'
      #binding.pry
      RabbitFeed::Producer.publish_event 'status_changed', {'call_status' => "#{call_status}" , 'called' => "#{called}"}
    end
  end

end

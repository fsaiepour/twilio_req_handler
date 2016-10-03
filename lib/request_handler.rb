require 'RabbitFeed'
require 'twilio-ruby'

module RequestHandler

  class CallHandler
    def call_joined
      response = Twilio::TwiML::Response.new do |r|
        r.Dial do |d|
          d.Conference SampleConferenceData::CONFERENCE_NAME
        end
      end
      response.text #Dumb XML response containing the conference name
    end
  end

  class StatusHandler
    def status_changed
      RabbitFeed::Producer.publish_event 'status_changed', {'status_params' => "#{params}"}
    end
  end

end

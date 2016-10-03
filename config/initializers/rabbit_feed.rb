# Define the events (if producing)
EventDefinitions do

  define_event('call_joined', version: '1.0.0') do
    defined_as do
      'A call has been requested by client'
    end
    payload_contains do
      field('call_params', type: 'string', definition: 'Call Parameters')
    end
  end

  define_event('status_changed', version: '1.0.0') do
    defined_as do
      'A call has been requested by client'
    end
    payload_contains do
      field('status_params', type: 'string', definition: 'The Call Status parameters')
    end
  end
end

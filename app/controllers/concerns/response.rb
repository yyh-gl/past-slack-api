module Response

  def create_channel_response(object)
    response = {}
    if object.present?
      response[:ok] = true
      response[:channels] = object
    else
      response[:ok] = false
      response[:code] = :not_found
      response[:error] = 'Not Found'
    end
    response
  end

  def create_message_response(object)
    response = {}
    if object.present?
      response[:ok] = true
      response[:messages] = object
    else
      response[:ok] = false
      response[:code] = :not_found
      response[:error] = 'Not Found'
    end
    response
  end

  def json_response(object, status = :ok)
    status = object[:code] unless object[:ok]
    render json: object, status: status
  end

end
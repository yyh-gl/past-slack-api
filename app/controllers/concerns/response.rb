module Response

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def error_response(error)
    case error
    when ERROR_NOT_EXIST_USER
      object = { error: ERROR[:ERROR_NOT_EXIST_USER] }
      status = :not_found
    when ERROR_NOT_EXIST_MUSIC
      object = { error: ERROR[:ERROR_NOT_EXIST_MUSIC] }
      status = :not_found
    end

    render json: object, status: status
  end

end
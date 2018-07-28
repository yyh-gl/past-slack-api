module Response
  def json_response(object)
    status = object['ok'] ? :ok : ERROR[object['error'].to_sym]
    render json: object, status: status
  end
end
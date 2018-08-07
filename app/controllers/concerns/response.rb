module Response
  ## エラーハンドリング：エラーとステータスコードの結びつけ
  # TODO: エラーシンボルを追加していく
  # https://blog.toshimaru.net/rails-http-status-symbols/
  # https://api.slack.com/methods/channels.info
  # https://api.slack.com/methods/channels.list
  ERROR = {
    channel_not_found: :not_found
  }.freeze

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

  def slack_json_response(object)
    status = object['ok'] ? :ok : ERROR[object['error'].to_sym]
    render json: object, status: status
  end

  def json_response(object, status = :ok)
    status = object[:code] unless object[:ok]
    render json: object, status: status
  end

end
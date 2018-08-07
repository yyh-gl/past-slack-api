class Api::V1::UsersController < ApplicationController

  def index
    users = send_slack_request(REQ_USER_LIST)
    slack_json_response(users)
  end

end

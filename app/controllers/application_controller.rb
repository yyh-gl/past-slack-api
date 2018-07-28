class ApplicationController < ActionController::API
  include Request
  include Response
  include ExceptionHandler

  ## APIリクエスト用 メソッド名
  # channel
  REQ_CHANNEL_LIST = 'channels.list'
  REQ_CHANNEL_INFO = 'channels.info'
end

class Channel < ApplicationRecord

  class << self
    def fetch_channel(id)
      channel = self.find_by_ch_id(id)
      self.create_response(channel.present?, channel)
    end

    def fetch_channels(type)
      channels = self.where(ch_type: type)
      self.create_response(channels.present?, channels)
    end
  end

  private

  def self.create_response(ok, result = [])
    response = {}
    if ok
      response['ok'] = true
      response['channels'] = result
    else
      response['ok'] = false
      response['error'] = 'error_at_db'
    end
    response
  end

end

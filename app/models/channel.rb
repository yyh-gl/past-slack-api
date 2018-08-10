class Channel < ApplicationRecord

  def self.fetch_public_channels
    Rails.cache.fetch("public_index::#{Digest::SHA256.hexdigest('public')}", expires_in: Request::CACHE_EXPIRES) do
      Channel.where(ch_type: 'public')
    end
  end

  def self.fetch_private_channels
    Rails.cache.fetch("private_index::#{Digest::SHA256.hexdigest('private')}", expires_in: Request::CACHE_EXPIRES) do
      Channel.where(ch_type: 'private')
    end
  end

end

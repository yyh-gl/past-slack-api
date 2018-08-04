namespace :message do

  desc 'JSONファイルからDBへデータを移行'
  task :update => :environment do
    channels = Dir.glob("#{Rails.root}/log/slack/messages/*")
    channels.each do |ch|
      Dir.glob("#{ch}/*").each do |json_file|
        File.open(json_file) do |data|
          JSON.load(data).each do |hash|
            Message.create!(
              channel_name: File.basename(ch),
              main_type: hash['type'],
              sub_type: hash['subtype'],
              user: hash['user'],
              text: hash['text'].gsub(/2340/, '>'),
              client_msg_id: hash['client_msg_id'],
              ts: hash['ts'],
              reactions: hash['reactions'],
              inviter: hash['inviter'],
              edited_user: hash['edited_user'],
              edited_ts: hash['edited_ts'],
              unfurl_links: hash['unfurl_links'],
              unfurl_media: hash['unfurl_media'],
              thread_ts: hash['thread_ts'],
              is_thread_broadcast: hash['is_thread_broadcast'],
              thread_channel_id: hash['thread_channel_id'],
              thread_root_client_msg_id: hash['thread_root_client_msg_id'],
              thread_root_ts: hash['thread_root_ts']
            )
          rescue ActiveRecord::StatementInvalid => e
            if e.cause.class == Mysql2::Error && e.cause.message.match(/^Incorrect string value/)
              puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
              puts '[DEBUG!] MySQLに格納できない文字を検知しました。DBには格納しません。'
              puts "channel_name             ： #{File.basename(ch)}"
              puts "main_type                ： #{hash['type']}"
              puts "sub_type                 ： #{hash['subtype']}"
              puts "user                     ： #{hash['user']}"
              puts "text                     ： #{hash['text'].gsub(/&gt;/, '>')}"
              puts "client_msg_id            ： #{hash['client_msg_id']}"
              puts "ts                       ： #{hash['ts']}"
              puts "reactions                ： #{hash['reactions']}"
              puts "inviter                  ： #{hash['inviter']}"
              puts "edited_user              ： #{hash['edited_user']}"
              puts "edited_ts                ： #{hash['edited_ts']}"
              puts "unfurl_links             ： #{hash['unfurl_links']}"
              puts "unfurl_media             ： #{hash['unfurl_media']}"
              puts "thread_ts                ： #{hash['thread_ts']}"
              puts "is_thread_broadcast      ： #{hash['is_thread_broadcast']}"
              puts "thread_channel_id        ： #{hash['thread_channel_id']}"
              puts "thread_root_client_msg_id： #{hash['thread_root_client_msg_id']}"
              puts "thread_root_ts           ： #{hash['thread_root_ts']}"
              puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
            end
          end
        end
      end
    end
  end

end

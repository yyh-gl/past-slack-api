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
              edited_ts: hash['edited_ts']
            )
          rescue ActiveRecord::StatementInvalid => e
            if e.cause.class == Mysql2::Error && e.cause.message.match(/^Incorrect string value/)
              puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
              puts '[DEBUG!] MySQLに格納できない文字を検知しました。DBには格納しません。'
              puts "channel_name ： #{File.basename(ch)}"
              puts "main_type    ： #{hash['type']}"
              puts "sub_type     ： #{hash['subtype']}"
              puts "user         ： #{hash['user']}"
              puts "text         ： #{hash['text'].gsub(/&gt;/, '>')}"
              puts "client_msg_id： #{hash['client_msg_id']}"
              puts "ts           ： #{hash['ts']}"
              puts "reactions    ： #{hash['reactions']}"
              puts "inviter      ： #{hash['inviter']}"
              puts "edited_user  ： #{hash['edited_user']}"
              puts "edited_ts    ： #{hash['edited_ts']}"
              puts '-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
            end
          end
        end
      end
    end
  end

  private

  def validate_exist(data)
    #type:string subtype:string user:string text:text client_msg_id:string ts:string reactions:text inviter:string edited_user:string edited_ts:string
    if data['type'].blank?
    elsif data['subtype'].blank?
    end
  end

end

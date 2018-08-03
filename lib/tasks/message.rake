namespace :message do

  desc 'JSONファイルからDBへデータを移行'
  task :update do
    channels = Dir.glob("#{APP_ROOT_PATH}/log/slack/messages/*")
    channels.each do |ch|
      Dir.glob("#{ch}/*").each do |json_file|
        File.open(json_file) do |data|
          JSON.load(data).each do |hash|
            puts hash
          end
        end
      end
    end
  end

end

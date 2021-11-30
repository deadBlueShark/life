class A
  def self.start
    source = Rails.root.join("public/uploads/a_sub/aa.srt")
    target = Rails.root.join("public/uploads/a_sub/aaa.srt")
    File.open(target, "w") do |f|
      File.foreach(source) do |line|
        transformed_time = line.gsub(/\d{2}:\d{2}:\d{2}/) do |match|
          time = Time.parse(match)
          time = time > Time.parse("00:56:40") ? (time - 1.second) : time
          time.strftime("%H:%M:%S")
        end

        f.write transformed_time
      end
    end
  end
end

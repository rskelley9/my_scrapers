abs_path = File.expand_path(File.dirname(File.dirname(__FILE__)))

every 3.days, at: "4:30 am" do
	command "echo 'running automated scrape of KenPom.com...'"
	command "ruby #{abs_path}/../kp_scrape.rb"
	command "echo 'finished.'"
end

every :monday, at: "4:30 am" do
	command "echo 'downloading latest steamer projections...'"
	command "ruby #{abs_path}/../steam_download.rb"
	command "echo 'finished.'"
end
abs_path = File.expand_path(File.dirname(File.dirname(__FILE__)))

every 1.day, at: "4:30 am" do
	command "echo 'running automated scrape of KenPom.com...'"
	command "ruby #{abs_path}/../kp_scrape.rb"
	command "echo 'finished.'"
end
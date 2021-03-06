require 'config/setup'

@browser = Watir::Browser.new :firefox, profile: @profile
@browser.goto 'http://kenpom.com/'

if @browser.div(id: "logged-in").present?
	@browser.text_field(name: 'email').set(ENV['EMAIL'])
	@browser.text_field(name: 'password').set(ENV['KPASS'])
	@browser.checkbox(name: 'remember').set
	@browser.button(name: 'submit', value: "Login!").click
end

## Navigate to GW Team Page (protected)
@browser.link(text: 'George Washington').when_present.click

## Navigate to GW Expanded Player Page (protected)
@browser.link(text: 'Expanded Player Page').when_present.click

if @browser.div(id: 'players').present?
	doc = Nokogiri::HTML.parse(@browser.html)
	all_data_rows = doc.css('table:eq(0) tr.player')
	conf_data_rows = doc.css('table:eq(1) tr.player')

	all_player_data = all_data_rows.map { |data_row|
		data_row.css('td.player').map(&:text)
	}

	conference_player_data = conf_data_rows.map { |data_row|
		data_row.css('td.player').map(&:text)
	}
end

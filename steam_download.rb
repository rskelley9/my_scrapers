require 'config/setup'

@browser = Watir::Browser.new :firefox, profile: @profile
@browser.goto 'http://www.fangraphs.com/projections.aspx?pos=all&stats=bat&type=steamer'

@browser.link(id: 'ProjectionBoard1_cmdCSV').click
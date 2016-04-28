require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

page = HTTParty.get('https://access.kfit.com/partners/517?city=kuala-lumpur')

parse_page = Nokogiri::HTML(page)

kfit_partners = []

parse_page.css('script').map do |a|
  post_name = a.text
  kfit_partners.push(post_name)
end
CSV.open('kfit_partners.csv', 'w') do |csv|
  csv << kfit_partners
end
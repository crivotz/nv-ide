require 'nokogiri'
require 'open-uri'

# Truncate README.md
File.truncate('README.md', 0)
# Write standard info
puts '🗒️ Start info...'
File.open('INFO.md').each do |line|
  File.write('README.md', line, mode: 'a')
end
puts '✅ Info added'
puts '🗒️ Start plugins...'
# Start plugins
File.write('README.md', "\n**PLUGINS**  \n\n", mode: 'a')
# Fill plugins
File.open('lua/plugins.lua').each do |line|
  next unless line.match(/use '(.*?)'/) || line.match(/use { '(.*?)'/)

  gh_repository = if line.match(/use '(.*?)'/)
                    line.scan(/use '(.*?)'/)[0][0]
                  else
                    line.scan(/use { '(.*?)'/)[0][0]
                  end
  gh_page = Nokogiri::HTML(URI.open("https://github.com/#{gh_repository}"))
  gh_about = gh_page.xpath('//div[.//h2[contains(text(), "About")]]/p').text || 'No description provided'
  vim_plugin_information = "* [#{gh_repository}](https://github.com/#{gh_repository}): #{gh_about.strip}  \n"
  puts "👾 Adding #{gh_repository}"
  File.write('README.md', vim_plugin_information, mode: 'a')
end
puts '✅ Plugins added'
puts 'Job done 👍'

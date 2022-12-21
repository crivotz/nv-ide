require 'nokogiri'
require 'open-uri'
require 'fileutils'

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
File.write('README.md', "\n**PLUGINS.LUA**  \n\n", mode: 'a')
File.open('lua/config/plugins.lua').each_with_index do |line, i|
  next unless line.match(/"([^"]*\/[^"]*)"/)

  gh_repository = line.match(/"([^"]*\/[^"]*)"/)[1] 
  gh_page = Nokogiri::HTML(URI.open("https://github.com/#{gh_repository}"))
  gh_about = gh_page.xpath('//div[.//h2[contains(text(), "About")]]/p').text || 'No description provided'
  vim_plugin_information = "* [#{gh_repository}](https://github.com/#{gh_repository}): #{gh_about.strip}  \n"
  puts "👾 Adding #{gh_repository}"
  sleep(2)
  File.write('README.md', vim_plugin_information, mode: 'a')
end
# Start plugins as module
File.write('README.md', "\n**PLUGINS AS MODULE**  \n\n", mode: 'a')
Dir.foreach('lua/config/plugins') do |entry|
  # Skip the current and parent directories
  next if entry == '.' or entry == '..'
  file_path = File.join('lua/config/plugins', entry)
  File.open(file_path).each_with_index do |line, i|
    next unless line.match(/"([^"]*\/[^"]*)"/)

    gh_repository = line.match(/"([^"]*\/[^"]*)"/)[1] 
    begin
      gh_page = Nokogiri::HTML(URI.open("https://github.com/#{gh_repository}"))
      gh_about = gh_page.xpath('//div[.//h2[contains(text(), "About")]]/p').text || 'No description provided'
      vim_plugin_information = "* [#{gh_repository}](https://github.com/#{gh_repository}): #{gh_about.strip}  \n"
      puts "👾 Adding #{gh_repository}"
      sleep(2)
      File.write('README.md', vim_plugin_information, mode: 'a')
    rescue => e
      puts "Error opening URL: #{e}"
    end
  end
end

puts '✅ Plugins added'
puts 'Job done 👍'

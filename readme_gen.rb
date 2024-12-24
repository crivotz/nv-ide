# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'fileutils'

# Class for README.md generation
class ReadmeGenerator
  def initialize
    @readme_path = 'README.md'
  end

  def generate
    puts 'Generating README.md...'
    truncate_readme
    add_info
    add_plugins
    puts 'Job done 👍'
  end

  private

  def truncate_readme
    File.truncate(@readme_path, 0)
  end

  def add_info
    puts '🗒️ Start info...'
    File.open('INFO.md').each do |line|
      File.write(@readme_path, line, mode: 'a')
    end
    puts '✅ Info added'
  end

  def add_plugins
    puts '🗒️ Start plugins...'
    File.write(@readme_path, "\n**PLUGINS**  \n\n", mode: 'a')
    process_directory('lua/plugins')
    puts '✅ Plugins added'
  end

  def process_directory(dir_path)
    Dir.glob("#{dir_path}/**/*.{lua,toml}").each do |file_path|
      process_file(file_path)
    end
  end

  def process_file(file_path)
    File.readlines(file_path).each do |line|
      next unless line.match?(%r{["']([^"']*/[^"']*)["']})

      gh_repository = line.match(%r{["']([^"']*/[^"']*)["']})[1]
      add_repository_info(gh_repository)
    end
  end

  def add_repository_info(gh_repository)
    puts "👾 Adding #{gh_repository}"
    begin
      gh_page = Nokogiri::HTML(URI.open("https://github.com/#{gh_repository}"))
      gh_about = gh_page.xpath('//div[.//h2[contains(text(), "About")]]/p').text
      gh_about = 'No description provided' if gh_about.empty?

      vim_plugin_information = "* [#{gh_repository}](https://github.com/#{gh_repository}): #{gh_about.strip}  \n"
      File.write(@readme_path, vim_plugin_information, mode: 'a')
      sleep(2) # Respect GitHub's rate limiting
    rescue StandardError => e
      puts "Error processing #{gh_repository}: #{e.message}"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  generator = ReadmeGenerator.new
  generator.generate
end

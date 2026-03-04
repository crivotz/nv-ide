# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'json'

# Class for README.md generation
class ReadmeGenerator
  def initialize
    @readme_path = 'README.md'
    @processed_repos = Set.new
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
    File.write(@readme_path, "\n# PLUGINS  \n\n", mode: 'a')
    process_lazyvim_extras
    process_directory('lua/plugins')
    puts '✅ Plugins added'
  end

  def process_lazyvim_extras
    return unless File.exist?('lazyvim.json')

    lazyvim_data = JSON.parse(File.read('lazyvim.json'))
    return unless lazyvim_data['extras']

    File.write(@readme_path, "- **LazyVim Default**  \n", mode: 'a')
    lazyvim_data['extras'].each do |extra|
      next if extra.include?('lang') || extra.include?('formatting')

      # Convert lazyvim extra path to GitHub repository
      # e.g., "lazyvim.plugins.extras.coding.mini-surround" -> extract plugin info
      extra.split('.').last
      puts "🔧 Processing LazyVim extra: #{extra}"
      File.write(@readme_path, "- **LazyVim Extra**: `#{extra}`  \n", mode: 'a')
    end
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
      next unless valid_repository?(gh_repository)
      next if @processed_repos.include?(gh_repository)

      add_repository_info(gh_repository)
    end
  end

  def valid_repository?(repo)
    return false if repo.nil? || repo.empty?
    return false if repo.start_with?('.') || repo.include?('.git')
    return false unless repo.match?(%r{^[a-zA-Z0-9_-]+/[a-zA-Z0-9_.-]+$})

    parts = repo.split('/')
    parts.size == 2 && !parts[0].empty? && !parts[1].empty?
  end

  def add_repository_info(gh_repository)
    puts "👾 Adding #{gh_repository}"
    @processed_repos.add(gh_repository)
    begin
      gh_page = Nokogiri::HTML(URI.open("https://github.com/#{gh_repository}"))
      gh_about = gh_page.xpath('//div[.//h2[contains(text(), "About")]]/p').text
      gh_about = 'No description provided' if gh_about.empty?

      vim_plugin_information = "- [#{gh_repository}](https://github.com/#{gh_repository}): #{gh_about.strip}  \n"
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

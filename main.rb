require 'nokogiri'

Painting = Struct.new(:name, :link, :image, :extensions, keyword_init: true)

class GoogleParser
  DEFAULT_FILE_PATH = './files/van-gogh-paintings.html'.freeze

  attr_reader :paintings

  def initialize(path = DEFAULT_FILE_PATH)
    @path = path
    @paintings = []
  end

  def parse
    painting = document.css('.klitem').first
    @paintings << Painting.new(name: painting.at_css('.kltat').content)
  end

  private

  def document
    @document ||= File.open(@path) { Nokogiri::HTML(_1) }
  end
end
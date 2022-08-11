require 'net/http'
require 'uri'
require 'nokogiri'
require 'open-uri'

class SMSService
  def initialize(id, name, mobile)
    @id = id
    @name = name 
    @mobile = mobile
  end
  
  def get_balance
    doc = Nokogiri::HTML(URI.open('http://outreach.pk/api/sendsms.php/balance/status?id=rchskynet&pass=Skynet@5599'))
    doc.search('response').children.first.to_s  
  end
  
  def send_message
    id = 'rchskynet'
    pass = 'Skynet@5599'
    mask = 'SKY NET'
    number = get_number(@mobile)
    lang = 'English'
    msg = "#{@name} - Welcome To Sky Net"
    uri = URI.parse("http://outreach.pk/api/sendsms.php/sendsms/url?id=#{id}&pass=#{pass}&mask=#{mask}&to=#{number}&lang=#{lang}&msg=#{msg}&type=xml")
    request = Net::HTTP::Post.new(uri)
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end
    response.code
  end
  
  private 
  
  def get_number(n)
    num = n.tr('-', '')
    
    return if num.chars.first == '9'
    
    num.gsub(/^./, '92') if n.chars.first == '0'
  end
end
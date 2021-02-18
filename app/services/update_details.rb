class UpdateDetails

  def initialize(codestatus)
    @codestatus = Codestatus.find(codestatus)
    require 'httparty'
    require 'json'
    response = HTTParty.get("http://UsanPull1API.usanorth811.org/members?code="+ @codestatus.code, :verify => false)
    @member_detail = response['data'][0]
  end

  def update
    @result = HTTParty.put("http://UsanPull1API.usanorth811.org/members/#{@member_detail['id']}",
                           :body => {:member => {
                               :comments => "#{@member_detail['attributes']['comments']}
                                             [#{@codestatus.sar_updated ? "SAR_UPDATED" : "CONTACTS_UPDATED"}:
                                             #{@codestatus.created_at.to_s}]"
                           }}.to_json,
                           :headers => { 'Content-Type' => 'application/json' } )
    puts @result.code
  end

end
# encoding: UTF-8
require "spec_helper"

describe HomeController do

  describe "Movies#" do
    def stub_requests
      WebMock.stub_request(:post, "http://www.viki.com/oauth/token?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&grant_type=client_credentials").
          to_return(
            :status => 200, 
            :body => '{"access_token":"684bdc5e7f82fff2f60d3666d102f5a581259d219eaf0aee7a7522f38730c4e9","expires_in":86400,"scope":"public","token_type":"bearer"}', 
            :headers => {}
          )

      WebMock.stub_request(:get, "http://www.viki.com/api/v3/featured.json?access_token=684bdc5e7f82fff2f60d3666d102f5a581259d219eaf0aee7a7522f38730c4e9").
          to_return(
            :status => 200, 
            :body => '{"count":19,"pagination":{"previous":"","next":""},"response":[{"id":422,"title":"Viki Music Exclusive","description":"A one-on-one interview with all 12 members of EXO at SM Town Jakarta. Watch it now! ","image":"http://x1.vikiassets.com/aHR0cDovL3gwLnZpa2lhc3NldHMuY29tL3VwbG9hZHMvbWFzdGhlYWQvaW1hZ2UvNDIyL2Y0MTU5MzM3NGU0NmQ3ZDFhYzk4Njc2MmI2ZTRjZjE1MWVmZWFlMzguanBn","created_at":"October 15, 2012 04:25","type":"music_video","resource":{"id":79885,"title":"Viki Exclusive in SM Town Jakarta ","title_language":"en","description":"","description_language":"","uri":"http://www.viki.com/api/v3/music_videos/79885.json","web_uri":"http://www.viki.com/channels/6762-exo/videos/79885","created_at":"October 11, 2012 04:13","genres":[],"origin_country":"Various Countries","subtitles":{"en":100,"id":100,"fr":16},"image":"http://x1.vikiassets.com/aHR0cDovL3gxLnZpa2lhc3NldHMuY29tL3VwbG9hZHMvbWVkaWFfcmVzb3VyY2UvdGh1bWJuYWlsLzIwNjg4NC8xOTA2YTQ3N2EzMDBlNjViMzJhNzk0MTAwMjQ2MmJhMGViYjRkYjNhLnBuZw==","artist":{"id":6762,"uri":"http://www.viki.com/api/v3/artists/6762.json","name":"EXO"},"formats":{"flash_embed":"http://a3.vikiassets.com/assets/vikiplayer.swf?auto_play=true&language_codes=en&media_id=79885&partner=97&source=api_v3"}}},{"id":426,"title":"Viki Cinema: Herb","description":"Twenty-year-old Sang Eun is developmentally delayed and thinks like a 7-year-old.But Sang Eun begins to experience adult emotions when she falls in love with a police officer. ","image":"http://x0.vikiassets.com/aHR0cDovL3gwLnZpa2lhc3NldHMuY29tL3VwbG9hZHMvbWFzdGhlYWQvaW1hZ2UvNDI2LzA5YWVlMzhhM2Y4NGVjY2JkODRkMWYwZWY0NWJmMjVjZTk0OWU5Y2QuanBn","created_at":"October 19, 2012 11:17","type":"movie","resource":{"id":64481,"channel_id":7305,"title":"Herb","title_language":"en","description":"Twenty-year-old Sang Eun is developmentally delayed and thinks like a 7-year-old. She spends her days making intricate origami designs and dreaming of marrying her Prince Charming, just like in the books she reads. Her mother dotes on her and tries to do everything in her power to shield her from harm. But Sang Eun begins to experience adult emotions when she falls in love with a police officer. How much longer can Sang Eun\u2019s mother continue to protect her daughter?","description_language":"en","subscriptions":{"count":91},"created_at":"February 24, 2012 07:00","uri":"http://www.viki.com/api/v3/movies/64481.json","web_uri":"http://www.viki.com/channels/7305-herb/videos/64481","genres":[{"id":9,"name":"Drama"},{"id":23,"name":"Korean Drama"}],"origin_country":"Korea","image":"http://x1.vikiassets.com/uploads/channel/thumbnail/7305/7056e01270c30a5304ea75682259f5491340cedc.jpg/w460/h335/a","subtitles":{"en":100,"fr":100,"id":100,"es":100,"ms":15,"tr":1},"formats":{"flash_embed":"http://a3.vikiassets.com/assets/vikiplayer.swf?auto_play=true&language_codes=en&media_id=64481&partner=97&source=api_v3"}}}]}',
            :headers => {}
          )


      WebMock.stub_request(:get, "http://www.viki.com/api/v3/genres/movies.json?access_token=684bdc5e7f82fff2f60d3666d102f5a581259d219eaf0aee7a7522f38730c4e9").
          to_return(
            :status => 200, 
            :body => '{"count":15,"pagination":{"previous":"","next":""},"response":[{"id":1,"name":"Action & Adventure"},{"id":2,"name":"Anime"},{"id":4,"name":"Cartoon"},{"id":5,"name":"Classic & Period"},{"id":6,"name":"Comedy"},{"id":7,"name":"Crime"},{"id":9,"name":"Drama"},{"id":11,"name":"Historical"},{"id":12,"name":"Horror & Supernatural"},{"id":13,"name":"Independent"},{"id":23,"name":"Korean Drama"},{"id":17,"name":"Music"},{"id":18,"name":"Romance"},{"id":19,"name":"SciFi & Fantasy"},{"id":20,"name":"Sports"}]}',
            :headers => {}
          )
    end

    it "should list list all the feature movies" do
      stub_requests

      get :index
      response.code.should eq("200")
      assigns(:movies).should_not be_nil
    end
  end
end

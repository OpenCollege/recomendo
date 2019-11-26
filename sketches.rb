url = "https://nordweg-cors.herokuapp.com/?http://youtube.com/get_video_info?video_id=HPJKxAhLw5I"
video_id = "HPJKxAhLw5I"

thumbnail = "https://img.youtube.com/vi/#{video_id}/hqdefault.jpg"

video_info = open("http://youtube.com/get_video_info?video_id=#{video_id}").read
parsed_info = Rack::Utils.parse_nested_query(video_info)
json_info = JSON.parse(parsed_info["player_response"])
title = json_info.dig("videoDetails","title")



// JS
video_id = "HPJKxAhLw5I"

title = null
url = `https://nordweg-cors.herokuapp.com/?http://youtube.com/get_video_info?video_id=${video_id}`
thumbnail = `https://img.youtube.com/vi/${video_id}/hqdefault.jpg`
$.get( url, function( data ) {
  parsed_info = JSON.parse('{"' + data.replace(/&/g, '","').replace(/=/g,'":"') + '"}', function(key, value) { return key===""?value:decodeURIComponent(value) })
  json_info = JSON.parse(parsed_info.player_response)
  title = json_info.videoDetails.title.replace(/\+/g, ' ');
}).done(function() {
  $('#videoPreview').append(`<img src=${thumbnail} width="100" height="100"/>`);
  $('#videoPreview').append(`</br><h1>${title}</h1>`);
});

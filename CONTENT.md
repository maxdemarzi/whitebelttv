# Content Requirements

You need the video link, the thumbnail image link, video length in seconds, title and description. 
[Video Formats Supported](https://developer.roku.com/en-gb/docs/specs/media/streaming-specifications.md)

To retrieve a youtube video use yt-dlp. 

For a playlist:

    .\yt-dlp.exe --convert-thumbnails jpg --write-thumbnail -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" <playlist url>

For a single video:

    .\yt-dlp.exe --convert-thumbnails jpg --write-thumbnail <video url>
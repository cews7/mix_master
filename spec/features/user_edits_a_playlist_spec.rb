require 'rails_helper'


RSpec.feature "User edits an existing playlist" do
 scenario "they see the updated data for the individual playlist" do
   playlist             = create(:playlist)
   song_one, song_two, song_three = create_list(:song, 3)

   new_song             = create(:song, title: "New Song")
   playlist.songs << song_one

   visit playlist_path(playlist)
   click_on "Edit"
   fill_in "playlist_name", with: 'TestPlaylist'
   uncheck("song-#{song_one.id}")
   check("song-#{new_song.id}")
   click_on "Update Playlist"

   expect(page).to have_content "TestPlaylist"
   expect(page).to have_content new_song.title
   expect(page).to_not have_content song_one.title
 end
end

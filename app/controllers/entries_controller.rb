class EntriesController < ApplicationController
  before_action :set_author, only: [:index, :show]

  def index

  end


  def show
    response = Typhoeus.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=9861387.79be83d.e6f6b8f3923c4fa9949490f467c2eee2")
    result = JSON.parse(response.body)
    first_entry = result['data'][0]
    puts '----------------------------------------------------'
    puts first_entry['images']['standard_resolution']['url']
    puts first_entry['caption']['text']
    puts first_entry['location']
    puts first_entry['created_time']
    puts '----------------------------------------------------'
    @entry = Entry.new
    @entry.caption = first_entry['caption']['text'] if first_entry['caption']['text']
    @entry.time_posted = first_entry['created_time']
    @entry.image_url = first_entry['images']['standard_resolution']['url']
    @entry.location = first_entry['location'] if first_entry['location']
    @entry.author_id = @author.id
    if @entry.save
      puts 'saved'
    else
      puts 'not saved'
    end
  end

  private

  def set_author
    @author = Author.find_by(params[:author_id])
  end
end

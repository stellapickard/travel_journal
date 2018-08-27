class EntriesController < ApplicationController
  before_action :set_author, only: [:show]

  def index
  end

  def new
    response = Typhoeus.get("https://api.instagram.com/v1/users/self/media/recent/?access_token=9861387.79be83d.e6f6b8f3923c4fa9949490f467c2eee2")
    result = JSON.parse(response.body)
   
    entries = result['data']
    entries.each do |e|
      @entry = Entry.new
      @entry.caption = e['caption']['text'] if e['caption']['text']
      @entry.time_posted = e['created_time']
      @entry.image_url = e['images']['standard_resolution']['url']
      @entry.location = e['location']['name'] if e['location']
      @entry.author_id = params[:id]
      if @entry.save
        puts 'save'
      else
        puts 'not saved'
      end
    end
   
    redirect_to author_entry_path(params[:id])
  end

  def create
  end

  def show
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end
end

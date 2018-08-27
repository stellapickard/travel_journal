class AuthorController < ApplicationController
  before_action :set_author, only: [:index, :show, :edit, :update]

  def home
  end

  def index
  end
  
  def new
    @author = Author.new
  end

  def show
  end

  def create
    response = Typhoeus.get("https://api.instagram.com/v1/users/self/?access_token=9861387.79be83d.e6f6b8f3923c4fa9949490f467c2eee2")
    result = JSON.parse(response.body)
    @author = Author.new
    @author.user_id = result.dig('data', 'id')
    @author.user_name = result.dig('data', 'username')
    @author.profile_picture = result.dig('data', 'profile_picture')
    @author.bio = result.dig('data', 'bio')
    if @author.save
      puts 'saved'
    else
      puts 'not saved'
    end
  end

  def edit
  end

  def update
    if @author.update(trip_description: params[:author][:trip_description])
      flash[:notice] = "Author updated"
      redirect_to author_path(@author)
    else
      flash[:notice] = "Author not updated"
      redirect_to action: "edit"
    end
  end

  # def destroy
  #   @instagram.destroy
  #   respond_to do |format|
  #     format.html { redirect_to instagrams_url, notice: 'Instagram was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def get_author_info
  
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.permit(:permitted_params)
  end

  def permitted_params
    [ :user_id,
      :user_name,
      :profile_picture,
      :bio,
      :trip_description ]
  end
end

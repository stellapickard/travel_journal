class AuthorController < ApplicationController
  def new
    @author = Author.new
  end

  def edit
  end

  def show
  end

  def create
    response = Typhoeus.get("https://api.instagram.com/v1/users/self/?access_token=9861387.79be83d.e6f6b8f3923c4fa9949490f467c2eee2")
    result = JSON.parse(response.body)
    @author = Author.new
    @author.user_id = result.dig('data', 'id'),
    @author.user_name = result.dig('data', 'username'),
    @author.profile_picture = result.dig('data', 'profile_picture'),
    @author.bio = result.dig('data', 'bio')
    if @author.save
      puts 'saved'
    else
      puts 'not saved'
    end
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @instagram.destroy
    respond_to do |format|
      format.html { redirect_to instagrams_url, notice: 'Instagram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_author_info
  
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author_params).permit(permitted_params)
  end

  def permitted_params
    [
      :user_id,
      :user_name,
      :profile_picture,
      :bio,
      :trip_description
    ]
  end
end

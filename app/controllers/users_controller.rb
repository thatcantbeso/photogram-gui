class UsersController < ApplicationController
  
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

  render ({ template: "user_templates/index"})
  end

  def show

    # Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/404")
    else
      render ({ template: "user_templates/show"})
    end
  end

  def create
    #  Parameters: {"input_username"=>"aaron"}

  input_username = params.fetch("input_username")

  a_new_username = User.new
  a_new_username.username = input_username

  a_new_username.save

    #render ({ template: "user_templates/create"})
    redirect_to("/users/" + a_new_username.username.to_s)
  end
end

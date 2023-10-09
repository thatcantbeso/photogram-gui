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
  
  def update
#Parameters: {"input_username"=>"alfred", "modify_username"=>"123"}
  the_id = params.fetch("modify_username")
  matching_username = User.where({ :id => the_id })
  the_user = matching_username.at(0)

  input_user = params.fetch("input_username")

  the_user.username = input_user

  the_user.save

redirect_to("/users/" + the_user.username.to_s)
  end
end

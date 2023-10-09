class PhotosController < ApplicationController

  def index
      matching_photos = Photo.all

      @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ template: "photos_templates/index"})
  end

  def show
      # Parameters: {"path_id"=>"777"}
      url_id = params.fetch("path_id")

      matching_photos = Photo.where({ :id => url_id })

      @the_photo = matching_photos.at(0)

    render({ template: "photos_templates/show"})
  end

  def baii
    #Parameters: {"toast_id"=>"695"}
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ template: "photos_templates/baii"})

    redirect_to("/photos")
  end

  def create
# Parameters: {"query_image"=>"a", "query_caption"=>"b ", "query_owner_id"=>"c"}

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

      redirect_to("/photos/" + a_new_photo.id.to_s )
    #render({ template: "photos_templates/create"})
  end

  def update
 # Parameters: {"query_image"=>"https://robohash.org/dolorehicincidunt.png?size=300x300&set=set1", "query_caption"=>"testtt", "modify_id"=>"777"}

 the_id = params.fetch("modify_id")
 matching_photos = Photo.where({ :id => the_id })
 the_photo = matching_photos.at(0)

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")

 the_photo.image = input_image
 the_photo.caption = input_caption

 the_photo.save
redirect_to("/photos/" + the_photo.id.to_s)
    #render({ template: "photos_templates/update"})
  end

  def acomment
    #Parameters: {"query_photo_id"=>"777", "query_author_id"=>"177", "query_comment"=>"hello\r\n"}

  input_photo_id = params.fetch("query_photo_id")
  input_author_id = params.fetch("query_author_id")
  input_comment = params.fetch("query_comment")

  input= Comment.new
  input.photo_id = input_photo_id
  input.author_id = input_author_id
  input.body = input_comment

  input.save

redirect_to("/photos/" + input.photo_id.to_s)
    #render({ template: "photos_templates/comment"})
  end
end

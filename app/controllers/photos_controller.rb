class PhotosController <ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form

    render("photos/new_form.html.erb")
  end

  def create_row
    url= params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save

    redirect_to("/photos")
  end

  def show
    the_id = params[:id]
    @my_photo=Photo.find(the_id)
    render("photos/show.html.erb")

  end

  def update_row

    the_id = params[:id]

    my_photo=Photo.find(the_id)

    my_photo.caption = params[:da_caption]

    my_photo.source = params[:da_source]

    my_photo.save

    redirect_to("/photos/#{my_photo.id}")

  end

  def edit_form

    the_id = params[:id]
    @my_photo=Photo.find(the_id)

    render("photos/edit_form.html.erb")

  end

  def destroy_row

    the_id = params[:id]
    my_photo=Photo.find(the_id)

    my_photo.destroy

    redirect_to("/photos")

  end



end

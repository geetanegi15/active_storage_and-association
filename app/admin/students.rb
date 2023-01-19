ActiveAdmin.register Student do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :email, :course, :DOB , :profile_image , :profile_video
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :course, :DOB]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form do |f|
    f.inputs 'Student' do
     # f.input :tag_list, :input_html => {:value => f.object.tag_list.join(", ") }, :label => "Tags (separated by commas)".html_safe
      f.input :name
      f.input :email
      f.input :course
      f.input :DOB
      f.input :profile_image , as: :file
      f.input :profile_video , as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :course
      row :DOB
      row :profile_image do |ad|
        image_tag (url_for(ad.profile_image) rescue ""), size: "100x120"
      end
      row :profile_video do |vd|
        video_tag (url_for(vd.profile_video) rescue "") , size: "200x200"  , controls: true
      end
    end
  end

index do
  selectable_column
  
  id_column
  column :name
  column :email 
  column :course
  column :DOB
  column :profile_image do |ad|
    image_tag (url_for(ad.profile_image) rescue "") , size: "80x80"
  end
  column :profile_video do |vd|
    video_tag (url_for(vd.profile_video) rescue "") , size: "80x80" , controls: true
  end

  actions
end

end

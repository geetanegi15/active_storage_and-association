class StudentsController < ApplicationController

    def index
       # @q = Student.ransack(params[:q])
       # @students = @q.result(distinct: true)

       @students = Student.all
       #render json: @students.to_json(include: :image_url)  # used with serializer
       render json: @students.map{ |st|
                    if st.profile_image.attached? && st.profile_video.attached?
                        st.as_json.merge(
                            profile_image: url_for(st.profile_image) ,
                            profile_video: url_for(st.profile_video) 
                        )
                    elsif st.profile_image.attached?
                        st.as_json.merge(
                            profile_image: url_for(st.profile_image)
                        )
                    elsif st.profile_video.attached?
                        st.as_json.merge(
                            profile_video: url_for(st.profile_video)
                        )
                    else
                        st.as_json
                    end
                }
            end

    def create
        @student = Student.create!(student_params)
        #@student = Student.create! params.require(:student).permit(:name , :email , :course ,:DOB , :profile_image , :profile_video)
        #@student.profile_image.attach(params[:student][:profile_image])
        #@student.profile_video.attach(params[:student][:profile_video])

        if @student.save!
            if @student.profile_image.attached? && @student.profile_video.attached?
                render json: @student.as_json.merge(profile_image: url_for(@student.profile_image) , profile_video: url_for(@student.profile_video))
            else
                render json: @student
            end
        else
            render json: {error: "student not saved"}
        end
    end
    def show
        @student = Student.find(params[:id])
           if @student.profile_image.attached? && @student.profile_video.attached?
              render json: @student.as_json(only: %i[name]).merge(
                          profile_image: url_for(@student.profile_image))
            elsif @student.profile_image.attached?
                render json: @student.as_json.merge(profile_image: url_for(@student.profile_image))
            elsif @student.profile_video.attached?
                render json: @student.as_json.merge(profile_video: url_for(@student.profile_video))
           else 
             render json: @student.as_json
          end 
    end

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
    end

   private
    def student_params
        params.permit(:name , :email ,:course , :DOB , :profile_image , :profile_video )
        #@student.profile_image.attach(params.require(:profile_image))
    end
end

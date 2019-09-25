class Admin::InactiveFamiliesController < ApplicationController
    def index
        @families = Family.inactive
        #start_date = Period.current_period_start_date
        # @families = Family.joins(:tasks).where("tasks.performed_on > ?", start_date).select('families.*, sum(tasks.hours) as total_hours').group('families.id').order("#{sort_column} #{sort_direction}")
        # @families = Family.select('families.*, sum(tasks.hours) as total_hours').left_outer_joins(:tasks).where("tasks.performed_on > ?", start_date).group('families.id').order("#{sort_column} #{sort_direction}")
    end
    
    
    def create
        @family = Family.find(params[:id])
        @family.is_active = false

        #find users in family and deactivate
        @family.users.update_all(is_active: false)

        if @family.save
            flash[:notice] = "The #{@family.name} family has been deactivated."
        end

        redirect_to admin_families_path
    end

    def destroy
        @family = Family.find(params[:id])
        @family.is_active = true

        #find users in family and reactivate
        @family.users.update_all(is_active: true)
        
        if @family.save
            flash[:notice] = "The #{@family.name} family has been activated."
        end

        redirect_to admin_families_path


    end

    private

    def family_params
        params.require(:inactive_family).permit(:id)
    end
    
end

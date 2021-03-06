class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /registers
  # GET /registers.json
  def index
    if(current_user.admin)
      if params[:search]
        #@registers = Register.joins(:semester).where('semesters.semester_name LIKE ?', "%"+params[:search]+"%")|Register.joins(:course).where('courses.course_name LIKE ?', "%"+params[:search]+"%")
        @registers = Register.joins(:semester).where('semesters.semester_name LIKE ?',"%"+params[:search]+"%")|Register.joins(:user).where('users.email LIKE ?', "%"+params[:search]+"%")
        respond_to do |format|
          format.js {}
        end
      else
        @registers = Register.all
      end
    else
      if params[:search]
        @registers = Register.joins(:semester).where('user_id = ? and semesters.semester_name LIKE ?', current_user.id,"%"+params[:search]+"%")|Register.joins(:course).where('user_id=? and courses.course_name LIKE ?', current_user.id,"%"+params[:search]+"%")
        respond_to do |format|
          format.js {}
        end
      else
      @registers = Register.where(user_id: current_user.id)
      end

    end



  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)
    #@register = Register.find(id) || Register.new
    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:user_id, :course_id, :semester_id, :cgpa)
    end
end

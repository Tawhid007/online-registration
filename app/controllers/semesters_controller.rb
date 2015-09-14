class SemestersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  before_action :student_restrict , restrict: [:new, :edit]

  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all
    unless current_user.admin
      gpa= Register.joins(:user).joins(:semester).where('user_id = ?',current_user.id).pluck(:cgpa)
      gpa.delete(nil)
      @cgpa= gpa.inject(0){|sum,i| sum+i} / gpa.size
      @gpa= {}
      # @value=0;
      @semesters.each do |semester|
        temp=Register.joins(:user).joins(:semester).where('user_id = ? and semesters.semester_name=?',4,"#{semester.semester_name}").pluck(:cgpa)
        temp.delete(nil)
        as= temp.inject(0){|sum,i| sum+i} / temp.size if temp.present?
        @gpa[semester.semester_name] = as
      end
    end
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params)

    respond_to do |format|
      if @semester.save
        format.html { redirect_to @semester, notice: 'Semester was successfully created.' }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html { render :new }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semesters_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end

    def student_restrict

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:semester_name, :semester_type)
    end
end

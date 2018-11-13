class QuestionAnswersController < ApplicationController
  before_action :set_question_answer, only: [:show, :edit, :update, :destroy]

  # GET /question_answers
  # GET /question_answers.json
  def index
    @question_answers = QuestionAnswer.all
  end

  # GET /question_answers/1
  # GET /question_answers/1.json
  def show
  end

  # GET /question_answers/new
  def new
    @question_answer = QuestionAnswer.new
  end

  # GET /question_answers/1/edit
  def edit
  end

  # POST /question_answers
  # POST /question_answers.json
  def create
    @num_questions_2_3_1_9 = 0
    @num_questions_2_3_10_18 = 0
    @sum_questions_1_18 = 0
    @num_questions_2_3_19_26 = 0
    @num_questions_2_3_27_40 = 0
    @num_questions_2_3_41_47 = 0
    @num_questions1_2_3_48_55 = 0




    (1..47).each do |i|
      question_response = params["question#{i}"]
      if i > 0 && i < 10
        if question_response == '2' || question_response == '3'
          @num_questions_2_3_1_9 += 1
        end
      end
      if i >= 10 && i <= 18
        if question_response == '2' || question_response == '3'
          @num_questions_2_3_10_18 += 1
        end
      end

      if i >= 19 && i <= 26
        if question_response == '2' || question_response == '3'
          @num_questions_2_3_19_26 += 1
        end
      end

      if i >= 27 && i <= 40
        if question_response == '2' || question_response == '3'
          @num_questions_2_3_27_40 += 1
        end
      end

      if i >= 41 && i <= 47
        if question_response == '2' || question_response == '3'
          @num_questions_2_3_41_47 += 1
        end
      end

      if i > 0 && i < 19
        @sum_questions_1_18 += question_response.to_i
      end
    end
    answer_array = []
    (48..55).each do |i|
      question_response = params["question#{i}"]

      if question_response == '4' || question_response == '5'
        @num_questions1_2_3_48_55 += 1
      end

      answer_array = answer_array.push(question_response.to_i)
      @average_score = answer_array.sum / answer_array.size.to_f
    end

    if @num_questions_2_3_1_9 >= 6 && @num_questions1_2_3_48_55 > 0
      @diagnosis1= "Predominantly Inattentive subtype"
    end
    if @num_questions_2_3_10_18 >= 6 && @num_questions1_2_3_48_55 > 0
      @diagnosis2= "Predominantly Hyperactive/Impulsive subtype"
    end
    if @num_questions_2_3_1_9 >= 6 && @num_questions1_2_3_48_55 > 0 && @num_questions_2_3_10_18 >= 6
      @diagnosis3= "ADHD Combined Inattention/Hyperactivity"
    end
    if @num_questions_2_3_19_26 >= 4 && @num_questions1_2_3_48_55 > 0
      @diagnosis4= "Oppositional-Defiant Disorder Screen"
    end
    if @num_questions_2_3_27_40 >= 3 && @num_questions1_2_3_48_55 > 0
      @diagnosis5= "Conduct Disorder Screen"
    end
    if @num_questions_2_3_41_47 >= 3 && @num_questions1_2_3_48_55 > 0
      @diagnosis6= "Anxiety/Depression Screen"
    end

  end


  def update
    respond_to do |format|
      if @question_answer.update(question_answer_params)
        format.html { redirect_to @question_answer, notice: 'Question answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_answer }
      else
        format.html { render :edit }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_answers/1
  # DELETE /question_answers/1.json
  def destroy
    @question_answer.destroy
    respond_to do |format|
      format.html { redirect_to question_answers_url, notice: 'Question answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_answer
      @question_answer = QuestionAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_answer_params
      params.require(:question_answer).permit(:qnumber, :qanswer)
    end

end

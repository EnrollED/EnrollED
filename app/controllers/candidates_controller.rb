class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :pdf_export_show]

  layout 'home'

  def index
    authorize ApplicationChoice

    # @calcs = {}

    @candidates = ApplicationChoice.advanced_search(params[:faculty_id], params[:study_program_id], params[:type_of_study_id], params[:mode_of_study_id])
                      .includes([{study_program_mode: [{study_program: [:higher_education_institution, :type_of_study]}, :mode_of_study]}, {application: [:user]}])
                      .order('higher_education_institutions.name, study_programs.name, mode_of_studies.name DESC, users.lastname')
                      .page(params[:page])

    # @candidates.each do |c|
    #   @calcs[c.id] = calculate(c)
    # end

    @available_faculties = HigherEducationInstitution.includes(:university)
                               .order('universities.name, higher_education_institutions.name')

    @study_programs = StudyProgram.includes(:higher_education_institution, :type_of_study).order(:name)

    @type_of_studies = TypeOfStudy.order(:name)

    @mode_of_studies = ModeOfStudy.order(:name)
  end

  def show
    @calcs = calculate(@candidate)
  end

  def pdf_export
    authorize ApplicationChoice
    @candidates = ApplicationChoice
                      .includes([{study_program_mode: [{study_program: [:higher_education_institution, :type_of_study]}, :mode_of_study]}, {application: [:user]}])
                      .order('higher_education_institutions.name, study_programs.name, mode_of_studies.name DESC, users.lastname')

    respond_to do |format|
      format.html
      format.pdf do
        #export_pdf
        html = render_to_string(:action => :pdf_export, :layout => 'layouts/layout_pdf.html.erb', :template => 'candidates/pdf_export.html.erb')
        pdf = WickedPdf.new.pdf_from_string(html, :orientation => 'Landscape')
        send_data(pdf,
                  :filename => "kandidati.pdf",
                  :disposition => 'attachment')
      end
    end
  end

  def pdf_export_show
    @calcs = calculate(@candidate)

    respond_to do |format|
      format.html
      format.pdf do
        #export_pdf
        html = render_to_string(:action => :pdf_export, :layout => 'layouts/layout_pdf.html.erb', :template => 'candidates/pdf_export_show.html.erb')
        pdf = WickedPdf.new.pdf_from_string(html)
        send_data(pdf,
                  :filename => "kandidat.pdf",
                  :disposition => 'attachment')
      end
    end
  end

  private
  def set_candidate
    @candidate = ApplicationChoice.find(params[:id])
  end

  def calculate(candidate)
    calcs = []

    candidate.study_program_mode.study_program.requirements.each do |r|
      calc = {}
      calc[:req] = r.highschool_completion

      user_req = candidate.application.user.user_highschool_completions
                     .where(highschool_completion_id: r.highschool_completion.id).first

      if user_req.nil? || !user_req.passed?
        calc[:pass] = false
      else
        # r.requirement_elements.each do |el|
        #   user_el = @candidate.application.user.user_elements.where(element_id: el.element.id).first
        #
        #   if user_el.nil? || user_el.score < 2
        #     calc[:pass] = false
        #     calcs.push(calc)
        #     return
        #   end
        # end

        calc[:points] = 0.0
        calc[:pass] = true

        r.study_program_elements.each do |el|

          if el.element.code == 'A992'
            if r.requirement_elements.empty?
              calc[:points] += el.percentage
            else
              #percentage = el.percentage / r.requirement_elements.count

              score = 0
              has_element = false
              elements = candidate.application.user.user_elements.collect { |e| e.element.code }

              r.requirement_elements.each do |el_req|
                user_el_req = candidate.application.user.user_elements.where(element_id: el_req.element.id).first

                elementbla = el_req.element.code

                if !user_el_req.nil? and user_el_req.score > 1
                  score += user_el_req.score * 20 * (el.percentage / 100)
                  has_element = true
                end
              end

              if elements.include?('L401') and elements.include?('M401')
                calc[:pass] = false
                calcs.push(calc)
                return calcs
              end

              if has_element
                calc[:points] += score
              else
                calc[:pass] = false
                calcs.push(calc)
                return calcs
              end
            end

            next
          end

          user_el = candidate.application.user.user_elements.where(element_id: el.element.id).first

          if user_el.nil?
            calc[:pass] = false
            calcs.push(calc)
            return calcs
          end

          if el.element.code == 'A990'
            calc[:points] += Element::PRETVORBA[:poklicna_matura][user_el.score.to_i] * (el.percentage / 100)
          elsif el.element.code == 'A991'
            calc[:points] += Element::PRETVORBA[:splosna_matura][user_el.score.to_i] * (el.percentage / 100)
          elsif el.element.code == 'A993' || el.element.code == 'Y401'
            calc[:points] += user_el.score.to_i * 10 * (el.percentage / 100)
          else
            calc[:points] += user_el.score * 20 * (el.percentage / 100)
          end
        end
      end

      calcs.push(calc)
    end

    calcs
  end
end
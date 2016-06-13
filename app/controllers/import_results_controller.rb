class ImportResultsController < ApplicationController

  layout 'home'

  def index
  end

  def splosna_matura
    file = params[:file]

    if file.nil?
      return redirect_to action: :index, alert: 'Datoteka ni bila podana'
    end

    matura_pogoj = HighschoolCompletion.find_by_code('1')
    uspeh_matura = Element.find_by_code('A991')
    uspeh_letniki = Element.find_by_code('A993')

    file.read.to_s.each_line do |l|
      columns = l.split('Q')

      if columns.count != 10
        return redirect_to action: :index, alert: 'Datoteka ni v pravem formatu'
      end

      next if columns[7] == '7'

      user = User.where('applications."EMSO" = ?', columns[0]).joins(:applications).first

      if user.present?
        user_matura_pogoj = user.user_highschool_completions.find_or_create_by(highschool_completion_id: matura_pogoj.id)
        user_uspeh_matura = user.user_elements.find_or_create_by(element_id: uspeh_matura.id)
        user_uspeh_letniki = user.user_elements.find_or_create_by(element_id: uspeh_letniki.id)

        user_matura_pogoj.passed = columns[4] == 'D'
        user_uspeh_matura.score = columns[3].to_f

        if columns[7] == '9'
          user_uspeh_letniki.score = columns[3].to_f
        else
          user_uspeh_letniki.score = (columns[5].to_f + columns[6].to_f)
        end

        user_matura_pogoj.save
        user_uspeh_matura.save
        user_uspeh_letniki.save
      end
    end

    redirect_to action: :index, notice: 'Rezultati so bili uspešno uvoženi'
  end

  def splosna_matura_predmeti
    file = params[:file]

    if file.nil?
      return redirect_to action: :index, alert: 'Datoteka ni bila podana'
    end

    file.read.to_s.each_line do |l|
      columns = l.split('Q')

      if columns.count != 7
        return redirect_to action: :index, alert: 'Datoteka ni v pravem formatu'
      end

      user = User.where('applications."EMSO" = ?', columns[0]).joins(:applications).first
      uspeh_predmet = Element.find_by_code(columns[1])

      if user.present? and uspeh_predmet.present?
        user_uspeh_predmet = user.user_elements.find_or_create_by(element_id: uspeh_predmet.id)
        user_uspeh_predmet.score = columns[2].to_f
        user_uspeh_predmet.save

        if uspeh_predmet.code == 'M401' || uspeh_predmet.code == 'L401'
          uspeh_letniki = Element.find_by_code('Y401')

          if uspeh_letniki.present?
            user_uspeh_letniki = user.user_elements.find_or_create_by(element_id: uspeh_letniki.id)
            user_uspeh_letniki.score = 0 + columns[3].to_f + columns[4].to_f
            user_uspeh_letniki.save
          end
        end
      end
    end

    redirect_to action: :index, notice: 'Rezultati so bili uspešno uvoženi'
  end

  def poklicna_matura
    file = params[:file]

    if file.nil?
      return redirect_to action: :index, alert: 'Datoteka ni bila podana'
    end

    matura_pogoj = HighschoolCompletion.find_by_code('2')
    uspeh_matura = Element.find_by_code('A990')
    uspeh_letniki = Element.find_by_code('A993')

    file.read.to_s.each_line do |l|
      columns = l.split('Q')

      if columns.count != 10
        return redirect_to action: :index, alert: 'Datoteka ni v pravem formatu'
      end

      next if columns[7] == '7'

      user = User.where('applications."EMSO" = ?', columns[0]).joins(:applications).first

      if user.present?
        user_matura_pogoj = user.user_highschool_completions.find_or_create_by(highschool_completion_id: matura_pogoj.id)
        user_uspeh_matura = user.user_elements.find_or_create_by(element_id: uspeh_matura.id)
        user_uspeh_letniki = user.user_elements.find_or_create_by(element_id: uspeh_letniki.id)

        user_matura_pogoj.passed = columns[4] == 'D'
        user_uspeh_matura.score = columns[3].to_f

        if columns[7] == '9'
          user_uspeh_letniki.score = columns[3].to_f
        else
          user_uspeh_letniki.score = (columns[5].to_f + columns[6].to_f)
        end

        user_matura_pogoj.save
        user_uspeh_matura.save
        user_uspeh_letniki.save
      end
    end

    redirect_to action: :index, notice: 'Rezultati so bili uspešno uvoženi'
  end

  def poklicna_matura_predmeti
    file = params[:file]

    if file.nil?
      return redirect_to action: :index, alert: 'Datoteka ni bila podana'
    end

    file.read.to_s.each_line do |l|
      columns = l.split('Q')

      if columns.count != 7
        return redirect_to action: :index, alert: 'Datoteka ni v pravem formatu'
      end

      user = User.where('applications."EMSO" = ?', columns[0]).joins(:applications).first
      uspeh_predmet = Element.find_by_code(columns[1])

      if user.present? and uspeh_predmet.present?
        user_uspeh_predmet = user.user_elements.find_or_create_by(element_id: uspeh_predmet.id)
        user_uspeh_predmet.score = columns[2].to_f
        user_uspeh_predmet.save

        if uspeh_predmet.code == 'M401' || uspeh_predmet.code == 'L401'
          uspeh_letniki = Element.find_by_code('Y401')

          if uspeh_letniki.present?
            user_uspeh_letniki = user.user_elements.find_or_create_by(element_id: uspeh_letniki.id)
            user_uspeh_letniki.score = 0 + columns[3].to_f + columns[4].to_f
            user_uspeh_letniki.save
          end
        end
      end
    end

    redirect_to action: :index, notice: 'Rezultati so bili uspešno uvoženi'
  end
end

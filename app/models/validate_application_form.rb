class ValidateApplicationForm < ActiveModel::Validator
  def validate(record)

    if Citizen.find_by_code(1) == record.citizen
      emso = record.EMSO
      emso_factor_map = [7, 6, 5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
      emso_sum = 0
      (0..11).each do |digit|
        emso_sum += emso_digit(emso, digit) * emso_factor_map[digit]
      end
      control_digit = 11 - (emso_sum % 11)
      if emso[12].to_i != control_digit.to_i
        record.errors[:EMSO] << ' je napačen!'
      end

      if ((record.municipality.code.to_i == 0 and record.country_of_birth.code.to_i == 705 ) or (record.municipality.code.to_i != 0 and record.country_of_birth.code.to_i != 705))
        record.errors[:base] << 'Občina in država rojstva se ne ujemata!'
      end

      if ((record.post_of_residence.code.to_i != 0 and record.country_of_residence.code.to_i != 705))
        record.errors[:base] << 'Pošta in država stalnega prebivališča se na ujemata!'
      end
    end

    if record.highschool_certificate == true and record.highschool_finished_date.nil?
      record.errors[:highschool_finished_date] << ' ne sme biti prazno'

    end

  end

  def emso_digit(emso, place)
      return emso.to_s[place].to_i
  end

end




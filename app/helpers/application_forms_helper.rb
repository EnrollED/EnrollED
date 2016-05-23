module ApplicationFormsHelper
  def getDateOfBirthDay
    ary = Array.new
    (1..31).each do |i|
      ary.push([i, i])
    end
    return ary
  end

  def getDateOfBirthMonth
    ary = Array.new
    (1..12).each do |i|
      ary.push([i, i])
    end
    return ary
  end

  def disableNewApplicationFormButton
    if @enrollment.end < Time.now
      'disabled'
    else
      ''
    end
  end
end
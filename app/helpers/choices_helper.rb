module ChoicesHelper
  def getSaveOrNextMessage(choice)
    if choice.to_i == 3
      return t('activerecord.attributes.application.create_prijava')
    else
       return 'Naprej'
    end

  end

end
class HistoryTrigger
  def initialize(trigger)
    @trigger = trigger
  end

  def translate_to_human
    case @trigger.class.to_s
    when 'Device'
      "Le matériel a été enregistré le #{@trigger.created_at.strftime('%b %d, %Y')}"
    when 'DevicesUser'
      "Le matériel a été assigné à #{@trigger.user} le #{@trigger.created_at.strftime('%b %d, %Y')}"
    when 'Update'
      "Mise à jour sur l'état du matériel : #{@trigger.comment}"
    when 'Request'
      "Le #{@trigger.created_at.strftime('%b %d, %Y')} #{@trigger.user} a emprunté le matériel jusqu'à #{@trigger.end_date}"
    end
  end
end
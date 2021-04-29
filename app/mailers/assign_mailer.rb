class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(email, password)
    @email = email
    @password = password
    mail to: @email, subject: I18n.t('views.messages.complete_registration')
  end

  def delegate_mail(team)
    @email = team.owner.email
    @team = team
    mail to: @email, subject: I18n.t('views.messages.assigned_owner')
  end

  def delete_agenda_mail(agenda)
   @emails = agenda.team.members.map{ |u| u.email }
   @agenda = agenda
   mail to: @emails, subject: I18n.t('views.messages.destroyed_agenda')
  end
end

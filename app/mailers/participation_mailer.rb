class ParticipationMailer < ApplicationMailer

    default from: 'pierre.sarazin18@gmail.com'
 
  def participation_email(user, event, participation)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user
    @event = event
    @participation = participation

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Participation prise en compte!') 
  end
end

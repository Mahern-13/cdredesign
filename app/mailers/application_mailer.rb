class ApplicationMailer < ActionMailer::Base
  default from: 'codeplatoon.bravo@gmail.com'
  layout 'mailer'

  def student_email(student)
    @student = student
    mail(to: @student.email, subject: 'Sample Email')
  end

  def volunteer_email(volunteer)
    @volunteer = volunteer
    mail(to: @volunteer.email, subject: 'Sample Email')
  end

  def sponsor_email(sponsor)
    @sponsor = sponsor
    mail(to: @sponsor.contact_email, subject: 'Sample Email')
  end
end

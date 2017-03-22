# Preview all emails at http://localhost:3000/rails/mailers/example_mailer
class ExampleMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    s = Student.create!(email: 'sample@email.com', name: 'random name')
    ExampleMailer.student_email(s)
  end
end
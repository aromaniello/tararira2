class UserMailer < ApplicationMailer
	default from: 'tarariramailer@gmail.com'

	def send_form(user)
		@user = user

		# generate pdf form and attach to e-mail
		rendered_pdf_view = render_to_string(template: "users/registration_form", locals: { user: user })
		attachments["Formulario invertir.la para #{user.full_name}.pdf"] = WickedPdf.new.pdf_from_string(rendered_pdf_view)

		mail(to: @user.email, subject: "Tararira")
	end
end

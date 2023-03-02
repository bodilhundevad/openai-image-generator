class PagesController < ApplicationController
  def home
    @email_response = params[:email]
  end

  def generate_response
    email = "Dear Bodil Hundevad,\n\nThank you for your application. We are excited to have you on board! Please find your offer attached.\n\nBest regards,\nRomana Haspelhuber"
    @email_response = openai_call(email)
    redirect_to action: "home", email: @email_response
  end

  private

  def openai_client
    OpenAI::Client.new
  end

  def openai_call(email)
    client = OpenAI::Client.new
    response = client.completions(parameters: {
      model: "text-davinci-001",
      prompt: openai_email_prompt(email),
      max_tokens:150
    })
    response.dig("choices", 0, "text")
  end

  def openai_email_prompt(email)
    'Email:\n'+
    'Hi Bodil,\n'+
    ' \n'+
    'Thank you for applying at Tractive! Since we’re all about open communication and quick feedback, we thought we’d give you the good news right away - we’d like to proceed further with your application. \n'+
    ' \n'+
    'To do so, we need the following from you:\n'+
    'We would like to ask you to fill in our technology screening in order to give us a better overview of your programming skills. Please be honest with your self-evaluation!\n'+
    ' \n'+
    'Tractive Technology Screening\n'+
    'We work with the following technologies at Tractive. Please take a self-assessment and tell us which year you started to work extensively with them. It’s also totally fine if you don’t have any experience with some, but it’s important for us to get the most accurate evaluation of your skills. \n'+
    '\n'+
    'Thank you for your self-evaluation!\n'+
    'Please send the screening and your answers back to us in a separate document (PDF, Word ...).\n'+
    ' \n'+
    'Just so you know, we do not offer full remote working at Tractive. We believe in the power of doing things all together, in one place. However in addition to our flexible working hours, we also offer a hybrid 2:2 home office model (2 home office days / 2 office days) to ensure that you are spatially independent. Is commuting to Linz/Austria for at least 2 office days a week an option for you?\n'+
    ' \n'+
    'Here is the link to access your application and personal info. You can also get some exclusive insights into the application process at Tractive here.\n'+
    ' \n'+
    'Looking forward to hearing from you soon! Have a great day!\n'+
    ' \n'+
    'Best Regards,\n'+
    'Romana Haspelhuber'+
    'Response:\n'+
    'Dear Romana Haspelhuber,\n'+
    '\n'+
    'Thank you for getting back to me so quickly and for the good news that you would like to proceed further with my application. I am excited about the possible chance to work with Tractive!\n'+
    '\n'+
    'I appreciate your request for me to fill out the technology screening to give a better overview of my programming skills, and have attached my answers in a separate document as requested.\n'+
    '\n'+
    'Regarding the working location, I am happy to confirm that relocating to Linz/Austria is an option for me, therefore commuting should not be a problem. \n'+
    '\n'+
    'Once again, thank you for your time and consideration, and I am looking forward to hearing from you soon.\n'+
    '\n'+
    'Best regards,\n'+
    'Bodil Hundevad'+
    'Email:'+ email + '/n' +
    'Response:'
  end
end

gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact < ActiveRecord::Base
  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text


  def full_name
    "#{first_name} #{last_name}"
  end

  def setup
  @contact = Contact.create(
    first_name: 'Grace',
    last_name:  'Hopper',
    email:      'grace@hopper.com',
    note:       'computer scientist')
end

def test_update
  @contact.update(note: 'wrote the first compiler in 1952')
  assert_equal 'wrote the first compiler in 1952', @contact.note
end

def test_find_by
  assert_equal @contact, Contact.find_by(first_name: 'Grace')
end

end


Contact.auto_upgrade!
#
#
#   # Feel free to add other methods here, if you need them.
#
#   #examples
#   # a = Contact.create("Adam", "Hose", "adam@gmail.com", "Work")
#   # b = Contact.create("Brad", "Jose", "brad@gmail.com", "Running")
#   # c = Contact.create("Crazy", "Lifestyle", "crazy@hotmail.com", "Murderer")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do
  customer_number = Faker::Address.building_number
  name = Faker::Company.name
  email = Faker::Internet.email(name)
  phone = Faker::PhoneNumber.cell_phone
  street = Faker::Address.street_address
  main_first_name = Faker::Name.first_name
  main_last_name = Faker::Name.last_name
  main_contact_phone = Faker::PhoneNumber.cell_phone
  main_contact_email = Faker::Internet.email(main_first_name)

  customer = Customer.new({
    customer_number: customer_number,
    name: name,
    email: email,
    phone: phone,
    street: street,
    city: "Cheyenne",
    state: "WY",
    zip_code: "82009",
    country: "USA",
    main_contact__first_name: main_first_name,
    main_contact__last_name: main_last_name,
    main_contact_phone: main_contact_phone,
    main_contact_email: main_contact_email,
    })
    customer.save!

      5.times do
        name = Faker::Company.name
        email = Faker::Internet.email(name)
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        phone = Faker::PhoneNumber.cell_phone
        street = Faker::Address.street_address
        first_name = Faker::Name.first_name
        last_name = Faker::Name.last_name
        contact_phone = Faker::PhoneNumber.cell_phone
        contact_email = Faker::Internet.email(main_first_name)

        location = Location.new({
          customer_number: customer_number,
          customer_id: customer.id,
          name: name,
          email: email,
          phone: phone,
          street: street,
          city: "Cheyenne",
          state: "WY",
          zip_code: "82009",
          country: "USA",
          contact__first_name: first_name,
          contact__last_name: last_name,
          contact_phone: contact_phone,
          contact_email: contact_email
          })
          location.save!

          10.times do
            machine_number = Faker::Address.building_number
            serial_number = Faker::Number.number(10)
            on_location = Faker::Address.secondary_address


            machine = Machine.new({
              customer_number: customer_number,
              customer_id: customer.id,
              location_id: location.id,
              machine_number: machine_number,
              serial_number: serial_number,
              location_contact_name: first_name,
              location_contact_phone: contact_phone,
              
              on_location: on_location
            })
            machine.save!
          end
      end
end

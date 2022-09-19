# This will delete any existing rows from the Movie and Actor tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting company/depatments/employees/admin/timestamps data..."
Employee.destroy_all
Department.destroy_all
Company.destroy_all
Timestamp.destroy_all
Department_manager.destroy_all
Admin.destroy_all
Timerecord.destroy_all

puts "Creating Company..."
blindinc = Company.create(name: "BlindInc")


puts "Creating departments..."

hospitality = Department.create(name: "Hospitality", company_id:1)
human_resource = Department.create(name: "Human Resource",company_id:1)
support_desk = Department.create(name: "Support desk",company_id:1)
design = Department.create(name: "Design",company_id:1)
technical_support = Department.create(name: "Technical Support",company_id:1)


puts "Creating Employees..."
ebenezar = Employee.create(name: "Ebenezar Bukosia", email: "ebenezar@mail.com", password_hash: "$2a$12$K5pma.I64U2rdcnxNPrr.OccJ8NIJlnpezmq0Fo.eZdhrd4jhnMEG", username:"ebenezar", gender: "male", title:"CEO",usertype: true,department_id: 4, avatar: "https://picsum.photos/315")
elvis =  Employee.create(name: "Elvis Kimani", email: "elvis@mail.com", password_hash: "$2a$12$K5pma.I64U2rdcnxNPrr.OccJ8NIJlnpezmq0Fo.eZdhrd4jhnMEG", username:"elviskim", gender: "male", title:"Injiniaa",usertype: false,department_id: 2,avatar: "https://picsum.photos/316")
daizie = Employee.create(name: "Daicy Chep", email: "daicy@mail.com", password_hash: "$2a$12$K5pma.I64U2rdcnxNPrr.OccJ8NIJlnpezmq0Fo.eZdhrd4jhnMEG", username:"daizie", gender: "female", title:"developer",usertype: false, department_id: 4, avatar: "https://picsum.photos/317")
employee1 = Employee.create(name: "nancy", email: "employee1@gmail.com", password_hash: "$2a$12$K5pma.I64U2rdcnxNPrr.OccJ8NIJlnpezmq0Fo.eZdhrd4jhnMEG", username:"employee2", gender: "female", title:"developer",usertype: false, department_id: 1,avatar: "https://picsum.photos/318")
employee2 = Employee.create(name: "pascal o", email: "employee2@gmail.com", password_hash: "$2a$12$K5pma.I64U2rdcnxNPrr.OccJ8NIJlnpezmq0Fo.eZdhrd4jhnMEG", username:"employee", gender: "male", title:"Human Resource",usertype: false, department_id: 2,avatar: "https://picsum.photos/319")


puts "Creating Admin..."
admin = Admin.create(name: "Admin Admin", email: "admin@admin.com", password_hash: "$2a$12$K5pma.I64U2rdcnxNPrr.OccJ8NIJlnpezmq0Fo.eZdhrd4jhnMEG", username:"admin", gender: "male", title:"Admin",usertype: true, department_id: 1,avatar: "https://picsum.photos/321")


puts "creating department managers..."
hospitality=Department_manager.create(employee_id: 1, department_id: 1)
human_resource=Department_manager.create(employee_id: 2, department_id: 2)
support_desk=Department_manager.create(employee_id: 3, department_id: 3)
design=Department_manager.create(employee_id: 4, department_id: 4)
technical_support=Department_manager.create(employee_id: 5, department_id: 5)

puts 'creating time stamps'

one =Timestamp.create(employee_id: 1, monday: 4, tuesday: 9, wednesday: 11, thursday: 8, friday: 5)
two =Timestamp.create(employee_id: 2, monday: 10, tuesday: 11, wednesday: 7, thursday: 5, friday: 1)
four =Timestamp.create(employee_id: 4, monday: 8, tuesday: 0, wednesday: 7, thursday: 12, friday: 7)
three= Timestamp.create(employee_id: 3, monday: 8, tuesday: 10, wednesday: 12, thursday: 7, friday: 4)
five= Timestamp.create(employee_id: 5, monday: 8, tuesday: 10, wednesday: 12, thursday: 7, friday: 4)


puts 'creating time records'

oner = Timerecord.create(employee_id: 1, monday: 'Mon, 05 Sep 2022 07:08:41 GMT-Mon, 05 Sep 2022 15:28:43 GMT', tuesday: 'Tue, 06 Sep 2022 06:08:41 GMT-Tue, 06 Sep 2022 18:28:43 GMT', wednesday: 'Wed, 07 Sep 2022 07:00:41 GMT-Wed, 07 Sep 2022 16:20:43 GMT', thursday: 'Thr, 08 Sep 2022 08:08:41 GMT-Thr, 08 Sep 2022 17:28:43 GMT', friday: 'Fri, 09 Sep 2022 09:08:41 GMT-Fri, 09 Sep 2022 13:00:00 GMT')
twor = Timerecord.create(employee_id: 2, monday: '', tuesday: '', wednesday: '', thursday: '', friday: '')
fourr = Timerecord.create(employee_id: 3, monday: '', tuesday: '', wednesday: '', thursday: '', friday: '')
threer= Timerecord.create(employee_id: 4, monday: '', tuesday: '', wednesday: '', thursday: 'Thr, 08 Sep 2022 08:08:41 GMT-Thr, 08 Sep 2022 17:28:43 GMT', friday: '')
fiver= Timerecord.create(employee_id: 5, monday: 'Mon, 05 Sep 2022 07:08:41 GMT-Mon, 05 Sep 2022 15:28:43 GMT', tuesday: '', wednesday: '', thursday: '', friday: 'Fri, 09 Sep 2022 09:08:41 GMT-Fri, 09 Sep 2022 13:00:00 GMT')

 puts "Seeding done!"
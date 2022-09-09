class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  @users
  # Add your routes here


  # user login authentification
  post '/login/user' do 
   
    user = Employee.find_by(username: params[:username], password: params[:password]) || Admin.find_by(username: params[:username], password: params[:password])
    if !user.nil?
      user.to_json
    else 
      responce ={
        responce:"user doesnt exist" 
      }.to_json
    end  
  end   



  #create new employee on database
  post '/employees/register' do
  
    existing_user = Employee.find_by(email: params[:email])

    if existing_user.nil? 
      hash = params.reject { |k, v| v.blank? }
      new_employee = Employee.create(hash)
      #create a new timestamb instance for new user
      Timestamp.create(employee_id: new_employee.id,monday: 0,tuesday: 0,wednesday: 0,thursday: 0,friday: 0)
      Timerecord.create(employee_id: new_employee.id, monday: '', tuesday: '', wednesday: '', thursday: '', friday: '')
      return new_employee.to_json
    else
      responce ={
        responce:"Employee alredy exist" 
      }
      return responce.to_json
    end  

    @newemployee.to_json
    #(only: [:name, :usertype])

  end


    #update a user new employee on database
    patch '/employees/update/:id' do
  
      existing_user = Employee.find(params[:id])
      if existing_user.nil?
        responce ={
          responce:"Employee doesn't exist" 
        }
        return responce.responce.to_json 
      else
        hash = params.reject { |k, v| v.blank? }
        existing_user.update(hash)
        existing_user.to_json
      end  
  
    end

  #change user password
  patch '/employee/updatepassword/:email' do
    user = Employee.find_by(params[:email])
    if user.nil?
      responce ={
        responce:"user doesnt exist" 
      }
      responce.to_json
    else 
      user.update(password: params[:password])
     user.to_json
    end  
  
end

  #fetch all employees
  get '/employees/fetch' do
    @users= Employee.all
    @users.to_json
  end

    #fetch all departments
    get '/departments/count' do
      Department.count.to_json
    end

  #delete a user
  delete '/employee/delete/:id' do
    employee = Employee.find(params[:id])
    if !employee.nil? 
      employee.destroy
      return employee.to_json
    else
      responce ={
        responce:"User doesnt exist" 
      }.to_json
    end  
  end


  #fetch employee timestapms
  get '/employee/timestamps/:id' do
    employee = Employee.find(params[:id])
    if !employee.nil? 
    #  timestamp = employee.
      return employee.timestamp.to_json(only: [:monday, :tuesday, :wednesday, :thursday, :friday])
    else
      responce ={
        responce:"User doesnt exist" 
      }.to_json
    end  
  end

  #update employee's timestamps
  put '/employee/timestamps/update/:id' do
    employee = Employee.find(params[:id])
    if !employee.nil? 
        hash = params.reject { |k, v| v.blank? }
        employee.timestamp.update(hash)
      employee.timestamp.to_json
    else
   responce ={
     responce:"User doesnt exist" 
       }.to_json
    end  
  end


  #fetch employee's timerecords
  get '/employee/timerecord/:id' do
    employee = Employee.find(params[:id])
    if !employee.nil? 
    #  timestamp = employee.
      return employee.timerecord.to_json(only: [:monday, :tuesday, :wednesday, :thursday, :friday])
    else
      responce ={
        responce:"User doesnt exist" 
      }.to_json
    end  
  end

  #write and updates employyes records
  put '/employee/timerecord/update/:id' do
    employee = Employee.find(params[:id])
    if !employee.nil? 
        hash = params.reject { |k, v| v.blank? }
        employee.timerecord.update(hash)
      employee.timerecord.to_json
    else
   responce ={
     responce:"User doesnt exist" 
       }.to_json
    end  
  end

  #fetch and computes employees total weeky time
  get '/employee/fetch/totalhours/:id' do
    employee = Employee.find(params[:id]);
    hours = employee.timestamp.monday + employee.timestamp.tuesday + employee.timestamp.wednesday + employee.timestamp.thursday + employee.timestamp.friday
    hours.to_json
  
  end
   
  #computes and fetch employees avarage hourly time
  get '/employee/fetch/avaragetime/:id' do
    employee = Employee.find(params[:id]);
    hours = employee.timestamp.monday + employee.timestamp.tuesday + employee.timestamp.wednesday + employee.timestamp.thursday + employee.timestamp.friday
    (hours/5).to_json
  end

  #fetch and compute employee salaray based on houry rate
  get '/employee/fetch/salary/:id' do
    rate=850
    tax=85
    employee = Employee.find(params[:id]);
    hours = employee.timestamp.monday + employee.timestamp.tuesday + employee.timestamp.wednesday + employee.timestamp.thursday + employee.timestamp.friday
    hours.to_i
    (hours*855).to_json
  
  end
end

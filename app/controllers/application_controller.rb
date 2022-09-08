class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  @user
  # Add your routes here
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

  #change user password
  patch '/employees/updatepassword/:email' do

      existing_user = Employee.find_by(params[:email])
      if !existing_user.nil?
        existinguser.update(password: params[:password])
        return existinguser.to_json
      else 
        responce ={
          responce:"user doesnt exist" 
        }
        return responce.to_json
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




  #fetch all employees
  get '/employees/fetch' do
    Employee.all.to_json
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

  get '/employee/fetch/totalhours/:id' do
    employee = Employee.find(params[:id]);
    hours = employee.timestamp.monday + employee.timestamp.tuesday + employee.timestamp.wednesday + employee.timestamp.thursday + employee.timestamp.friday
    hours.to_json
  
  end
   
  get '/employee/fetch/avaragetime/:id' do
    employee = Employee.find(params[:id]);
    hours = employee.timestamp.monday + employee.timestamp.tuesday + employee.timestamp.wednesday + employee.timestamp.thursday + employee.timestamp.friday
    (hours/5).to_json
  end

  get '/employee/fetch/salary/:id' do
    rate=850
    tax=85
    employee = Employee.find(params[:id]);
    hours = employee.timestamp.monday + employee.timestamp.tuesday + employee.timestamp.wednesday + employee.timestamp.thursday + employee.timestamp.friday
    hours.to_i
    (hours*855).to_json
  
  end




end

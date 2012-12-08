require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'json'

get '/students' do
  db = SQLite3::Database.new('db/students.sqlite')
  columns, *rows = db.execute2('select * from students')
  students = []
  rows.each do |row|
    student = {}
    row.each_with_index do |column_value, index|
      key = columns[index].to_s.to_sym
      student[key] = column_value.to_s
    end
    students << student
  end
  students.to_json
end

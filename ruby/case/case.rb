hello = "hello"
Hello = "Hello"
hellO = "hellO"

puts hello, Hello, hellO

module Hoge
  VAR = "Hoge"
end

module HoGe
  VAR = "HoGe"
end

p Hoge::VAR
p HoGe::VAR

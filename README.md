SET PATH=C:\Users\ealarcop\platform\msys64;C:\Users\ealarcop\platform\rubyinstaller-3.0.6-1-x64\bin;C:\Users\ealarcop\platform\devkit-tdm-32-4.5.2\bin;%PATH%

msys2_shell
	pacman -Syuu
	pacman -S base-devel
	pacman -S mingw-w64-x86_64-toolchain

gem install rails


# rails new image-app --api --minimal --database=postgresql

rails new <webapp>
cd <webapp>


ruby bin\rails server
ruby bin/rails generate controller Articles index --skip-routes
ruby bin/rails generate model Article title:string body:text
ruby bin/rails db:migrate
ruby bin/rails generate controller Api::V1::Posts --api

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



https://guides.rubyonrails.org/active_storage_overview.html
https://medium.com/@ksalguera/react-and-active-storage-in-rails-7-d4425be224d8

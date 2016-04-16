Before Render  
===========================

## Introduction
  Add a hook like before_filter to your controllers that gets executed between
when your action is completed and the template is rendered.  It can really
DRY up loading some data that is used for views (headers / layouts / etc).

  Plugin heavily based on Vladimir Penkin's rails3_before_render which in turn is based on before_filter for Rails 2 by Todd Willey. 

Provided methods:

- before_render
- prepend\_before\_render
- skip\_before\_render
   
## Installation       
  
    gem 'rails4_before_render'
  
  Warning: Rails 4 only. 
 
## Usage
  before_render / prepend\_before\_render / skip\_before\_render works as other filters. Options like :except and :only can be passed to filter.

    class PostsController < ApplicationController
      before_render :ping, :except => [:destroy]
  
      def index; end     
  
      def new; end
    
      def show; end
  
      def destroy; end                                                                          
              
      private
        def ping
          Rails.logger.info "Ping-Pong actions"
        end
    end       
       
  Method ping will be executed after your actions and before template is rendered.

## Author
Copyright (c) 2013 Nilesh Chaudhari, released under the MIT license. Plugin heavily based on Vladimir Penkin's rails3_before_render which in turn is based on before_filter for Rails 2 by Todd Willey. Updated by Todd Knarr to supersede the outdated version on RubyGems and to depend explicitly on Rails 4.x so it won't break with Rails 5, gem renamed to avoid collision with the outdated version.

=begin rdoc
date::2008.12.05
auth:yasui
====グループ
=end
class GroupsController < ApplicationController
# added 2008.06.10 added
  before_filter :login_required
#■index
# GET /groups
# GET /groups.xml
  def index
    @groups = Group.find(:all)
    @rec_count=@groups.size
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

#■show
# GET /groups/1
# GET /groups/1.xml
  def show
    @group = Group.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

#■new
# GET /groups/new
# GET /groups/new.xml
  def new
    @group = Group.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

#■edit
# GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

#■create
# POST /groups
# POST /groups.xml
  def create
    @group = Group.new(params[:group])
    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(@group) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

#■update
# PUT /groups/1
# PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

#■destroy
# DELETE /groups/1
# DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
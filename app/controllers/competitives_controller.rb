class CompetitivesController < ApplicationController
	def codechef
		@codechefuser=params[:user]
		begin
		response=RestClient.get('http://codechef.com/users/'+@codechefuser)
		@data=response.body
		@jsondata=Hash.new
		problemssolved=0
		multiplier=1
		if (@data.include? "Fully Solved (")
			@reponse=@data.index("Fully Solved (")
			if(@data[@reponse+17]>='0' && @data[@reponse+17]<='9')
			 	problemssolved+=(@data[@reponse+17].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+16]>='0' && @data[@reponse+16]<='9')
				problemssolved+=(@data[@reponse+16].to_i)*multiplier
				multiplier*=10
			end

			if(@data[@reponse+15]>='0' && @data[@reponse+15]<='9')
				problemssolved+=(@data[@reponse+15].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+14]>='0' && @data[@reponse+14]<='9')
				problemssolved+=(@data[@reponse+14].to_i)*multiplier
				multiplier*=10
			end

			@jsondata=Hash.new
			@jsondata['handle']=@codechefuser
			@jsondata['problemssolved']=problemssolved
		
		else
			@jsondata=Hash.new
			@jsondata['data']=@data
			@jsondata['error']="Codechef user does not exist"	
		end	
		rescue => e 
			@jsondata=Hash.new
			@jsondata['error'] = 'User does not exist'
        end
	 	render :json=>@jsondata.to_json
	end

	def hackerearth
		@username = params[:user]
		
		begin
		if(params[:user])
			resource = RestClient::Resource.new 'https://www.hackerearth.com/users/pagelets/'+@username+'/coding-data/'
			@data=resource.get
		end
		 @reponse=@data.index("700")
	     problemssolved=0
		 multiplier=1
		 
		if (@data.include? "700")
			if(@data[@reponse+7]>='0' && @data[@reponse+7]<='9')
				problemssolved+=(@data[@reponse+7].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+6]>='0' && @data[@reponse+6]<='9')
				problemssolved+=(@data[@reponse+6].to_i)*multiplier
				multiplier*=10
			end

			if(@data[@reponse+5]>='0' && @data[@reponse+5]<='9')
				problemssolved+=(@data[@reponse+5].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+4]>='0' && @data[@reponse+4]<='9')
				problemssolved+=(@data[@reponse+4].to_i)*multiplier
				multiplier*=10
			end
              
			@jsondata=Hash.new

			@jsondata['handle']=@username
			@jsondata['problemssolved']=problemssolved
			end
		rescue => e 
			@jsondata=Hash.new
			@jsondata['error']="User does not exist"	
		end	

		render :json=>@jsondata.to_json
	end

	def spoj
		@username = params[:user]		
		if(params[:user])
			resource = RestClient::Resource.new 'http://spoj.com/users/'+@username
			@data=resource.get
		end
		
		@reponse=@data.index("<dd>")
		@jsondata=Hash.new
		problemssolved=0
		multiplier=1

		if (@data.include? "<dd>")
			if(@data[@reponse+7]>='0' && @data[@reponse+7]<='9')
				problemssolved+=(@data[@reponse+7].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+6]>='0' && @data[@reponse+6]<='9')
				problemssolved+=(@data[@reponse+6].to_i)*multiplier
				multiplier*=10
			end

			if(@data[@reponse+5]>='0' && @data[@reponse+5]<='9')
				problemssolved+=(@data[@reponse+5].to_i)*multiplier
				multiplier*=10
			end
			
			if(@data[@reponse+4]>='0' && @data[@reponse+4]<='9')
				problemssolved+=(@data[@reponse+4].to_i)*multiplier
				multiplier*=10
			end

			@jsondata=Hash.new
			@jsondata['handle']=@username
			@jsondata['problemssolved']=problemssolved
		else
			@jsondata=Hash.new
			@jsondata['error']="User does not exist"	
		end	
			render :json=>@jsondata.to_json
	end
end

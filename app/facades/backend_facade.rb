class BackendFacade
  def self.user(user_info)
    require "pry"; binding.pry
    id = user_info[:user][google_id]
    response = BackendService.find_by_uid(id)

    #maybe a conditional for errrors? i.e.:
    # if response[:status] == 404 ..........
  end
end

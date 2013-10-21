module MainHelper
    def roles_inaccessible
      @roles_inaccessible = ['Root', 'Admin', 'Client', 'General']
    end

    def types
      @types = ['Root','Admin','Client']
    end

    def general_role_name
      @general_role_name = 'General'
    end

    def general_role_id
      role = ::Role.active.general_role['id'.to_i]
      @general_role_id = role.id
    end
end
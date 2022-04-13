class TeaFacade
  class << self
    def get_all_teas
      service.get_all_teas.map do |tea|
        Tea.new(tea)
      end
    end

    def get_one_tea(name)
      Tea.new(service.get_one_tea(name))
    end

    private

    def service
      TeaService.new
    end
  end
end

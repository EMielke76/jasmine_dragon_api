class TeaFacade
  class << self
    def get_all_teas
      service.get_all_teas.map do |tea|
        Tea.new(tea)
      end
    end

    private

    def service
      TeaService.new
    end
  end
end

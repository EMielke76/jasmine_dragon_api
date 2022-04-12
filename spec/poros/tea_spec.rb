require 'rails_helper'

RSpec.describe Tea do
  let!(:attributes) {
      {
      _id: "5fa3fd48d5ba620017ec1c09",
      name: "green",
      description: "Rich in antioxidants and reduces inflammation.",
      keywords: "aroma, calm, china",
      origin: "China",
      brew_time: 2,
      temperature: 80
      }
    }

  let!(:tea) { Tea.new(attributes) }

  it 'exists' do
    expect(tea).to be_a(Tea)
  end

  it 'has attributes' do
    expect(tea.id).to eq("5fa3fd48d5ba620017ec1c09")
    expect(tea.name).to eq("green")
    expect(tea.description).to eq("Rich in antioxidants and reduces inflammation.")
    expect(tea.keywords).to eq("aroma, calm, china")
    expect(tea.origin).to eq("China")
    expect(tea.brew_time).to eq(2)
    expect(tea.temperature).to eq(80)
  end
end

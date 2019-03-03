# encoding: UTF-8

describe Hangry do
  context "foodandwine.com recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/foodandwine.com.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use the ld+json parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::JsonLDParser)
    end

    its(:author) { should == "Grace Parisi" }
    its(:canonical_url) { should == "https://www.foodandwine.com/recipes/honey-glazed-roasted-root-vegetables" }
    its(:cook_time) { should == nil }
    its(:description) { should == "The secret to this sweet, slightly tangy dish: the touch of sherry vinegar in the glaze.  More Thanksgiving Side Dishes" }
    its(:image_url) { should == "https://cdn-image.foodandwine.com/sites/default/files/styles/4_3_horizontal_-_1200x900/public/200711-xl-honey-glazed-roasted-root-vegetables.jpg?itok=Hlwmi5IG" }
    its(:ingredients) {
      should == [
        "1 1/4 pounds parsnips, peeled and sliced 1/2 inch thick", "1 1/4 pounds carrots, peeled and sliced 1/2 inch thick", "One 1 1/4 pound celery root—peeled, quartered and sliced 1/2 inch thick", "1 1/4 pounds golden beets, peeled and sliced 1/2 inch thick", "1/2 cup extra-virgin olive oil", "1/2 cup honey", "6 thyme sprigs", "Salt and freshly ground pepper", "2 tablespoons sherry vinegar"
      ]
    }
    its(:name) { should == "Honey-Glazed Roasted Root Vegetables" }
    its(:nutrition) do
      should == {
        calories: nil,
        cholesterol: nil,
        fiber: nil,
        protein: nil,
        saturated_fat: nil,
        sodium: nil,
        sugar: nil,
        total_carbohydrates: nil,
        total_fat: nil,
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end

    its(:instructions) {
      should == "Preheat the oven to 425°. In a large bowl, toss the root vegetables with the oil, honey and thyme and season with salt and pepper. Divide between 2 large, sturdy rimmed baking sheets. Cover with foil and roast for 40 minutes, shifting the pans once, until the vegetables are tender. Remove the foil and roast for 10 minutes longer, until glazed. Return them to the bowl and stir in the vinegar then season with salt and pepper. Serve right away."
    }
    its(:prep_time) { should == nil }
    its(:published_date) { should == Date.new(2013, 12, 6) }
    its(:total_time) { should == 90 }
    its(:yield) { should == "Serves : 12" }
  end
end

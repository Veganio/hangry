# encoding: UTF-8

describe Hangry do
  context "allrecipes.com recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/www.allrecipes.com.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use the ld+json parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::JsonLDParser)
    end

    its(:author) { should == 'United Soybean Board' }
    its(:canonical_url) { should == 'https://www.allrecipes.com/recipe/230347/roasted-vegetable-and-couscous-salad/' }
    its(:cook_time) { should == 15 }
    its(:description) { should == "This better-for-you main-dish salad is quick, colorful and full of satisfying texture. To explore a variety of grains, substitute 3 cups cooked regular couscous, brown rice or quinoa." }
    its(:image_url) { should == 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F7799362.jpg' }
    its(:ingredients) {
      should == [
        '3 cups broccoli florets, cut into 1/2-inch pieces',
        '1 red bell pepper, cut into 1-inch squares',
        '1 ½ cups red onion, peeled and cut into 1/4-inch slices',
        '6 tablespoons soybean oil, divided (often labeled "vegetable oil")',
        '½ tablespoon ground black pepper, divided',
        '½ teaspoon salt, divided',
        '1 ½ cups dry giant Israeli couscous',
        '2 tablespoons balsamic vinegar'
      ]
    }
    its(:name) { should == "Roasted Vegetable and Couscous Salad" }
    its(:nutrition) do
      should == {
        calories: "304.6 calories",
        cholesterol: nil,
        fiber: "4.3 g",
        protein: "6.8 g",
        saturated_fat: "2.2 g",
        sodium: "216.7 mg",
        sugar: "4.1 g",
        total_carbohydrates: "38.3 g",
        total_fat: "14.2 g",
        trans_fat: nil,
        unsaturated_fat: nil
      }
    end
    its(:instructions) {
      instructions = <<-EOS
Preheat oven to 425 degrees F.
Toss broccoli, peppers and onions with 2 tablespoons soybean oil and 1/4 teaspoon each salt and pepper. Place on foil-lined baking sheet.
Bake for 15 minutes until vegetables are tender and lightly browned.
Meanwhile, cook couscous according to package directions.
Place cooked couscous and roasted vegetables in large bowl. Pour vinegar and remaining soybean oil over salad and sprinkle with remaining salt and pepper; toss lightly until combined.
You may substitute 3 cups cooked regular couscous, brown rice or quinoa.
      EOS
      should == instructions.strip
    }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == Date.new(2012, 11, 29) }
    its(:total_time) { should == 30 }
    its(:yield) { should == '6 servings' }
  end
end

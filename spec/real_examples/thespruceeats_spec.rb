# encoding: UTF-8

describe Hangry do
  context "thespruce.com recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/www.thespruceeats.com.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use the ld+json parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::JsonLDParser)
    end

    its(:author) { should == "Peggy Trowbridge Filippone" }
    its(:canonical_url) { should == "https://www.thespruceeats.com/white-chocolate-key-lime-muffins-recipe-1808282" }
    its(:cook_time) { should == 25 }
    its(:description) { should == "Use this basic recipe for incredibly moist and delightfully tangy sweet muffins or cake." }
    its(:image_url) { should == "https://www.thespruceeats.com/thmb/XJf779UaP9u_zkNYbTAU1aZkXtw=/1600x900/smart/filters:no_upscale()/blmuff23-56a4957e3df78cf772831d0f.jpg" }
    its(:ingredients) {
      should == [
        "Cupcakes or Cake:",
        "1 3/4 cups all-purpose flour",
        "2 teaspoons baking powder",
        "1/2 teaspoon salt",
        "6 tablespoons butter (softened)",
        "1 cup sugar",
        "2 large eggs (lightly beaten)",
        "1 1/2 teaspoons key lime zest (grated)",
        "1 tablespoon fresh key lime juice",
        "2/3 cup buttermilk",
        "1 cup white chocolate chips",
        "Glaze:",
        "1 cup powdered sugar",
        "1/8 cup fresh key lime juice"
      ]
    }
    its(:name) { should == "White Chocolate Key Lime Muffins or Cake" }
    its(:nutrition) do
      should == {
        calories: "154 kcal",
        cholesterol: "61 mg",
        fiber: "1 g",
        protein: "3 g",
        saturated_fat: "3 g",
        sodium: "162 mg",
        sugar: nil,
        total_carbohydrates: "23 g",
        total_fat: "6 g",
        trans_fat: nil,
        unsaturated_fat: "3 g"
      }
    end

    its(:instructions) {
      should == <<~TEXT.chomp
        For Muffins:
        Gather the ingredients.
        Preheat oven to 350 F/175 C. Line standard-size muffin tin with foil liners.
        Blend the flour, baking powder, and salt together in a small bowl. Set aside.
        In a large mixing bowl, cream butter and sugar together with a mixer, beating until blended.
        Add the eggs, lime zest, and lime juice.
        Into the butter-cream mixture in the large bowl, add 1/3 of the flour mixture, stirring until combined.
        Add one-third of the buttermilk, stirring until combined.
        Continue alternating one-third of each until all is mixed well. Fold in white chocolate chips.
        Fill cupcake liners two-thirds full with batter.
        Bake 18 to 20 minutes (or 12 to 14 minutes for mini-muffins) until wooden pick inserted in the center comes out clean.
        Make the Glaze:
        Whisk powdered sugar and lime juice together until combined and smooth.
        While muffins are still warm, poke holes in the tops of the muffins with a wooden pick.
        Smooth about a teaspoon on top of each warm muffin.
        Cool completely.
        Serve and enjoy!
        For Cake:
        Preheat oven to 350 F/175 C. Prepare a 9 x 13-inch baking pan by lining with foil (non-stick foil recommended).
        Follow the same mixing instructions as above in the muffins.
        Spread batter evenly in pan.
        Bake 35 to 40 minutes or until wooden pick inserted in center comes out clean.
        Let rest in pan about 5 minutes and then poke holes all over the top of the cake with a wooden pick.
        Spread glaze evenly over top of cake and cool completely.
        Cut into pieces to serve and enjoy!.
      TEXT
    }

    its(:prep_time) { should == 10 }
    its(:published_date) { should == Date.new(2008, 3, 10) }
    its(:total_time) { should == 35 }
    its(:yield) { should == '18' }
  end
end

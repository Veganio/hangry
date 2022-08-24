# encoding: utf-8

describe Hangry do
  context "southernliving.com recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/www.southernliving.com.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use the ld+json parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::JsonLDParser)
    end

    its(:author) { should == "Southern Living Editors" }
    its(:canonical_url) { should == 'https://www.southernliving.com/recipes/best-carrot-cake' }
    its(:cook_time) { should == nil }
    its(:description) { should == "We don't say \"best\" carrot cake lightly. We really mean it." }
    its(:image_url) { should == "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F24%2F2018%2F03%2Fbest-carrot-cake-sl_0.jpg" }
    its(:ingredients) {
      should == [
        "2 cups all-purpose flour",
        "2 teaspoons baking soda",
        "1/2 teaspoon salt",
        "2 teaspoons ground cinnamon",
        "3 large eggs",
        "2 cups sugar",
        "3/4 cup vegetable oil",
        "3/4 cup buttermilk",
        "2 teaspoons vanilla extract",
        "2 cups grated carrot",
        "1 (8-ounce) can crushed pineapple, drained",
        "1 (3 1/2-ounce) can flaked coconut",
        "1 cup chopped pecans or walnuts",
        "<a href=\"https://www.southernliving.com/recipes/buttermilk-glaze-2\">Buttermilk Glaze</a>",
        "<a href=\"https://www.southernliving.com/recipes/cream-cheese-frosting-25\">Cream Cheese Frosting</a>"
      ]
    }
    its(:instructions) do
      should == <<~EOS.strip
        Line 3 (9-inch) round cakepans with wax paper; lightly grease and flour wax paper. Set pans aside.
        Stir together first 4 ingredients.
        Beat eggs and next 4 ingredients at medium speed with an electric mixer until smooth. Add flour mixture, beating at low speed until blended. Fold in carrot and next 3 ingredients. Pour batter into prepared cakepans.
        Bake at 350°F for 25 to 30 minutes or until a wooden pick inserted in center comes out clean. Drizzle Buttermilk Glaze evenly over layers; cool in pans on wire racks 15 minutes. Remove from pans, and cool completely on wire racks. Spread Cream Cheese Frosting between layers and on top and sides of cake.
      EOS
    end
    it "should have nil nutrition attributes" do
      subject.nutrition.each do |attribute, value|
        expect(value).to be_nil
      end
    end
    its(:name) { should == "Best Carrot Cake" }
    its(:prep_time) { should == nil }
    its(:published_date) { should == Date.new(2018, 01, 15) }
    its(:total_time) { should == nil }
    its(:yield) { should == "1 (9-inch) cake" }
  end
end

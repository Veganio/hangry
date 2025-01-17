describe Hangry do
  context "epicurious.com recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/www.epicurious.com.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use the ld+json parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::JsonLDParser)
    end

    its(:author) { should == "Janet Taylor McCracken" }
    its(:canonical_url) { should == "https://www.bonappetit.com/recipe/grilled-turkey-burgers-with-cheddar-and-smoky-aioli" }
    its(:cook_time) { should == 0 }
    its(:description) { should == "A simple Moroccan-spiced aioli is mixed in with the ground turkey to keep the burgers moist and give them tons of flavor. Smoked paprika is available in the spice aisle of most supermarkets." }
    its(:prep_time) { should == nil }
    its(:total_time) { should == 0 }
    its(:image_url) { should == "https://assets.epicurious.com/photos/5609a5d96a59cdb91b5ff5c0/2:1/w_2138,h_1069,c_limit/354289_hires.jpg" }
    its(:ingredients) {
      should == [
        '1/2 teaspoon cumin seeds',
        '1/2 teaspoon coriander seeds',
        '1/2 cup mayonnaise',
        '2 tablespoons extra-virgin olive oil plus additional for brushing',
        '2 teaspoons fresh lemon juice',
        '1 1/2 teaspoons smoked paprika',
        '1 garlic clove, pressed',
        '1 pound ground dark-meat turkey',
        '4 1/3 -inch-thick red onion slices',
        '1 large or 2 small red bell peppers, quartered',
        '4 slices white cheddar cheese or Monterey Jack cheese',
        '4 sesame-seed hamburger buns',
        'Arugula',
        'Pickle wedges',
        'Corn chips'
      ]
    }

    its(:instructions) do
      # hmm... preserving newlines for Epicurious instructions gives us some crappy results...
      instructions = <<-eos
Toast cumin seeds and coriander seeds in small skillet over medium-high heat until aromatic and slightly darker in color, shaking skillet often, about 1 1/2 minutes. Cool. Finely grind toasted seeds in spice grinder or in mortar with pestle. Whisk mayonnaise, 2 tablespoons extra-virgin olive oil, fresh lemon juice, smoked paprika, garlic, and ground spices in small bowl. Season aioli to taste with salt and pepper. DO AHEAD: Aioli can be made 1 day ahead. Cover and refrigerate.
Place turkey in medium bowl. Add 2 tablespoons aioli; mix gently. Using damp hands, divide turkey mixture into 4 equal portions, then form each into scant 3/4-inch thick patty, about 3 1/2 inches in diameter. Using thumb, make small indentation in center of each burger. DO AHEAD: Can be made 4 hours ahead. Cover and chill.
Prepare barbecue (medium-high heat). Sprinkle burgers with salt and pepper. Brush onion slices and bell pepper pieces with oil; sprinkle with salt and pepper. Grill onions and bell peppers until soft and charred, about 4 minutes per side.
Grill turkey burgers 5 minutes. Turn over; grill until almost cooked through, about 4 minutes. Top each burger with 1 cheese slice and grill until meat is cooked through and cheese melts, about 1 minute longer. Place 1 turkey burger on each of 4 bun bottoms. Arrange grilled red pepper pieces, then grilled red onion slices over. Top each with dollop of aioli and some arugula. Cover burgers with bun tops and serve with pickle wedges and corn chips.
      eos
      should == instructions.strip
    end

    its(:name) { should == "Grilled Turkey Burgers with Cheddar and Smoky Aioli" }
    its(:published_date) { should == Date.new(2009, 7, 2) }
    its(:yield) { should == "Makes 4" }
  end
end

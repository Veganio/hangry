# encoding: UTF-8

describe Hangry do
  context "tarladalal.com recipe" do
    before(:all) do
      @html = File.read("spec/fixtures/www.tarladalal.com.html")
      @parsed = Hangry.parse(@html)
    end
    subject { @parsed }

    it "should use the schema.org parser" do
      expect(Hangry::ParserSelector.new(@html).parser).to be_an_instance_of(Hangry::SchemaOrgRecipeParser)
    end

    its(:author) { should == "Tarla Dalal" }
    its(:canonical_url) { should == "https://www.tarladalal.com/vegetable-fried-rice--jain--8631r" }
    its(:cook_time) { should == 6 }
    its(:description) { should == "All-time favourite Vegetable Fried Rice in a Jain-friendly version, made without onions, garlic and other no-no ingredients. You will find that this delicacy retains its authentic flavour and texture despite the absence of these ingredients, which you might have thought to be indispensable in the preparation of Vegetable Fried Rice. The use of typically Oriental veggies like cabbage, capsicum and baby corn, along with tongue-tickling sauces, gives this main-course rice dish a fantastic flavour and aroma, which you will thoroughly enjoy. It is also important to stick to the cooking times mentioned in the recipe because if you under-cook the veggies, they will have a raw smell, whereas if you over-cook them, you will miss the crunch that is so typical of Chinese foods." }
    its(:image_url) { should == "https://cdn.tarladalal.com/members/9306/big/big_vegetable_fried_rice_(_jain_)-15840.jpg?size=696X905" }
    its(:ingredients) {
      should == [
        '1/2 cup sliced capsicum (red , yellow and green)',
        '1/2 cup diagonally cut and blanched babycorn',
        '1/4 cup diagonally cut and blanched french beans',
        '1/2 cup shredded cabbage',
        '3 cups cooked long grained rice (basmati)',
        '2 tbsp oil',
        '1 tsp soy sauce',
        '1 tbsp chilli sauce',
        'salt and to taste'
      ]
    }
    its(:name) { should == "Jain vegetable fried rice | jain veg Chinese fried rice | no onion, garlic Jain rice |" }
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
      should == "MethodHeat the oil in a deep non-stick pan, add the capsicum and sauté on a medium flame for 1 minute.Add the babycorn and french beans and sauté on a medium flame for 1 to 2 minutes.Add the cabbage and sauté on a medium flame for 1 minute.Add the soya sauce and chilli sauce and mix well.Add the cooked rice, salt and pepper, mix well and cook on medium flame for 2 minutes, while stirring occasionally.Serve hot.\nlike Jain vegetable fried rice | Jain veg Chinese fried rice | no onion, garlic Jain rice | then see our collection of Jain rice recipes and some recipes we love.\ndry masala chana dal recipe | Jain cucumber chana dal sabzi | chana dal fry | dry chana dal sabji | with 24 amazing images.\nhealthy cabbage paneer paratha recipe |  jain cabbage and paneer paratha |  paneer and cabbage paratha | with amazing 18 images.\nbaked rajma and macaroni with cottage cheese balls recipe | baked macaroni and paneer balls | baked macaroni with cheese | Jain macaroni with paneer balls | with 64 amazing images.\n \nwhat is Jain vegetable fried rice made off? Jain veg Chinese fried rice is made from 1/2 cup sliced capsicum (red ,  yellow and green), 1/2 cup diagonally cut and blanched babycorn, 1/4 cup diagonally cut and blanched french beans, 1/2 cup shredded cabbage, 3 cups cooked long grained rice (basmati), 2 tbsp oil, 1 tsp soy sauce, 1 tbsp chilli sauce and salt. \nTo make perfect steamed basmati rice recipe | basmati rice without pressure cooker | instant basmati rice | basmati rice in stovetop | how to cook basmati rice in 15 minutes, wash long-grained rice thoroughly under running water until you get clear water. The removal of starch from rice helps in getting separate grains after cooking.\nTransfer in a deep bowl and soak in enough water for 30 minutes.\nLearn how to cook basmati rice in detail\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1570706400435-0');\ngoogletag.pubads().refresh([adslot0]);\n});\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot1 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot1\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot1]);\n});\nTo make Jain vegetable fried rice | Jain veg Chinese fried rice | no onion, garlic Jain rice |  heat 2 tbls oil in a deep non-stick pan.\nAdd 1/2 cup sliced capsicum (red ,  yellow and green).\nSauté on a medium flame for 1 minute.\nAdd 1/2 cup diagonally cut and blanched babycorn.\nAdd 1/4 cup diagonally cut and blanched french beans.\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot2 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot2\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot2]);\n});\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot3 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot3\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot3]);\n});\nSauté on a medium flame for 1 to 2 minutes.\nAdd 1/2 cup shredded cabbage.\nSauté on a medium flame for 1 minute.\nAdd 1 tsp soy sauce.\nAdd 1 tbsp chilli sauce.\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot4 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot4\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot4]);\n});\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot5 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot5\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot5]);\n});\nMix well.\nAdd 3 cups cooked long grained rice (basmati.\nAdd salt to taste.\nAdd pepper.\nMix Jain vegetable fried rice | Jain veg Chinese fried rice | no onion, garlic Jain rice |  well.\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot6 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot6\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot6]);\n});\n// Call display() to register the slot as ready\n// and refresh() to fetch an ad.\nvar adslot7 = googletag.defineSlot('/1035919/Rcp_Step_BlockAd', [336, 280], \"adslot7\").setTargeting(\"test\", \"infinitescroll\").addService(googletag.pubads());\ngoogletag.cmd.push(function () {\ngoogletag.display('div-gpt-ad-1548320692495-0');\ngoogletag.pubads().refresh([adslot7]);\n});\nCook on medium flame for 2 minutes, while stirring occasionally.\nServe Jain vegetable fried rice | Jain veg Chinese fried rice | no onion, garlic Jain rice |  hot.\nStir fried rice gently while cooking it as we want the long grained rice (Basmati) not to break into pieces."
    }
    its(:prep_time) { should == 15 }
    its(:published_date) { should == nil }
    its(:total_time) { should == 21 }
    its(:yield) { should == "3" }
  end
end

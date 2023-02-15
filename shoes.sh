#!/bin/bash

# create HTML file
cat > shoes.html << EOF
<!DOCTYPE html>
<html>
<head>
  <title>Shoe Store</title>
</head>
<body>
  <h1>Welcome to our Shoe Store</h1>
EOF

# define shoe data
shoe_data=(
  ["1"]="Nike Air Max 90|Classic sneaker with visible Air cushioning|120|https://example.com/nike_air_max_90.jpg"
  ["2"]="Adidas Ultraboost|Running shoe with responsive cushioning|150|https://example.com/adidas_ultraboost.jpg"
  # add more shoes here...
)

# loop through shoe data and add to HTML
for i in "${!shoe_data[@]}"; do
  shoe_info=(${shoe_data[$i]}|${i})
  shoe_name=$(echo "${shoe_info[0]}" | sed 's/|/ /g')
  shoe_desc=$(echo "${shoe_info[1]}" | sed 's/|/ /g')
  shoe_price=${shoe_info[2]}
  shoe_image=${shoe_info[3]}
  shoe_id=${shoe_info[4]}
  cat >> shoes.html << EOF
  <div>
    <h2>$shoe_name</h2>
    <p>$shoe_desc</p>
    <p>Price: \$$shoe_price</p>
    <img src="$shoe_image" alt="$shoe_name">
    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
      <input type="hidden" name="cmd" value="_s-xclick">
      <input type="hidden" name="hosted_button_id" value="YOUR_PAYPAL_BUTTON_ID_FOR_SHOE_${shoe_id}">
      <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
      <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
    </form>
  </div>
EOF
done

# close HTML file
cat >> shoes.html << EOF
</body>
</html>
EOF

echo "Shoe selling website created at shoes.html"

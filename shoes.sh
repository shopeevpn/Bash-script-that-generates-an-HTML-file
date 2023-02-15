#!/bin/bash

# Define the name of the HTML file
html_file="shoes.html"

# Define an array of shoe data
shoes=(
  ["name"]="Shoe 1"
  ["description"]="A comfortable shoe for everyday wear"
  ["price"]="49.99"
  ["image"]="shoe1.jpg"
  ["name"]="Shoe 2"
  ["description"]="A stylish shoe for special occasions"
  ["price"]="79.99"
  ["image"]="shoe2.jpg"
  # add more shoe data here...
)

# Generate the HTML code for each shoe
shoe_html=""
for ((i=0; i<${#shoes[@]}; i+=4)); do
  shoe_html+="<div class=\"shoe\">\n"
  shoe_html+="  <img src=\"${shoes[$i+3]}\" alt=\"${shoes[$i]}\">\n"
  shoe_html+="  <h2>${shoes[$i]}</h2>\n"
  shoe_html+="  <p>${shoes[$i+1]}</p>\n"
  shoe_html+="  <p>Price: \$${shoes[$i+2]}</p>\n"
  shoe_html+="</div>\n"
done

# Generate the full HTML file
cat > $html_file <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>Shoe Store</title>
  <style>
    .shoe {
      border: 1px solid black;
      padding: 10px;
      margin: 10px;
      display: inline-block;
    }
    img {
      max-width: 100%;
      height: auto;
    }
  </style>
</head>
<body>
  <h1>Welcome to our shoe store!</h1>
  <div id="shoes">
    $shoe_html
  </div>
</body>
</html>
EOF

echo "HTML file generated: $html_file"

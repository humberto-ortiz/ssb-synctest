#!/bin/bash

for i in {1..5000}
do
    sbot publish --type post --text "## Post $i\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla eros lacus, eu tempus metus vulputate vitae. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus ut lobortis tellus. Phasellus placerat aliquam ipsum, eu lacinia leo eleifend nec. Proin placerat id lacus sit amet accumsan. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus non nisi non libero blandit gravida. Maecenas a vestibulum massa. Curabitur rhoncus tortor sagittis tellus consequat finibus. Sed tristique egestas mauris vel vestibulum. Praesent turpis dui, congue maximus diam sit amet, luctus finibus ligula. Pellentesque viverra vestibulum erat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nMaecenas consequat tortor ut mi viverra, id aliquam augue vulputate. Fusce molestie, sem a condimentum elementum, ante nisl varius enim, at venenatis tortor arcu vel mi. Fusce pulvinar orci aliquam."
done

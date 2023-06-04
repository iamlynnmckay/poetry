#!/bin/bash

___main___() {
cat > _pages/index.md << EOF
---
layout: page
title: poetry
permalink: /
---

EOF
    for category in $(ls _pages | grep -v .md); 
    do
        echo "- $category" >> _pages/index.md
        for page in $(find _pages/$category/* -name "*.md");
        do 
            local name="$(echo $page | sed 's/.*\///;s/.md//g')"
            local title="$(echo $name | sed 's/_/ /g')"
            local url="/poetry/$category/$name"
            echo "  - [$title]($url)" >> _pages/index.md
        done
    done
    echo >> _pages/index.md
}

___main___
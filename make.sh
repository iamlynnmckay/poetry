#!/bin/bash

___main___() {
cat > _pages/index.md << EOF
---
layout: page
title: poetry
---

EOF
    for category in $(ls _pages | grep -v .md); 
    do
        echo "- $category" >> _pages/index.md
        for page in $(find _pages/$category/* -name "*.md");
        do 
            local title="$(echo $page | sed 's/.*\///;s/.md//g;s/_/ /g')"
            local url="/poetry/$category/$title"
            echo "  - [$title]($url)" >> _pages/index.md
        done
    done
    echo >> _pages/index.md
}

___main___
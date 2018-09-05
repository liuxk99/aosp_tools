#!/bin/bash
# must run as root(sudo)

idx=$1

update-alternatives --config java <<EOF
$idx
EOF

update-alternatives --config javac <<EOF
$idx
EOF

update-alternatives --config javap <<EOF
$idx
EOF

update-alternatives --config javaws <<EOF
$idx
EOF

update-alternatives --config javadoc <<EOF
$idx
EOF

update-alternatives --config javah <<EOF
$idx
EOF

// ----------------------------------------------------------------------------
// Copyright (c) 2024, Wouter-Michiel A.M. Vierdag. All Rights Reserved.
// Distributed under the (new) BSD License.
// ----------------------------------------------------------------------------
#include "utils.glsl"

// Basic grayscale colormap with under and over colors
vec3 colormap_hilo(float t)
{
    if (t == 0.00000000000000000000000000000000000000) {
        return vec3(0, 0, 1); // Blue for the absolute minimum
    } else if (t == 1.000000000000000000000000000000000000) {
        return vec3(1, 0, 0); // Red for the absolute maximum
    } else {
        return vec3(t, t, t); // Grayscale for the rest
    }
}

// Overloaded function to handle under and over colors
vec3 colormap_hilo(float t, vec3 under, vec3 over)
{
    return colormap_underover(t, colormap_hilo(t), under, over);
}

// Handling under and over colors with vec4 (RGBA) values
vec4 colormap_hilo(float t, vec4 under, vec4 over)
{
    return colormap_underover(t, vec4(colormap_hilo(t), 1.0), under, over);
}
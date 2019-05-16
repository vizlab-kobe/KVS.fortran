#include "CubicImages.hpp"

// constructor
// draw
// cubeMapImage
//ShericalMapImage
extern "C"
{
lib4dsv::CubicImages lib4dsv_CubicImages_new();
void lib4dsv_draw( kvs::osmesa::Screen& screen, const kvs::Vec3 p);
const kvs::ColorImage lib4dsv_CubeMapImage();
const kvs::ColorImage lib4dsv_SphericalMapImage();
}

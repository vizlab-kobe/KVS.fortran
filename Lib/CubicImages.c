#include "CubicImages.h"

extern "C"
{
lib4dsv::CubicImages lib4dsv_CubicImages_new() {
  return lib4dsv::CubicImages();
}
void lib4dsv_draw(lib4dsv::CubicImages *cubicImages, kvs::osmesa::Screen& screen, const kvs::Vec3 p) {
  cubicImages->draw(screen, p);
}
const kvs::ColorImage lib4dsv_CubeMapImage(lib4dsv::CubicImages *cubicImages) {
  return cubicImages->cubeMapImage();
}
const kvs::ColorImage lib4dsv_SphericalMapImage() {
  return cubicImages->sphericalMapImage();
}

}

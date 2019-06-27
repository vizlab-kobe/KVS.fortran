#include "kvs_ArrowGlyph.h"
#include <kvs/Message>


extern "C"
{

kvs::ArrowGlyph* ArrowGlyph_new()
{
//    kvsMessageDebug() << "ArrowGlyph_new is called." << std::endl;
    return new kvs::ArrowGlyph();
}

void ArrowGlyph_delete( kvs::ArrowGlyph* self )
{
//    kvsMessageDebug() << "ArrowGlyph_delete is called." << std::endl;
    if ( self ) delete self;
}

void ArrowGlyph_setType( kvs::ArrowGlyph* self, int type ) {
  self->setType(kvs::ArrowGlyph::ArrowType(type));
}
// GlyphBase
void ArrowGlyph_setSizeMode( kvs::ArrowGlyph* self, const int sizeMode )
{
  self->setSizeMode(kvs::ArrowGlyph::SizeMode(sizeMode));
}

void ArrowGlyph_setDirectionMode( kvs::ArrowGlyph* self, const int directionMode)
{
  self->setDirectionMode(kvs::ArrowGlyph::DirectionMode(directionMode));
}

void ArrowGlyph_setColorMode( kvs::ArrowGlyph* self, const int colorMode )
{
  self->setColorMode(kvs::ArrowGlyph::ColorMode(colorMode));
}

void ArrowGlyph_setOpacityMode( kvs::ArrowGlyph* self, const int opacityMode )
{
  self->setOpacityMode(kvs::ArrowGlyph::OpacityMode(opacityMode));
}

void ArrowGlyph_setCoords( kvs::ArrowGlyph* self, const float* coords, const size_t size )
{
  kvs::ValueArray<kvs::Real32> v(coords, size);
  self->setCoords( v );
}

void ArrowGlyph_setSizes( kvs::ArrowGlyph* self, const float* sizes, const size_t size )
{
  kvs::ValueArray<kvs::Real32> v(sizes, size);
  self->setSizes( v );
}

void ArrowGlyph_setDirections( kvs::ArrowGlyph* self, const float* directions, const size_t size )
{
  kvs::ValueArray<kvs::Real32> v(directions, size);
  self->setDirections( v );
}

void ArrowGlyph_setColors( kvs::ArrowGlyph* self, const uint8_t* colors, const size_t size )
{
  kvs::ValueArray<kvs::UInt8> v(colors, size);
  self->setColors( v );
}

void ArrowGlyph_setOpacities( kvs::ArrowGlyph* self, const uint8_t* opacities, const size_t size )
{
  kvs::ValueArray<kvs::UInt8> v(opacities, size);
  self->setOpacities( v );
}

void ArrowGlyph_setScale( kvs::ArrowGlyph* self, const float scale )
{
  self->setScale(scale);
}

void ArrowGlyph_setTransferFunction( kvs::ArrowGlyph* self, const kvs::TransferFunction* tfunc )
{
  self->setTransferFunction(*tfunc);
}

// RendererBase
void ArrowGlyph_enableShading( kvs::ArrowGlyph* self )
{
  self->enableShading();
}

void ArrowGlyph_disableShading( kvs::ArrowGlyph* self )
{
  self->disableShading();
}

}

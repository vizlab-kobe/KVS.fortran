#include "kvs_ArrowGlyph.h"


extern "C"
{

kvs::ArrowGlyph* ArrowGlyph_new()
{
    return new kvs::ArrowGlyph();
}

void ArrowGlyph_delete( kvs::ArrowGlyph* self )
{
    if ( self ) delete self;
}

void ArrowGlyph_setArrowType( kvs::ArrowGlyph* self, int type )
{
    self->setArrowType( kvs::ArrowGlyph::ArrowType( type ) );
}

void ArrowGlyph_setArrowTypeToLine( kvs::ArrowGlyph* self )
{
    self->setArrowTypeToLine();
}

void ArrowGlyph_setArrowTypeToTube( kvs::ArrowGlyph* self )
{
    self->setArrowTypeToTube();
}

// GlyphBase
void ArrowGlyph_setSizeMode( kvs::ArrowGlyph* self, const int mode )
{
    self->setSizeMode( kvs::ArrowGlyph::SizeMode( mode ) );
}

void ArrowGlyph_setDirectionMode( kvs::ArrowGlyph* self, const int mode )
{
    self->setDirectionMode( kvs::ArrowGlyph::DirectionMode( mode ) );
}

void ArrowGlyph_setColorMode( kvs::ArrowGlyph* self, const int mode )
{
    self->setColorMode( kvs::ArrowGlyph::ColorMode( mode ) );
}

void ArrowGlyph_setOpacityMode( kvs::ArrowGlyph* self, const int mode )
{
    self->setOpacityMode( kvs::ArrowGlyph::OpacityMode( mode ) );
}

void ArrowGlyph_setCoords( kvs::ArrowGlyph* self, const float* coords, const size_t size )
{
    self->setCoords( { coords, size } );
}

void ArrowGlyph_setSizes( kvs::ArrowGlyph* self, const float* sizes, const size_t size )
{
    self->setSizes( { sizes, size } );
}

void ArrowGlyph_setDirections( kvs::ArrowGlyph* self, const float* directions, const size_t size )
{
    self->setDirections( { directions, size } );
}

void ArrowGlyph_setColors( kvs::ArrowGlyph* self, const uint8_t* colors, const size_t size )
{
    self->setColors( { colors, size } );
}

void ArrowGlyph_setOpacities( kvs::ArrowGlyph* self, const uint8_t* opacities, const size_t size )
{
    self->setOpacities( { opacities, size } );
}

void ArrowGlyph_setScale( kvs::ArrowGlyph* self, const float scale )
{
    self->setScale( scale );
}

void ArrowGlyph_setTransferFunction( kvs::ArrowGlyph* self, const kvs::TransferFunction* tfunc )
{
    self->setTransferFunction( *tfunc );
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

} // end of extern "C"

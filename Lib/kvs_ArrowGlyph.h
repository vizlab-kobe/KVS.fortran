#include <kvs/ArrowGlyph>


extern "C"
{

kvs::ArrowGlyph* ArrowGlyph_new();
void ArrowGlyph_delete( kvs::ArrowGlyph* self );
void ArrowGlyph_setArrowType( kvs::ArrowGlyph* self, int type );
void ArrowGlyph_setArrowTypeToLine( kvs::ArrowGlyph* self );
void ArrowGlyph_setArrowTypeToTube( kvs::ArrowGlyph* self );
// GlyphBase
void ArrowGlyph_setSizeMode( kvs::ArrowGlyph* self, const int mode );
void ArrowGlyph_setDirectionMode( kvs::ArrowGlyph* self, const int mode );
void ArrowGlyph_setColorMode( kvs::ArrowGlyph* self, const int mode );
void ArrowGlyph_setOpacityMode( kvs::ArrowGlyph* self, const int mode );
void ArrowGlyph_setCoords( kvs::ArrowGlyph* self, const float* coords, const size_t size );
void ArrowGlyph_setSizes( kvs::ArrowGlyph* self, const float* sizes, const size_t size );
void ArrowGlyph_setDirections( kvs::ArrowGlyph* self, const float* directions, const size_t size );
void ArrowGlyph_setColors( kvs::ArrowGlyph* self, const uint8_t* colors, const size_t size );
void ArrowGlyph_setOpacities( kvs::ArrowGlyph* self, const uint8_t* opacities, const size_t size );
void ArrowGlyph_setScale( kvs::ArrowGlyph* self, const float scale );
void ArrowGlyph_setTransferFunction( kvs::ArrowGlyph* self, const kvs::TransferFunction* tfunc );
// TODO
// get* function
// RendererBase
void ArrowGlyph_enableShading( kvs::ArrowGlyph* self );
void ArrowGlyph_disableShading( kvs::ArrowGlyph* self );

} // end of extern "C"

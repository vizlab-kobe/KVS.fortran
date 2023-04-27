#include <kvs/Bounds>


extern "C"
{

kvs::Bounds* Bounds_new();
void Bounds_delete( kvs::Bounds* self );
void Bounds_setType( kvs::Bounds* self, int type );
void Bounds_setLineWidth( kvs::Bounds* self, float width );
void Bounds_setCornerScale( kvs::Bounds* self, float scale );
void Bounds_setCircleDivision( kvs::Bounds* self, float division );
void Bounds_enableAntiAliasing( kvs::Bounds* self );
void Bounds_disableAntiAliasing( kvs::Bounds* self );
void Bounds_show( kvs::Bounds* self );
void Bounds_hide( kvs::Bounds* self );
// RendererBase
void Bounds_enableShading( kvs::Bounds* self );
void Bounds_disableShading( kvs::Bounds* self );
kvs::LineObject* Bounds_outputLineObject( kvs::Bounds* self, kvs::ObjectBase* object );

} // end of extern "C"

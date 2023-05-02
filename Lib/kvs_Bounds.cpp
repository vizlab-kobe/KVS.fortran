#include <kvs/Bounds>
#include <kvs/Message>


extern "C"
{

kvs::Bounds* Bounds_new()
{
    return new kvs::Bounds();
}

void Bounds_delete( kvs::Bounds* self )
{
    if ( self ) delete self;
}

void Bounds_setType( kvs::Bounds* self, int type )
{
    self->setType( kvs::Bounds::Type( type ) );
}

void Bounds_setLineWidth( kvs::Bounds* self, float width )
{
    self->setLineWidth( width );
}

void Bounds_setCornerScale( kvs::Bounds* self, float scale )
{
    self->setCornerScale( scale );
}

void Bounds_setCircleDivision( kvs::Bounds* self, float division )
{
    self->setCircleDivision( division );
}

void Bounds_enableAntiAliasing( kvs::Bounds* self )
{
    self->enableAntiAliasing();
}

void Bounds_disableAntiAliasing( kvs::Bounds* self )
{
    self->disableAntiAliasing();
}

void Bounds_show( kvs::Bounds* self )
{
    self->show();
}

void Bounds_hide( kvs::Bounds* self )
{
    self->hide();
}

kvs::LineObject* Bounds_outputLineObject( kvs::Bounds* self, kvs::ObjectBase* object )
{
    return self->outputLineObject( object );
}

// RendererBase
void Bounds_enableShading( kvs::Bounds* self )
{
    self->enableShading();
}

void Bounds_disableShading( kvs::Bounds* self )
{
    self->disableShading();
}

} // end of extern "C"

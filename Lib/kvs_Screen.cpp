#include "kvs_Screen.h"
#include <kvs/Application>
#include <kvs/ObjectBase>
#include <kvs/RendererBase>
#include <kvs/ColorImage>
#include <kvs/Message>
#include <kvs/IgnoreUnusedVariable>


extern "C"
{

kvs::Screen* Screen_new( kvs::Application* app )
{
    return new kvs::Screen( app );
}

void Screen_delete( kvs::Screen* self )
{
    if ( self ) delete self;
}

void Screen_registerObject( kvs::Screen* self, kvs::ObjectBase* object, kvs::RendererBase* renderer )
{
    self->registerObject( object, renderer );
}

void Screen_create( kvs::Screen* self )
{
    self->create();
}

void Screen_show( kvs::Screen* self )
{
    self->show();
}

void Screen_hide( kvs::Screen* self )
{
    self->hide();
}

void Screen_draw( kvs::Screen* self )
{
    self->draw();
}

kvs::ColorImage* Screen_capture( kvs::Screen* self )
{
    self->draw();
    auto* image = new kvs::ColorImage();
    image->copy( self->capture() );
    return image;
}

} // end of extern "C"

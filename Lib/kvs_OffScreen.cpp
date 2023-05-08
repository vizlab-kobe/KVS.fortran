#include <kvs/OffScreen>
#include <kvs/ObjectBase>
#include <kvs/RendererBase>
#include <kvs/PointObject>
#include <kvs/LineObject>
#include <kvs/PolygonObject>
#include <kvs/StructuredVolumeObject>
#include <kvs/UnstructuredVolumeObject>
#include <kvs/ImageObject>
#include <kvs/TableObject>
#include <kvs/ColorImage>
#include <kvs/Light>
#include <kvs/Camera>
#include <kvs/Vector3>
#include <kvs/Message>
#include <kvs/IgnoreUnusedVariable>
#include <string>


extern "C"
{

kvs::OffScreen* OffScreen_new()
{
    return new kvs::OffScreen();
}

void OffScreen_delete( kvs::OffScreen* self )
{
    if ( self ) { delete self; }
}

void OffScreen_registerObject(
    kvs::OffScreen* self,
    kvs::ObjectBase* object,
    kvs::RendererBase* renderer )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->registerObject( object, renderer );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( object );
    kvs::IgnoreUnusedVariable( renderer );
#endif
}

void OffScreen_replaceObject(
    kvs::OffScreen* self,
    char* name,
    kvs::ObjectBase* object,
    bool delete_object )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->scene()->replaceObject( std::string( name ), object, delete_object );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( name );
    kvs::IgnoreUnusedVariable( object );
    kvs::IgnoreUnusedVariable( delete_object );
#endif
}

bool OffScreen_hasObject( kvs::OffScreen* self, const char* name )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    return self->scene()->hasObject( std::string( name ) );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( name );
    return false;
#endif
}

void OffScreen_setLightPosition( kvs::OffScreen* self, float x, float y, float z )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->scene()->light()->setPosition( kvs::Vec3( x, y, z ) );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( x );
    kvs::IgnoreUnusedVariable( y );
    kvs::IgnoreUnusedVariable( z );
#endif
}

void OffScreen_setCameraPosition( kvs::OffScreen* self, float x, float y, float z )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->scene()->camera()->setPosition( kvs::Vec3( x, y, z ) );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( x );
    kvs::IgnoreUnusedVariable( y );
    kvs::IgnoreUnusedVariable( z );
#endif
}

void OffScreen_setCameraLookAt( kvs::OffScreen* self, float x, float y, float z )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->scene()->camera()->setLookAt( kvs::Vec3( x, y, z ) );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( x );
    kvs::IgnoreUnusedVariable( y );
    kvs::IgnoreUnusedVariable( z );
#endif
}

void OffScreen_setCameraUpVector( kvs::OffScreen* self, float x, float y, float z )
{
#if defined( KVS_SUPPORT_OSMESA ) || defined( KVS_SUPPORT_EGL )
    self->scene()->camera()->setUpVector( kvs::Vec3( x, y, z ) );
#else
    kvs::IgnoreUnusedVariable( self );
    kvs::IgnoreUnusedVariable( x );
    kvs::IgnoreUnusedVariable( y );
    kvs::IgnoreUnusedVariable( z );
#endif
}

void OffScreen_create( kvs::OffScreen* self )
{
    self->create();
}

void OffScreen_show( kvs::OffScreen* self )
{
    self->show();
}

void OffScreen_hide( kvs::OffScreen* self )
{
    self->hide();
}

void OffScreen_draw( kvs::OffScreen* self )
{
    self->draw();
}

kvs::ColorImage* OffScreen_capture( kvs::OffScreen* self )
{
    self->draw();
    auto* image = new kvs::ColorImage();
    image->copy( self->capture() );
    return image;
}

} // end of extern "C"

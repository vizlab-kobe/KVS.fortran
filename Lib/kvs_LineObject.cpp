#include <kvs/LineObject>


extern "C"
{

kvs::LineObject* LineObject_new()
{
    return new kvs::LineObject();
}

kvs::LineObject* LineObject_copy( kvs::LineObject* other )
{
    auto* line = new kvs::LineObject();
    line->shallowCopy( *other );
    return line;
}

void LineObject_delete( kvs::LineObject* self )
{
    if ( self ) delete self;
}

void LineObject_print( kvs::LineObject* self )
{
    self->print( std::cout );
}

void LineObject_read( kvs::LineObject* self, const char* filename )
{
    self->read( std::string( filename ) );
}

void LineObject_write( kvs::LineObject* self, const char* filename )
{
    const bool ascii = true;
    const bool external = false;
    self->write( std::string( filename ), ascii, external );
}

void LineObject_setSize( kvs::LineObject* self, float size )
{
    self->setSize( size );
}

} // end of extern "C"

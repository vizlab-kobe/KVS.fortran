#include "kvs_Tubeline.h"


extern "C"
{

kvs::Tubeline* Tubeline_new()
{
    return new kvs::Tubeline();
}

kvs::Tubeline* Tubeline_copy( kvs::Tubeline* other )
{
//    kvsMessageDebug() << "Tubeline_copy is called." << std::endl;
    kvs::Tubeline* line = new kvs::Tubeline();
    line->shallowCopy( *other );
    return line;
}

void Tubeline_delete( kvs::Tubeline* self )
{
    if ( self ) delete self;
}

kvs::PolygonObject* Tubeline_exec( kvs::Tubeline* self, kvs::LineObject* line, int ndivs )
{
    self->setNumberOfDivisions(ndivs);
    return self->exec(line);
}

}

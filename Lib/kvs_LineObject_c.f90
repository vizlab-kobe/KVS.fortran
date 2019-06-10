! C interface
interface

   function C_kvs_LineObject_new () result( this )&
        bind( C, name="LineObject_new" )
     import
     type( C_ptr ) :: this
   end function C_kvs_LineObject_new

   function C_kvs_LineObject_copy( other )&
       bind( C, name="LineObject_copy" )
     import
     type( C_ptr ) :: C_kvs_LineObject_copy
     type( C_ptr ), value :: other
   end function C_kvs_LineObject_copy

   subroutine C_kvs_LineObject_delete ( this )&
        bind( C, name="LineObject_delete" )
     import
     type( C_ptr ), value :: this
   end subroutine C_kvs_LineObject_delete

   subroutine C_kvs_LineObject_setSize ( this, line_size )&
        bind( C, name="LineObject_setSize" )
     import
     type( C_ptr ), value :: this
     real( C_float ), value :: line_size
   end subroutine C_kvs_LineObject_setSize


end interface

# To test if a file exists:
# if test -e ~/.foobar
#     echo "File exists"
# end

# To test if a directory exists:

# if test -d ~/.hello
#     echo "Dir exists"
# end

# if test -d /usr/lib/openmpi
#     set -U LD_LIBRARY_PATH /usr/lib/openmpi $LD_LIBRARY_PATH
# end

if test -d "$HOME/opt/darshan/bin"
    set -gx DARSHAN_PREFIX "$HOME/opt/darshan"
    set -gx DARSHAN_ROOT "$HOME/opt/darshan"
    set -gx MPICC_PROFILE "$DARSHAN_ROOT/share/mpi-profile/darshan-cc"
    set -gx MPICXX_PROFILE "$DARSHAN_ROOT/share/mpi-profile/darshan-cxx"
    set -gx MPIFORT_PROFILE "$DARSHAN_ROOT/share/mpi-profile/darshan-f"
    fish_add_path "$HOME/opt/darshan/bin"
end

set -gx RESEARCH_DIR "$HOME/research"
set -gx UCARE_DIR "$RESEARCH_DIR/ucare"
set -gx DIRPAPERS "$UCARE_DIR/papers"
set -gx UCARE_PAPERS_DIR "$UCARE_DIR/papers"
set -gx UCARE_PAPERS_PDF_DIR "$UCARE_DIR/all-pdf-files"
set -gx ALL_PDF_FILES "$UCARE_DIR/all-pdf-files"

# if test -d "$UCARE_PAPERS_DIR/scripts"
#     set -gx PATH "$UCARE_PAPERS_DIR/scripts" $PATH
#     set -gx PATH "$UCARE_PAPERS_DIR/scripts/common" $PATH
# end

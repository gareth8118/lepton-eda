lib_LTLIBRARIES = libleptonrenderer.la

libleptonrenderer_la_SOURCES = \
	edacairo.c \
	edapangorenderer.c \
	edarenderer.c

libleptonrendererincludedir = $(includedir)/libleptonrenderer

libleptonrendererinclude_HEADERS = \
	libleptonrenderer.h \
	edacairo.h \
	edarenderer.h

noinst_HEADERS = \
	edapangorenderer.h

EXTRA_DIST = README ChangeLog

AM_CPPFLAGS = \
	-DLOCALEDIR=\"$(localedir)\" -DG_LOG_DOMAIN=\"libleptonrenderer\" \
	-I$(top_srcdir)/liblepton/include -I$(top_srcdir)
AM_CFLAGS = \
	$(GCC_CFLAGS) $(MINGW_CFLAGS) $(GUILE_CFLAGS) $(GLIB_CFLAGS) \
	$(GDK_CFLAGS) $(CAIRO_CFLAGS) $(PANGO_CFLAGS) $(GDK_PIXBUF_CFLAGS)
AM_LDFLAGS = -version-info $(LIBLEPTONRENDERER_SHLIB_VERSION) \
	$(WINDOWS_LIBTOOL_FLAGS) $(MINGW_LDFLAGS) $(GUILE_LIBS) \
	$(GDK_LIBS) $(GLIB_LIBS) $(CAIRO_LIBS) $(PANGO_LIBS) $(GDK_PIXBUF_LIBS)
LIBTOOL=@LIBTOOL@ --silent

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libleptonrenderer.pc

if HAVE_GIT_REPO
ChangeLog: $(top_builddir)/stamp-git
	( \
	  cd $(srcdir) && \
	  $(GIT) log --pretty=medium $(CHANGELOG_BASE).. -- . || \
	  echo "WARNING: ChangeLog information not available from git" >&2 ; \
	) > $@
endif HAVE_GIT_REPO

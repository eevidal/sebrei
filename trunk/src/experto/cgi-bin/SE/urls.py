from django.conf.urls.defaults import patterns, include, url

#formm SE import views
# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
     url(r'^question$', 'SE.views.question', name='question'),
     url(r'^question2$', 'SE.views.question2', name='question2'),
    # url(r'^SE/', include('SE.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)

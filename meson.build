project ('snake-vala', ['vala', 'c'],
  version: '1.0.0',
  meson_version: '>=0.34'
)

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'vapi')],
                      language: 'vala')

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')
# gee = dependency('gee-0.8')

sdl2_lib = meson.get_compiler('c').find_library('SDL2')
sdl2_vapi = meson.get_compiler('vala').find_library('sdl2', dirs: join_paths(meson.current_source_dir(), 'vapi'))
sdl2_dep = declare_dependency(dependencies: [ sdl2_lib, sdl2_vapi])


# sdl2gfx_lib = meson.get_compiler('c').find_library('SDL2_gfx')
# sdl2gfx_vapi = meson.get_compiler('vala').find_library('sdl2-gfx', dirs: join_paths(meson.current_source_dir(), 'vapi'))
# sdl2gfx_dep = declare_dependency(dependencies: [ sdl2gfx_lib, sdl2gfx_vapi])

sdl2ttf_lib = meson.get_compiler('c').find_library('SDL2_ttf')
sdl2ttf_vapi = meson.get_compiler('vala').find_library('sdl2-ttf', dirs: join_paths(meson.current_source_dir(), 'vapi'))
sdl2ttf_dep = declare_dependency(dependencies: [ sdl2ttf_lib, sdl2ttf_vapi])

sdl2image_lib  = meson.get_compiler('c').find_library('SDL2_image')
sdl2image_vapi = meson.get_compiler('vala').find_library('sdl2-image', dirs: join_paths(meson.current_source_dir(), 'vapi'))
sdl2image_dep  = declare_dependency(dependencies: [sdl2image_lib, sdl2image_vapi])
#
sdl2mixer_lib  = meson.get_compiler('c').find_library('SDL2_mixer')
sdl2mixer_vapi = meson.get_compiler('vala').find_library('sdl2-mixer', dirs: join_paths(meson.current_source_dir(), 'vapi'))
sdl2mixer_dep  = declare_dependency(dependencies: [sdl2mixer_lib, sdl2mixer_vapi])


subdir ('src')

executable('snake-vala',
            sources,
            dependencies : [glib, gobject, sdl2_dep, sdl2ttf_dep, sdl2image_dep, sdl2mixer_dep]
)

# sdl2gfx_dep

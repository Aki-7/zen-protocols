project(
  'zen-protocols', 'c',
  version: '0.1.0',
  license: 'MIT',
  meson_version: '>= 0.58.0',
  default_options:  ['warning_level=3', 'werror=true', 'optimization=2']
)

install_subdir('unstable', install_dir: get_option('datadir') / 'zen-protocols')

pkgconfig_config = configuration_data()
pkgconfig_config.set('prefix', get_option('prefix'))
pkgconfig_config.set('datarootdir', '${prefix}' / get_option('datadir'))
pkgconfig_config.set('package_name', meson.project_name())
pkgconfig_config.set('zen_protocols_version', meson.project_version())

pkgconfig_install_dir = join_paths(get_option('datadir'), 'pkgconfig')

configure_file(
	input: 'zen-protocols.pc.in',
	output: 'zen-protocols.pc',
	configuration: pkgconfig_config,
	install_dir: pkgconfig_install_dir,
)

if get_option('test')
  wayland_scanner_dep = dependency('wayland-scanner')
  scanner = find_program(wayland_scanner_dep.get_variable('wayland_scanner'))
  test(
    'Check xml',
    find_program('test.sh'),
    args :[ 
      meson.project_source_root() / 'unstable' / 'zen-desktop.xml',
    ])
endif

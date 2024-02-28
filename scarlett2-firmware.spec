Name:           scarlett2-firmware
Version:        2128
Release:        1%{?dist}
Summary:        Firmware for Focusrite Scarlett2 devices

License:        Redistributable, no modification permitted
URL:            https://github.com/geoffreybennett/scarlett2-firmware
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  make

%description
Firmware files for the Focusrite Scarlett 2nd, 3rd, 4th Gen, and
Clarett+ audio interfaces.

%prep
%setup -q

%build
# Nothing to build, firmware files are binary

%install
mkdir -p %{buildroot}/usr/lib/firmware/scarlett2
install -pm 644 firmware/*.bin %{buildroot}/usr/lib/firmware/scarlett2/
mkdir -p %{buildroot}/usr/share/licenses/scarlett2-firmware
install -pm 644 LICENSE.Focusrite %{buildroot}/usr/share/licenses/scarlett2-firmware/

%files
/usr/lib/firmware/scarlett2
/usr/share/licenses/scarlett2-firmware

%changelog
* Wed Feb 21 2024 Geoffrey D. Bennett <g@b4.vu> - 2128-1
- Initial RPM release of the Scarlett2 firmware files.

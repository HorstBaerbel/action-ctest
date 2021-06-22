FROM horstbaerbel/ccpp-cmake-build-and-test:1.1

LABEL "com.github.actions.name"="action-ctest"
LABEL "com.github.actions.description"="Run CTest on source directory"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="gray-dark"

LABEL version="1.1.0"
LABEL repository="https://github.com/HorstBaerbel/action-ctest"
LABEL homepage="https://github.com/HorstBaerbel/action-ctest"
LABEL maintainer="Bim Overbohm <bim.overbohm@googlemail.com>"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

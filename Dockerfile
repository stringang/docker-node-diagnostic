FROM ubuntu:18.04

RUN apt-get update && apt-get install -y curl

# https://github.com/nodesource/distributions/blob/master/README.md
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs

# https://github.com/dotnet/diagnostics/blob/main/documentation/lldb/linux-instructions.md#ubuntu-1804
RUN apt-get install -y \
    lldb-3.9 \
    llvm-3.9 \
    python-lldb-3.9

# https://github.com/nodejs/llnode/issues/290#issuecomment-526558706
RUN apt-get install -y \
    make \
    g++ \
    gdb \
    && npm install --unsafe-perm --lldb_exe=`which lldb-3.9` -g llnode
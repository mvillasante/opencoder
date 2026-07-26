FROM debian:bookworm-slim
WORKDIR /workdir
# Instala opencode
RUN apt update && apt upgrade -y
RUN apt install -y lsof curl git
RUN curl -fsSL https://opencode.ai/install | bash
RUN export PATH=$PATH:$HOME/.opencode/bin
# Instala agentes y config personalizada
RUN git clone https://github.com/mvillasante/opencode_agents.git /tmp/oa \
    && mkdir -p /root/.config/opencode \
    && cp -r /tmp/oa/* /root/.config/opencode/ \
    && rm -rf /tmp/oa

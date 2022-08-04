FROM sauerburger/pdflatex:2020plus

# Install requirements in order to make latexindent work
RUN apt update && apt install perl
RUN cpan -i App::cpanminus && \
	cpanm YAML::Tiny && \
	cpanm File::HomeDir && \
	cpanm Unicode::GCString && \
	cpanm Log::Log4perl && \
	cpanm Log::Dispatch::File

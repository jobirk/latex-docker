FROM sauerburger/pdflatex:2020plus

# Install vim
RUN apt update && apt install -y vim

# Install requirements in order to make latexindent work
RUN apt update && apt install -y perl
RUN cpan -i App::cpanminus && \
	cpanm YAML::Tiny && \
	cpanm File::HomeDir && \
	cpanm Unicode::GCString && \
	cpanm Log::Log4perl && \
	cpanm Log::Dispatch::File

# Install pdftk for watermark
RUN apt update && apt install -y pdftk

# Fix permissions of "convert" command
# https://askubuntu.com/questions/1081895/trouble-with-batch-conversion-of-png-to-pdf-using-convert
RUN echo '<policy domain="coder" rights="read|write" pattern="PDF" />' >> /etc/ImageMagick-6/policy.xml

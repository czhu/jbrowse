
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A modern web-based genome browser.',
  'AUTHOR' => 'Robert Buels <rbuels@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'JBrowse',
  'EXE_FILES' => [
    'bin/ucsc-to-json.pl',
    'bin/generate-names.pl',
    'bin/prepare-refseqs.pl',
    'bin/wig-to-json.pl',
    'bin/biodb-to-json.pl',
    'bin/draw-basepair-track.pl',
    'bin/flatfile-to-json.pl',
    'bin/bam-to-json.pl',
  ],
  'LICENSE' => 'perl',
  'NAME' => 'JBrowse',
  'PREREQ_PM' => {
    'Bio::Annotation::SimpleValue' => '0',
    'Bio::DB::Sam' => '0',
    'Bio::FeatureIO' => '0',
    'Bio::OntologyIO' => '0',
    'Bio::Root::Version' => '1.006000',
    'Bio::SeqFeature::Annotated' => '0',
    'Carp' => '0',
    'DBI' => '0',
    'Data::Dumper' => '0',
    'Devel::Size' => '0',
    'Exporter' => '0',
    'Fcntl' => '0',
    'File::Basename' => '0',
    'File::Path' => '0',
    'File::Spec' => '0',
    'File::Spec::Functions' => '0',
    'File::Temp' => '0',
    'FindBin' => '0',
    'GD::Image' => '0',
    'Getopt::Long' => '0',
    'Heap::Simple' => '0',
    'Heap::Simple::XS' => '0',
    'IO::File' => '0',
    'JSON' => '2',
    'List::Util' => '0',
    'POSIX' => '0',
    'PerlIO::gzip' => '0',
    'Pod::Usage' => '0',
    'Scalar::Util' => '0',
    'Storable' => '0',
    'constant' => '0',
    'vars' => '0'
  },
  'VERSION' => '1.22',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);




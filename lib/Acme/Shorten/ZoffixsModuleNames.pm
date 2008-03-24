package Acme::Shorten::ZoffixsModuleNames;

use warnings;
use strict;

our $VERSION = '0.002';

my %Mods = _make_mods();

sub import {
    shift;
    for ( @_ ) {
        if ( exists $Mods{$_} ) {
            eval "use $Mods{$_}";
            die $@ if $@;
            no strict;
            *{$_ . '::'} = *{$Mods{$_} . '::'};
        }
        else {
            die "ZOMFG! IT'S NOT A VALID SHORT NAME! YOU ARE FULL OF FAIL\n";
        }
    }
}

sub _make_mods {
    # this is just a copy/paste from http://search.cpan.org/~zoffix/

    my @mods = qw(
Acme-BabyEater-0.04
CPAN-LinksToDocs-0.001
CPAN-LinksToDocs-No404s-0.003
CPAN-LinksToDocs-No404s-Remember-0.002
Data-CPAN-DSLIP-Explain-0.0
Devel-TakeHashArgs-0.002
LWP-UserAgent-ProxyHopper-0.002 LWP-UserAgent-ProxyHopper-Base-0.001    Net-OBEX-0.004  Net-OBEX-FTP-0.001  Net-OBEX-Packet-Headers-0.002   Net-OBEX-Packet-Request-0.003   Net-OBEX-Response-0.002 POE-Component-Archive-Any-0.001 POE-Component-CPAN-LinksToDocs-No404s-0.001 POE-Component-CPAN-SQLite-Info-0.07 POE-Component-IRC-Plugin-BasePoCoWrap-0.002 POE-Component-IRC-Plugin-BaseWrap-0.001 POE-Component-IRC-Plugin-BrowserSupport-0.002   POE-Component-IRC-Plugin-CPAN-Info-0.03 POE-Component-IRC-Plugin-CPAN-LinksToDocs-0.001 POE-Component-IRC-Plugin-CPAN-LinksToDocs-No404s-0.002  POE-Component-IRC-Plugin-Google-Calculator-0.03 POE-Component-IRC-Plugin-Google-PageRank-0.01   POE-Component-IRC-Plugin-HTML-ElementInfo-0.001 POE-Component-IRC-Plugin-PAUSE-RecentUploads-0.04   POE-Component-IRC-Plugin-Thanks-0.02    POE-Component-IRC-Plugin-Unicode-UCD-0.001  POE-Component-IRC-Plugin-Validator-CSS-0.02 POE-Component-IRC-Plugin-Validator-HTML-0.002   POE-Component-IRC-Plugin-WWW-XKCD-AsText-0.002  POE-Component-IRC-Plugin-YouAreDoingItWrong-0.02    POE-Component-IRC-Plugin-YouTube-MovieFindStore-0.02    POE-Component-WebService-Validator-CSS-W3C-0.02 POE-Component-WebService-Validator-HTML-W3C-0.07    POE-Component-WWW-DoingItWrongCom-RandImage-0.02    POE-Component-WWW-Google-Calculator-0.02    POE-Component-WWW-Google-PageRank-0.03  POE-Component-WWW-PastebinCa-Retrieve-0.003 POE-Component-WWW-PastebinCom-Retrieve-0.002    POE-Component-WWW-PAUSE-RecentUploads-0.06  POE-Component-WWW-PAUSE-RecentUploads-Tail-0.05 POE-Component-WWW-Rafb-Create-0.001 POE-Component-WWW-Search-Mininova-0.04  POE-Component-WWW-WebDevout-BrowserSupportInfo-0.01 POE-Component-WWW-XKCD-AsText-0.001 POE-Component-WWW-YouTube-VideoURI-0.06 Win32-GUITaskAutomate-0.05  WWW-DoingItWrongCom-RandImage-0.01  WWW-FreeProxyListsCom-0.002 WWW-ImagebinCa-Create-0.02  WWW-ImagebinCa-Retrieve-0.01    WWW-OhNoRobotCom-Search-0.001   WWW-Pastebin-Base-Retrieve-0.001    WWW-Pastebin-CSSStandardsOrg-Retrieve-0.001 WWW-Pastebin-PastebinCa-Retrieve-0.001  WWW-PastebinCa-Create-0.001 WWW-PastebinCa-Retrieve-0.002   WWW-PastebinCom-Create-0.001    WWW-PastebinCom-Retrieve-0.002  WWW-PasteCSSStandardsOrg-Create-0.002   WWW-PAUSE-CleanUpHomeDir-0.001  WWW-PAUSE-RecentUploads-0.03    WWW-PhpfiCom-Create-0.001   WWW-PhpfiCom-Retrieve-0.002 WWW-Proxy4FreeCom-0.001 WWW-ProxyChecker-0.002  WWW-Rafb-Create-0.001   WWW-Rafb-Retrieve-0.001 WWW-Search-Mininova-0.05    WWW-WebDevout-BrowserSupportInfo-0.01   WWW-XKCD-AsText-0.001   XML-OBEXFTP-FolderListing-0.002
);

    my %mods;

    for ( @mods ) {
        s/[\d.-]+$//;
        my @name_chars = /[[::upper::]]+/g;
        s/-/::/g;

        my $name = join '', @name_chars;
        while (1) {
            if ( exists $mods{$name} ) {
                $name .= 'Z';
                next;
            }
            $mods{$name} = $_;
            last;
        }
    }

    if ( @mods > keys %mods ) {
        warn "Some module names clashed... oh well it will be FUN!\n";
    }
    return %mods;
}


=head1 NAME

Acme::Shorten::ZoffixsModuleNames - use Zoffix Znet's modules without those uberly long names *har* *har*

=head1 SYNOPSYS

    use strict;
    use warnings;

    # equal to use Acme::BabyEater and use CPAN::LinksToDocs (note the cap letters)
    use Acme::Shorten::ZoffixsModuleNames qw(ABE CPANLTD);

    my $baby = ABE->new;

    $baby->eat(2);

    my $cpan_links_to_docs = CPANLTD->new;

    print "$_\n" for @{ $cpan_links_to_docs->link_for('RE,REF,map') };

=head1 DESCRIPTION

This module allows you to use Zoffix Znet's modules
( L<http://search.cpan.org/~zoffix> ) without those "super long names".

Now finally all those people who keep mocking me everyday can live happily
ever after and I can keep my module names descriptive, search-friendly
and LONG!

Here is the "joke" that triggered creation of this module...
just for historical records :)

    * CPAN2 upload: WWW-Pastebin-NoMorePastingCom-Retrieve-0.001 by ZOFFIX
    <apeiron> WWW::Shorten::ZoffixsModuleNames
    <iank> bahaha

=head1 HOW TO USE

    use Acme::Shorten::ZoffixsModuleNames qw(ABE CPANLTD);

The items to "import" are named in "capitals only" fashion, in other words
if ..*glances and chooses the longest name*..
C<POE::Component::IRC::Plugin::YouTube::MovieFindStore> then you would
use the module as
C<use Acme::Shorten::ZoffixsModuleNames 'POECIRCPYTMFS';>
(example in SYNOPSIS uses L<Acme::BabyEater> and L<CPAN::LinksToDocs>
modules) then the
class methods can be called as C<< $plug = POECIRCPYTMFS->new >> GREAT!!
Now that's so short and super awesome!! ZOMFG! A DREAM COMETH TRUE!

Some module names clash, so if this module detects a clash it will append
a 'Z' (for ZOFFIX! Duh!) at the end of the shortened name...
have fun guessing which one you really want ;)

Your stuff will die if you pass in an incorrect short name.

=head1 AUTHOR

Zoffix Znet, C<< <zoffix at cpan.org> >>
(L<http://zoffix.com>, L<http://haslayout.net>)

=head1 BUGS

Please report any bugs or feature requests to C<bug-acme-shorten-zoffixsmodulenames at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Acme-Shorten-ZoffixsModuleNames>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Acme::Shorten::ZoffixsModuleNames

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Acme-Shorten-ZoffixsModuleNames>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Acme-Shorten-ZoffixsModuleNames>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Acme-Shorten-ZoffixsModuleNames>

=item * Search CPAN

L<http://search.cpan.org/dist/Acme-Shorten-ZoffixsModuleNames>

=back

=head1 COPYRIGHT & LICENSE

Copyright 2008 Zoffix Znet, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

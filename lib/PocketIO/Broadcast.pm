package PocketIO::Broadcast;

use strict;
use warnings;

use base 'PocketIO::Sockets';

sub send {
    my $self = shift;

    $self->{pool}->broadcast(@_);

    return $self;
}

sub emit {
    my $self = shift;
    my $name = shift;

    my $event = $self->_build_event_message($name, @_);

    $self->{pool}->broadcast($self->{conn}, $event);

    return $self;
}

1;
__END__

=head1 NAME

PocketIO::Sockets - Sockets class

=head1 DESCRIPTION

Used to send broadcast messages (to everybody except self).

=head1 METHODS

=head2 C<new>

Create new instance.

=head2 C<send>

Send message.

=head2 C<emit>

Emit event.

=cut
#!/usr/bin/env perl
use v5.20;
use strict;
use warnings;

my @praise = qw(
  健康向上
  乐观开朗
  细心认真
  自治自动
  专心致志
  富有钻研精神
  独立自主
  乐于助人
);

my @used_praise;

sub random_praise {
  my $result;
  do {
    $result = $praise[int(rand($#praise))];
  } while ($result ~~ @used_praise);
  push @used_praise, $result;
  $result;
}

my @critic = qw(
  太过谨慎
  鲁莽
  不够专心
);

sub random_critic {
  $critic[int(rand($#critic))];
}


sub ask {
  my $prompt = $_[0];
  print "$prompt > ";
  chomp(my $resp = <STDIN>);
  $resp;
}


my $name = ask("Name?");
my $id = ask("Student ID?");

my $sex = "男";
if (ask("Sex? (M/F)") eq "F") {
  $sex = "女";
}

my @achieve;
my $achieve;
while (($achieve = ask("Achievement? (Enter to end input)")) ne "") {
  push @achieve, ($achieve);
}

my $result =
   "$name $id 你是一个" . &random_praise . "的${sex}生，" . &random_praise . "的你，在";

foreach my $s (@achieve) { $result .= $s . "，"; }


$result .= "\b\b等方面都颇有成就，你" . &random_praise . "，" . &random_praise .
          "，同学和老师对你都有着颇高的评价，但是，有些时候你仍然有些" . &random_critic .
          "。希望你能再接再厉，在即将到来的新学期取得更大的成就！";

print $result;
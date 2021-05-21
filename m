Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0538BA9D
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 02:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD5A6F58A;
	Fri, 21 May 2021 00:01:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C716F58A
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 00:00:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso6371071wmm.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 May 2021 17:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Kly3oNttfivewYLttBrzCTPt4bF/eD5Okc6uqZP0hCA=;
 b=Pgh8EcRqDmoZAOB5tTomZbPxm2n0TVwewSShxrFqXlqu1pE60mbofY+ItrkVi+q8Ep
 VgRuM8/GiJTidnb3bI2RBmK+irO+5pX3Sg6NyprWyt06/8aAeRMMQgpv3onbrDlSo7+f
 9FyGqLhWi/9AkZv/DI4fwrFJL8UFiPrv71GwZ3opikL9suO+rvxgwbbkDjZnnmErm0rs
 isPe8/N2fqQX3bQcr9Gg74+y15AYvXx5Om15MnvMdMrMiG12fKyF5vdfZKn2AbeEV+Oj
 9i4kRDsS+trOIiifQW3Kq3y6BrjIq3cag7+flzLc28lPHOezTaaomOxB9gq239XFGGfM
 iWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Kly3oNttfivewYLttBrzCTPt4bF/eD5Okc6uqZP0hCA=;
 b=FO9zErgg/7GWHbkt6LDezh37ehIyYVVOhlftUL24oGJP2lUAJP5A1uJsWRtmE0Yjsb
 05sXkQqYTG2GrK7qPAlXUUMr6zrY6kLwEEqT3E+nbUrM6o/ibdxTH3nHyyV8IKVwePRm
 repPkfPxZzrffUGJiSd2iqyphXw/DewM0KIgtpth9e8UGcWpjsVaTczZQtC/hwIE/GzW
 VvenBFhOtCCenFmaJMZ6mc5WhH2lvSy425gQ57kpxfly4owlW/dhD5jYinmeIQJ60GIB
 G0i8uaE623SBeBCq3aO4WYgNXQ8dUKRw3Wh1xoXlsEE4+XuJfjkfIopv3/cT8G63KeKt
 HZ5g==
X-Gm-Message-State: AOAM5321338pRIXiY/RHs3hQ2zvvk+l0M/jAC2PqJvEjUZNG1lvwQQpw
 u2J/oZjQSP0SOcUoQFkRvuc+9Rfaf9opKWekCx193D3e
X-Google-Smtp-Source: ABdhPJzy7C0r/usgguPtP8n3CJzYOKLFWUOuTras/xv0XCNdR0EpVPWU9h8od2G5rP5Mf/PLyt6WbCcr50qq1A7NPw0=
X-Received: by 2002:a1c:1f90:: with SMTP id f138mr6223956wmf.123.1621555249388; 
 Thu, 20 May 2021 17:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <143980f8802d0f7de8b106037acce649e219f575.camel@redhat.com>
In-Reply-To: <143980f8802d0f7de8b106037acce649e219f575.camel@redhat.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 May 2021 17:04:32 -0700
Message-ID: <CAF6AEGsjD72wxcM=G_tLBwdQg-w4-5LHSUe3+nYQYTyjSkkbqw@mail.gmail.com>
To: freedreno <freedreno@lists.freedesktop.org>
Subject: [Freedreno] Fwd: Freenode fallout
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

fyi, looks like we'll be moving to OFTC for IRC

---------- Forwarded message ---------
From: Lyude Paul <lyude@redhat.com>
Date: Thu, May 20, 2021 at 4:49 PM
Subject: Freenode fallout
To: <members@x.org>, board@x.org <board@x.org>,
mesa-dev@lists.freedesktop.org <mesa-dev@lists.freedesktop.org>,
dri-devel <dri-devel@lists.freedesktop.org>, xorg-devel
<xorg-devel@lists.x.org>


Hi everyone! As I'm sure most of you heard by now, Freenode's staff has
had a falling out and it's been recommended by their staff that projects
consider the network a hostile entity. I won't go into the details here,
but those who are interested can read up here:

https://lwn.net/Articles/856543/

At the moment, the vast majority of IRC channels for various Freedesktop
and X.org projects currently reside on Freenode. While the X.org
foundation doesn't have any official policies on IRC hosting, because of
how frequently IRC is used by various projects in our community we on
the board decided to make a non-binding recommendation on an IRC network
we think would be good to move to. We're also looking at ways to provide
some resources to help channels move en masse. We hope this will enable
interested projects to migrate to the same new IRC network in order to
ensure they're all in the same place.

After considering Libera and OFTC as options, the board settled on
recommending OFTC. The primary reason for this is because OFTC is
associated with our parent foundation SPI, and has a long and well known
history of involvement with the open source community. As well, the
board believes OFTC's current Governance model is a lot more clear then
Libera's.

--
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to check
on my status. I don't bite!

_______________________________________________
xorg-devel@lists.x.org: X.Org development
Archives: http://lists.x.org/archives/xorg-devel
Info: https://lists.x.org/mailman/listinfo/xorg-devel
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

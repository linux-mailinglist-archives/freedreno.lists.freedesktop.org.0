Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A1A25C67F
	for <lists+freedreno@lfdr.de>; Thu,  3 Sep 2020 18:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E6A6E1F7;
	Thu,  3 Sep 2020 16:16:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203746E1F2
 for <freedreno@lists.freedesktop.org>; Thu,  3 Sep 2020 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599149782;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=u3UKX1foVctwA0pjlmKCaupVmNxBUnqY8/QtNhjTAM4=;
 b=RLRZtHgOUz+Ut3LpDmvYn/V7Hn6GgeuY8bt5gxWC+C+xkRn9Ag+VQ0YvR3eekdmxJS4Icv
 M3uxFGsjeW4TSmwwgi31YrP6V17aIB696gUyPay8yEYhJTgEjEmxwOoti3jKq0usj3yiY8
 e6tpW7AgKdAaihnEitJvhKwYIjsepr8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-TVv-OkHjPLSFitkmSrMxow-1; Thu, 03 Sep 2020 12:16:15 -0400
X-MC-Unique: TVv-OkHjPLSFitkmSrMxow-1
Received: by mail-qv1-f72.google.com with SMTP id bo17so2126568qvb.2
 for <freedreno@lists.freedesktop.org>; Thu, 03 Sep 2020 09:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:date
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=u3UKX1foVctwA0pjlmKCaupVmNxBUnqY8/QtNhjTAM4=;
 b=Y3GUEtK/Tv0CQFIP/JN2roMLXzgbf+lNXV5tQ6L0EMa8vn4qLpP0OWupJSxMPs7yfV
 ACXHWOnmlzghG6v/MM/1BXgFmHEBqjIwQnBhgnP8ALxz8q9OHwOEdJuXjSz5HKRZTZX9
 LXn8zXct+mx7grXvr6H+vpc/KZJAlhY/lsn5PJpmFiez/6zTQmJPdXsG0+GT0tCg84fr
 2je+LfwJu2eSRcTEVPZlGMf1mZfvSEMN6xXhZhJLhDFHYfloGKLmVnj7o0IdtqCJ6aEm
 L8RTKOSFoK/oZE/n3pBNe/aCVdSJnszUqvWbKQtTZ3k9jMkHDLiz7ksKpUbmBsCeqJwA
 bX9A==
X-Gm-Message-State: AOAM531yTdOtR0PBOdy1Eu/fh4m+IQorUdLDfLrVXPRhlO9GoJtXvxZF
 Ylygfo+4391Uuun2VaEMqwsXRtEmgYfVs8tcZydjmIUWYQFMTM247iqZ2HTYwktnwu5ib85oN62
 rPdMU1itUk5KCvYYXCZvVLD2bTa6Y
X-Received: by 2002:a37:4856:: with SMTP id v83mr3858273qka.213.1599149774538; 
 Thu, 03 Sep 2020 09:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnfAdAK5CNCb5UmSVJq15cU0SizGC7Yx7dV8yC6nzLLK6R0zfayileCjx+GmqCX6TZawwcfg==
X-Received: by 2002:a37:4856:: with SMTP id v83mr3858162qka.213.1599149773275; 
 Thu, 03 Sep 2020 09:16:13 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id v14sm2295211qto.81.2020.09.03.09.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:16:12 -0700 (PDT)
Message-ID: <a171fea35e5dab03873876e221ab15b74ab24d62.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: "events@lists.x.org" <events@lists.x.org>, 
 "xorg-devel@lists.freedesktop.org"
 <xorg-devel@lists.freedesktop.org>, "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "mesa-dev@lists.freedesktop.org"
 <mesa-dev@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "etnaviv@lists.freedesktop.org"
 <etnaviv@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Date: Thu, 03 Sep 2020 12:16:11 -0400
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Subject: [Freedreno] [RESEND] Requests For Proposals for hosting XDC2021 are
 now open
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
Reply-To: lyude@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

(Including a bunch more emails in the To: that got missed the first time)

Hello everyone!

The X.org board is soliciting proposals to host XDC in 2021. Since
XDC2020 is being held virtually this year, we've decided to host in
either North America or Europe. However, the board is open to other
locations, especially if there's an interesting co-location with another
conference.

Of course though, due to the ongoing COVID-19 pandemic it's not yet
clear whether or not it will be possible to host XDC2021 in person.
Because of this, we would like to make it clear that sponsors should
prepare for both the possibility of an in person conference, and the
possibility of a virtual conference. We will work with organizers on
coming up with a deadline for deciding whether or not we'll be going
virtual, likely sometime around July.

If you're considering hosting XDC, we've assembled a wiki page with
what's generally expected and needed:

https://www.x.org/wiki/Events/RFP/

When submitting your proposal, please make sure to include at least the
key information about the potential location in question, possible dates
along with estimated costs. Proposals can be submitted to board at
foundation.x.org until the deadline of November 1st. Additionally, an
quirk early heads-up to the board if you're considering hosting would be
appreciated, in case we need to adjust the schedule a bit. Also, earlier
is better since there generally will be a bit of Q&A with organizers.

And if you just have some questions about what organizing XDC entails,
please feel free to chat with previous organizers, or someone from the
board.
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

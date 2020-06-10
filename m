Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9F1F5B9F
	for <lists+freedreno@lfdr.de>; Wed, 10 Jun 2020 20:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4938889CF1;
	Wed, 10 Jun 2020 18:58:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F0E89CC1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jun 2020 18:58:09 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id l10so1894803vsr.10
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jun 2020 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oAuiLS5G9yRr9AdnpqJ+b7J1vIYfSf3q36M8NOV942c=;
 b=ZoFELyV3tBihmyebsCsoJk3lsYw7dHxokZr208+Oi3cjS0rKE47GyTKi/8fqkKgIhj
 5s0cu1ckOGvd4aV4SjB5D5/nJDeMoIjxvt2U2Ccw/Kfve0CtzajVy/w53lYfU6Xu6k7N
 S8PCnMI8f5/e0ChFtq938rNtp430lbPGfI6Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oAuiLS5G9yRr9AdnpqJ+b7J1vIYfSf3q36M8NOV942c=;
 b=hkXI1pweKoTtSUgiiRaum+gqMiiH15/OJDgB5pbUaRjuhkTe0Myd7BS02SP0Q1mtUF
 2cU1OkXNhewReYELALy4UUjHxTEIM9Bez4nAiBu2lRW5V+sxz/+yuIu7O3jeE6pbJd88
 nf6OkMclAQrCKPFPySmTAuIDy3KD3R6XwXkbmG2K5eiFMXSNOg6oQOdhSflrcHAtXYfA
 uURiHNbzB7ma8KXb8tcd901Tld4Emcvlx+Ati3Lr1Znfq29H6WEpn9+mjpJIYAmCvny2
 E8yLLwK2e0EWjRKcnMsiboq2sbcUF81fSPVaMNuZSJmL94Rlk9nS/wRnJXOcHGyMyAKH
 EHJg==
X-Gm-Message-State: AOAM5320vBrmCf9b3L603JY6vPlWrwYGB6dpcgPYyImMUtvO2UVM5JIR
 gmFUNbTb/aT9FQU/cMmebW6uBbLsloA=
X-Google-Smtp-Source: ABdhPJzsagym7oA0uOjNpOSAuzaUgB/Q0qSCaurG5jftAIy7JF6TfabC0ZIxDTehOMZ0+ruNoP5i6A==
X-Received: by 2002:a67:8cc8:: with SMTP id o191mr3814328vsd.26.1591815488355; 
 Wed, 10 Jun 2020 11:58:08 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46])
 by smtp.gmail.com with ESMTPSA id o10sm103384uae.7.2020.06.10.11.58.07
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 11:58:07 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id c1so1891487vsc.11
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jun 2020 11:58:07 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr3989129vsm.73.1591815486605;
 Wed, 10 Jun 2020 11:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120455.20458-1-harigovi@codeaurora.org>
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Jun 2020 11:57:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMELcq_-aYdQBW3CuJgTqZWYkE8c5AMKT74Z1Z0QHusg@mail.gmail.com>
Message-ID: <CAD=FV=UMELcq_-aYdQBW3CuJgTqZWYkE8c5AMKT74Z1Z0QHusg@mail.gmail.com>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [Freedreno] [v3] drm/bridge: ti-sn65dsi86: ensure bridge
 suspend happens during PM sleep
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 9, 2020 at 5:05 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> ti-sn65dsi86 bridge is enumerated as a runtime device. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend will not be called
> and it kept the bridge regulators and gpios ON which resulted
> in platform not entering into XO shutdown.

The "XO shutdown" concept is a very Qualcomm-specific concept but this
bridge chip could be used on any board.  ...but I think it's fine to
leave it as-is since the meaning is clear enough.


> Add changes to force suspend on the runtime device during pm sleep.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v2:
>         - Include bridge name in the commit message and
>         remove dependent patchwork link from the commit
>         text as bridge is independent of OEM(Stephen Boyd)
>
> Changes in v3:
>         - Updating changelog to explain the need for patch
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

Note that it's generally considered nice to CC folks who commented on
previous versions of the patch since they are folks who are almost
certainly interested in it.  In this case that would be me and Stephen
Boyd.

You could also, in theory, carry Stephen's Reviewed-by patch from v1
since you have fixed the subject as he requested and you have now also
fixed the commit message to have some details.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

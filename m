Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987FF1FFDC6
	for <lists+freedreno@lfdr.de>; Fri, 19 Jun 2020 00:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4908C6E45D;
	Thu, 18 Jun 2020 22:16:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBE96E45D
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jun 2020 22:16:12 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id n6so5845194otl.0
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jun 2020 15:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
 b=lVrFJvl5mDjocLA105kchQDYwRR/Mq9nlcXy/owwADieAZYgAuGsjK3xpftm0NXclu
 BDh1QPoJU1TPpXMWq0DmrgoRSIGzBPlrIy8he0In3LWP8m83XqE+r0HZadf/sXAFVj2e
 IayO8IVxHmcZK2mLywOzCBqLmikiRhPA0Z8ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
 b=fjxGP9Mn0Q4dsXWibmBjVTLAKr4+2YeCINov//0zAEMtyDaDPrrG7ZXlZT2Yrp7ux5
 soKj4lBBYnGsjihvTrBDvcIpiryho6IIr2rN/Jmi8a0M9d2mi4U3I0THk8JET+TJdtT6
 9/ruxoGytjgEAdoutenbcEsUdHe5NiYABPrgHodtHNyPO1HraVKQaAVH/q4AHqlh4WSr
 WuNwInvvLM6jbt2s6beUGaw+Yk7bchaboGQockktxoxj17YRuaqa7VJoJxUmUCqPYIFq
 Q0r8dGm5cv08hyelMvrclKd9Y27tu0UO2PlythSO+FZpk+sXwlrLRl4j8b5XmKE6fO5Y
 QrZw==
X-Gm-Message-State: AOAM530zuP5Z4EmgbW5s93TLQr2SR+yKHBifm9xXfvZpTpCdObR7IZcQ
 LlYLsXvkBhPO72JECQcv6hinfFPe8qw=
X-Google-Smtp-Source: ABdhPJxonO6EdBHARDdJkAvwpGcN2Ffe4kgTZ/KEkQ8sDgm8Fbjo1yDXwMZkz7TY2Nj7ofbpVy/niQ==
X-Received: by 2002:a05:6830:1657:: with SMTP id
 h23mr758541otr.339.1592518571388; 
 Thu, 18 Jun 2020 15:16:11 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id p9sm1001115ota.24.2020.06.18.15.16.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 15:16:11 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id d4so5836050otk.2
 for <freedreno@lists.freedesktop.org>; Thu, 18 Jun 2020 15:16:11 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr501831uah.22.1592518164952;
 Thu, 18 Jun 2020 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120455.20458-1-harigovi@codeaurora.org>
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jun 2020 15:09:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
To: Harigovindan P <harigovi@codeaurora.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Andrzej Hajda <a.hajda@samsung.com>
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
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
>
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

I think this patch is good to go now (has both Stephen's and my
reviews).  I noticed that Neil landed my other patches to this driver
recently (thanks!) and wondered why he didn't land this one.  Then, I
realized that you didn't send it to him or the other bridge
maintainer.  :(  Have you tried running get_maintainer?

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/bridge/ti-sn65dsi86.c
Andrzej Hajda <a.hajda@samsung.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Neil Armstrong <narmstrong@baylibre.com> (maintainer:DRM DRIVERS FOR
BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM
DRIVERS FOR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@siol.net> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)

In any case, unless someone has extra feedback on this patch I think
it's ready to land.

Neil: If you're willing to land this patch too, can you let
Harigovindan know if it needs to be re-sent with you in the "To:" list
or if you can find it on the dri-devel list?

Thanks!

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

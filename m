Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04826526AF5
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 22:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8637310EA90;
	Fri, 13 May 2022 20:07:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0456310EA79
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 20:07:51 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n10so18254729ejk.5
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 13:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VjLYKQz9W+b9Ub9U9HIkTaFYWELaFcx+tDToyM0Q0Is=;
 b=Z8kJgkrl1ICP+BHtwk0Kv0Ik1kTt5soCfHi56pWTcJMzYbpRkqUX6jgW6iVpuM01bP
 dUCoGTDtoou29KeWoXgevvlN94X1JwMBX+3AxqZRfib5zFYYWhL3QUauNdrp4YwUf081
 Ei6HAkxKxBgT9UY+3J7C2pJspiT8AMzk0Axq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjLYKQz9W+b9Ub9U9HIkTaFYWELaFcx+tDToyM0Q0Is=;
 b=4FFCYo3Na9hMPcUWPOW0TXw/EnJr307cWMRPr9Lfzjo2DsFeQ7sAU2PFPxlIXCUUhG
 bZ6TPlY26wUu3ubpAcOp6245sxSSRFeUBPXsHc895GLmOZ4DoNCzz9Jher8Yqjgs5MJI
 M9wHiD9KhH6IAmu5wDChRQDyATyQTkUnjQrOvuryma2RH2LVP2LC7PsPKLcCDAHuwGFs
 PW1xjlw8R+3q817AUKhn6Q9TCXqn5wQpzGJGmpgETJj0tdaYr4C5lvBgmZtKG4rdEddu
 p5G8JUzlv0yMnCzFyhBta9hbn6a+yK7GO1YKEDJC1beVIa/hoPjolZkYLsfzrNxWYG58
 RWfw==
X-Gm-Message-State: AOAM5317zzQ5tpI0BJpDSOIL10y5xz8CM3inOs6KGaQWAHG7JV4K7KCV
 5MPCcVDP8NG7Trm9wx0Unip59ZVmtyAcfO/sAHA=
X-Google-Smtp-Source: ABdhPJwSOnFpcpirca6DtqUCRxGeg3L9vfUYTuYCOJkX+59naPmdxwj4CYvVXtRl1o4CZXkJkXoo6A==
X-Received: by 2002:a17:907:6eac:b0:6f8:61c4:4cb3 with SMTP id
 sh44-20020a1709076eac00b006f861c44cb3mr5535326ejc.597.1652472470120; 
 Fri, 13 May 2022 13:07:50 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 mm10-20020a170906cc4a00b006f3ef214dc4sm1083520ejb.42.2022.05.13.13.07.48
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 13:07:48 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id i5so12720006wrc.13
 for <freedreno@lists.freedesktop.org>; Fri, 13 May 2022 13:07:48 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr5361193wrx.422.1652472467490; Fri, 13
 May 2022 13:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
 <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
In-Reply-To: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 May 2022 13:07:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VbwkK-z8T-98aPSiybd2c94n8p46oBxY_MtPjV608YRQ@mail.gmail.com>
Message-ID: <CAD=FV=VbwkK-z8T-98aPSiybd2c94n8p46oBxY_MtPjV608YRQ@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/probe-helper: Default to 640x480 if
 no EDID
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 2:32 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, May 11, 2022 at 12:14 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Hi
> >
> > Am 10.05.22 um 22:51 schrieb Douglas Anderson:
> > > If we're unable to read the EDID for a display because it's corrupt /
> > > bogus / invalid then we'll add a set of standard modes for the
> > > display. When userspace looks at these modes it doesn't really have a
> > > good concept for which mode to pick and it'll likely pick the highest
> > > resolution one by default. That's probably not ideal because the modes
> > > were purely guesses on the part of the Linux kernel.
> >
> > I'm skeptical. Why does the kernel do a better job than userspace here?
> > Only the graphics driver could possibly make such a decision.
> >
> > Not setting any preferred mode at least gives a clear message to userspace.
>
> OK, that's a fair point. So I tried to find out what our userspace is
> doing. I believe it's:
>
> https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/common/drm_util.cc;l=529
>
> Specifically this bit of code:
>
>   // If we still have no preferred mode, then use the first one since it should
>   // be the best mode.
>   if (!*out_native_mode && !modes.empty())
>     *out_native_mode = modes.front().get();
>
> Do you agree with what our userspace is doing here, or is it wrong?
>
> If our userspace is doing the right thing, then I guess the problem is
> the call to "drm_mode_sort(&connector->modes);" at the end of
> drm_helper_probe_single_connector_modes(). Would you be OK with me
> _not_ sorting the modes in the "bad EDID" case? That also seems to fix
> my problem...

I've implemented the "don't mark preferred, but don't sort" as a v3.
Hopefully it looks good.

https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

-Doug

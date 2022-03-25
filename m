Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994A54E78A6
	for <lists+freedreno@lfdr.de>; Fri, 25 Mar 2022 17:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BA010E710;
	Fri, 25 Mar 2022 16:06:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E01810E99B
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 16:06:16 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id k10so9804896edj.2
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 09:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMwLgpBMsPacoyetf0Jh9z411mlnHCKLxH5G5J9Bol4=;
 b=Y/hl4bV1BEodjTa26V56UFW7xKKqtQqV6DPIWr1GJnYIF/hoTalbgulB3gdkxC3WMu
 XQSVwQKZUG2sZ3ETMy3ROt+OUqrF9D6QN04UTPaN6gbN3wyxUFGruTKWHtEDwcTGXgCT
 NQ7DKJpWM/09QfTXA3AQLleirinBmBKZv4PFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMwLgpBMsPacoyetf0Jh9z411mlnHCKLxH5G5J9Bol4=;
 b=8QbERy48Dgp3PzkASlvEffVgexmNLHMdvWb8JBN0ZTYJLnJP8NA1YX4N2fpoaU++Gh
 KBS+c9Eq8zuDUH64ubCazvF53e98wFDqVzJbvdo2NExRDs+MJwoFokbHXgU3X6lHzwP1
 cholpiGNto0cGUMzsnmN+ioycBEaIaWdeMbbvAyQKTpWX4Gyv35F8OkfkFRiNE7HKi6B
 sqNBE1BaDFj9YW5RgDJ6yfBEQKwmS6qtF0KEHRG/uk+0VsJDK36w7Grx5eZipw8xrW2h
 hB7gm08FywPSUJRznoP9cZFqVzTHf7jqhA+uwEevRP2DpKutYCPzvEryL+IKeC3V2d4y
 MHjQ==
X-Gm-Message-State: AOAM5307qkWy4Ax5Iu+p1Y92GZSeptxyGixgrXouo59ELEdTqufDRbG0
 Eo92NNJEFcLwyxsE4HS3ahhoEdu1sbyeulVV8iw=
X-Google-Smtp-Source: ABdhPJyHbGRErQe8VT8rabI2QZ7Ch8Ze8XP0jlfv6MVHYbDipVwBlcoMdxsvqhOX57NzCbE4+jnoqQ==
X-Received: by 2002:a05:6402:11d0:b0:419:65c5:cde4 with SMTP id
 j16-20020a05640211d000b0041965c5cde4mr14198437edw.73.1648224375250; 
 Fri, 25 Mar 2022 09:06:15 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 cn27-20020a0564020cbb00b00418b0c7fbbfsm3037873edb.32.2022.03.25.09.06.14
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:06:14 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id r7so10387049wrc.0
 for <freedreno@lists.freedesktop.org>; Fri, 25 Mar 2022 09:06:14 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr9797547wrs.301.1648224364037; Fri, 25
 Mar 2022 09:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
 <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
 <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
 <CAE-0n52v2m4U0wK6NYf4KBwXmp+TEVhjnGpW4rQHuZSf7TYfgA@mail.gmail.com>
 <CAD=FV=WFkXdXVdqhBcfa48JKcUcbUe2M0bW6-V8zjP8jgvjvHA@mail.gmail.com>
 <MW4PR02MB7186835E0D762E51EB9F9515E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB7186835E0D762E51EB9F9515E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Mar 2022 09:05:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDXScN6vt9PTe0YnoDGQmY-cja3wVyV9D1zJxyPwCMRQ@mail.gmail.com>
Message-ID: <CAD=FV=UDXScN6vt9PTe0YnoDGQmY-cja3wVyV9D1zJxyPwCMRQ@mail.gmail.com>
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 6/9] drm/msm/dp: wait for hpd high before
 any sink interaction
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_kalyant <quic_kalyant@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 25, 2022 at 8:54 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> > -----Original Message-----
> > From: Doug Anderson <dianders@chromium.org>
> > Sent: Saturday, March 19, 2022 5:26 AM
> > To: Stephen Boyd <swboyd@chromium.org>
> > Cc: Sankeerth Billakanti (QUIC) <quic_sbillaka@quicinc.com>; open list:OPEN
> > FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > <devicetree@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org>;
> > freedreno <freedreno@lists.freedesktop.org>; linux-arm-msm <linux-arm-
> > msm@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>; Rob Clark
> > <robdclark@gmail.com>; Sean Paul <seanpaul@chromium.org>;
> > quic_kalyant <quic_kalyant@quicinc.com>; Abhinav Kumar (QUIC)
> > <quic_abhinavk@quicinc.com>; Kuogee Hsieh (QUIC)
> > <quic_khsieh@quicinc.com>; Andy Gross <agross@kernel.org>;
> > bjorn.andersson@linaro.org; Rob Herring <robh+dt@kernel.org>;
> > krzk+dt@kernel.org; Sean Paul <sean@poorly.run>; David Airlie
> > <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Thierry Reding
> > <thierry.reding@gmail.com>; Sam Ravnborg <sam@ravnborg.org>;
> > dmitry.baryshkov@linaro.org; quic_vproddut <quic_vproddut@quicinc.com>
> > Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
> > interaction
> >
> > Hi,
> >
> > On Fri, Mar 18, 2022 at 4:27 PM Stephen Boyd <swboyd@chromium.org>
> > wrote:
> > >
> > > > > Pushing hpd state checking into aux transactions looks like the
> > > > > wrong direction. Also, as I said up above I am concerned that even
> > > > > checking the GPIO won't work and we need some way to ask the
> > > > > bridge if HPD is asserted or not and then fallback to the GPIO
> > > > > method if the display phy/controller doesn't have support to check
> > > > > HPD internally. Something on top of DRM_BRIDGE_OP_HPD?
> > > >
> > > > If we could somehow get the HPD status from the bridge in the panel
> > > > driver it definitely would be convenient. It does feel like that's
> > > > an improvement that could be done later, though. We've already
> > > > landed a few instances of doing what's done here, like for
> > > > parade-ps8640 and analogix_dp. I suspect designing a new mechanism
> > > > might not be the most trivial.
> > >
> > > What is done in the bridge drivers is to wait for a fixed timeout and
> > > assume aux is ready? Or is it something else? If there's just a fixed
> > > timeout for the eDP case it sounds OK to do that for now and we can
> > > fine tune it later to actually check HPD status register before the
> > > panel tries to read EDID.
> >
> > Right. For the parade chip (which is only used for eDP as far as I know--never
> > DP) waits for up to 200 ms. See ps8640_ensure_hpd().
> >
> > So I guess tl;dr to Sankeerth that it's OK for his patch to have the wait in the
> > aux transfer function, but only for eDP. Other discussions here are about
> > how we could make it better in future patches.
> >
> >
>
> The aux transactions for external DP are initiated by the dp_display driver only after the
> display is hot plugged to the connector. The phy_init is necessary for the aux transactions
> to take place. So, for the DP case, like Doug mentioned below, this patch is introducing
> an overhead of three register reads to detect hpd_high before performing aux transactions.
> So, we felt this was okay to do for DP.

Personally I'm not that upset about the 3 register reads. The problem
Stephen pointed out is bigger. It's possible that a DP cable is
unplugged _just_ as we started an AUX transaction. In that case we'll
have a big delay here when we don't actually need one.


> On the other hand, for eDP, it is necessary to wait for panel ready through this hpd connect status.
> Currently there is no way to know which type of connector it is in the dp_aux sub-module.
>
> However, as the discussion suggested, to have the wait only for eDP, I am thinking to pass the
> connector_type information to aux sub-module and register different aux_transfer functions
> for eDP and DP. The eDP transfer function will wait for hpd_high and the DP transfer function
> will be same as the one before this patch.

Personally I wouldn't register two separate functions. You could just
store a boolean in your structure and only wait for HPD if this is
eDP. One extra "if" test doesn't seem like it justifies splitting off
into two functions...

-Doug

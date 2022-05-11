Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C3523F77
	for <lists+freedreno@lfdr.de>; Wed, 11 May 2022 23:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D58B10E423;
	Wed, 11 May 2022 21:32:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2110E423
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 21:32:42 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id s23so3407123iog.13
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 14:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E6pxwbhOL58efAEpspYDSg6HtmNXrpN7C08+cjeITwQ=;
 b=Bun6KWZaMx96+9+uXGZgUChN1x9/Aj4KQGLniflfQhrzj3QoS7dDf8YRxNsH4jJGam
 gBzzT9mfcPztSxGb2V3qWAN2pD0bT2izPpALbOjJUsUrp55Yx+pIEMIbQxVHohM5Nqqv
 UDD4ougcotvewCQD2tIHFSU/bC9430Tj7rFPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E6pxwbhOL58efAEpspYDSg6HtmNXrpN7C08+cjeITwQ=;
 b=j1sOgtE+2D79RTE0UCHMqhb9xF+LIbwEbfwsL4xcNLmeeIykXu+D3qyw1H3X7XdH1F
 zS+esBJcAA/jce74DLAEuuQX0GAqui8b9qHoyCW/DqyqfghBQCCWfn4ksXUhX2NCtjiH
 6XAeWwZP59b7CiWPgoTuLmnZXDifmm8ggFUT79nQ5jxRJO80of80Fm88RUgupA1G2IYF
 u2Jo6kP3Ys8wDNnxYrSYixGC54iqjAwYMrs06hv9okQVK/mJDDcFXwn3Ay8gVWjPP1f3
 x4k5zfvM7/fXu+aNPu5irRqcqUk8mN6G3PalX2CW9b6Z8rt8Km/N1gca2B5e76s1Q5KF
 861g==
X-Gm-Message-State: AOAM530nQtzXKn8l9X4y8fNKomK69IMQFk+4L5ms3KyXh/OG9/ytnP56
 +PfeQzfC7lNARXfEq3lV8II8r19VJGjaX26A
X-Google-Smtp-Source: ABdhPJw26MF2QjW9Zgu7iZF/uHTKgd5xYPshIBVZPOy1QHtyD/gTZn10WR/rwJgIgHrI9ESfPKZ5+w==
X-Received: by 2002:a05:6638:190a:b0:32b:95b7:4e64 with SMTP id
 p10-20020a056638190a00b0032b95b74e64mr13084856jal.212.1652304761712; 
 Wed, 11 May 2022 14:32:41 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05663801a500b0032b3a7817acsm870520jaq.112.2022.05.11.14.32.40
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 14:32:40 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id e3so3431549ios.6
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 14:32:40 -0700 (PDT)
X-Received: by 2002:a05:6638:3589:b0:32b:858c:6cc3 with SMTP id
 v9-20020a056638358900b0032b858c6cc3mr13931855jal.229.1652304760140; Wed, 11
 May 2022 14:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
In-Reply-To: <db7a2b7f-3c94-d45d-98fd-7fd0b181e6aa@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 May 2022 14:32:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
Message-ID: <CAD=FV=WoSTcSOB_reDbayNb=q7w00rd7p-zHUDt+evTkSjQ=2g@mail.gmail.com>
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

On Wed, May 11, 2022 at 12:14 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 10.05.22 um 22:51 schrieb Douglas Anderson:
> > If we're unable to read the EDID for a display because it's corrupt /
> > bogus / invalid then we'll add a set of standard modes for the
> > display. When userspace looks at these modes it doesn't really have a
> > good concept for which mode to pick and it'll likely pick the highest
> > resolution one by default. That's probably not ideal because the modes
> > were purely guesses on the part of the Linux kernel.
>
> I'm skeptical. Why does the kernel do a better job than userspace here?
> Only the graphics driver could possibly make such a decision.
>
> Not setting any preferred mode at least gives a clear message to userspace.

OK, that's a fair point. So I tried to find out what our userspace is
doing. I believe it's:

https://source.chromium.org/chromium/chromium/src/+/main:ui/ozone/platform/drm/common/drm_util.cc;l=529

Specifically this bit of code:

  // If we still have no preferred mode, then use the first one since it should
  // be the best mode.
  if (!*out_native_mode && !modes.empty())
    *out_native_mode = modes.front().get();

Do you agree with what our userspace is doing here, or is it wrong?

If our userspace is doing the right thing, then I guess the problem is
the call to "drm_mode_sort(&connector->modes);" at the end of
drm_helper_probe_single_connector_modes(). Would you be OK with me
_not_ sorting the modes in the "bad EDID" case? That also seems to fix
my problem...

-Doug

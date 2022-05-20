Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AFB52E11E
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 02:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CFE10E3D0;
	Fri, 20 May 2022 00:21:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8F210E3D0
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 00:21:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id m20so12755763ejj.10
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+wYJNaePiHcWNH/q3h1ZhNLEV4dJ71MIiiBiHgAmbYA=;
 b=NVM/bktb8CtRk0VgJ75AEtD+l1Etp4dc82+iRcIAsF62UYPJmJUe2sENhNxQGCGQpE
 vCsHBMNUy7vONzvYsBEHm8ej3XihpZ8QIBEoXSsqArdCBjVJF4IByYjx2R35+TnR4FqV
 VDBFu5MpvMXsafQZ0SE+nZWoCjniwY9mA1MNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+wYJNaePiHcWNH/q3h1ZhNLEV4dJ71MIiiBiHgAmbYA=;
 b=e2gCSURieVZdi8+w5x5GqH+JCdDyR7DylqneadDGiLoJWnOjSSaFZ0xmrvRjY/r7XX
 UtBuX08SYeDjoinEeBmqv7AtJCMKEl9mhfxecYIRRaYbRuvJs8TR3fDVM9fnnSCS+7+P
 TX6lP/WsV1fbBvd3LfNkD5kCU3sKEdSM6v4TJbyBcpcNjnkGyQtLohtdmGbpSdHrBNqy
 Pvpr5msOZ1Wvb+0ttf1baulalxqG+K5f/BVg6+0BYadqKjaI6CfbcqeAO6qmx02dcy7o
 W/VOS4FpcyfrcaEngLertVMH/HvNIQEPjyZqJ8WS6rQLj6bYT+aBLULJ1ujPr/3Z9gMk
 ic7g==
X-Gm-Message-State: AOAM531AnJilLivExLRdEJINPCGcyhdYxngNYTUvc3zYdE3D5pfxG2ez
 YwtKPUqTtIXxXSNOxPM00S/EPKdp6hIs2b5gXN4=
X-Google-Smtp-Source: ABdhPJyqum5JYZ+hBUKARdJpPua6iEwD1wEQAEfao1k3HmCCjGT1iqizUEOJ8Dtv1NgHSj3MkEhCqg==
X-Received: by 2002:a17:907:7f1f:b0:6fa:2704:c601 with SMTP id
 qf31-20020a1709077f1f00b006fa2704c601mr6600745ejc.496.1653006094696; 
 Thu, 19 May 2022 17:21:34 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 j4-20020a170906104400b006f52dbc192bsm2659259ejj.37.2022.05.19.17.21.33
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 17:21:33 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id f2so9427402wrc.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:21:33 -0700 (PDT)
X-Received: by 2002:a5d:5085:0:b0:20d:5f6:63fa with SMTP id
 a5-20020a5d5085000000b0020d05f663famr5861629wrt.679.1653006092752; Thu, 19
 May 2022 17:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220511155749.v3.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220511155749.v3.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
In-Reply-To: <20220511155749.v3.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 May 2022 17:21:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X7cr-=UwV_XbAYovTqeUYXO3LVLTU2bLiwf8wU2kGsLA@mail.gmail.com>
Message-ID: <CAD=FV=X7cr-=UwV_XbAYovTqeUYXO3LVLTU2bLiwf8wU2kGsLA@mail.gmail.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/2] drm/probe-helper: For DP,
 add 640x480 if all other modes are bad
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
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 11, 2022 at 3:58 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
> that all detachable sinks shall support 640x480 @60Hz as a fail safe
> mode.
>
> A DP compliance test expected us to utilize the above fact when all
> modes it presented to the DP source were not achievable. It presented
> only modes that would be achievable with more lanes and/or higher
> speeds than we had available and expected that when we couldn't do
> that then we'd fall back to 640x480 even though it didn't advertise
> this size.
>
> In order to pass the compliance test (and also support any users who
> might fall into a similar situation with their display), we need to
> add 640x480 into the list of modes. However, we don't want to add
> 640x480 all the time. Despite the fact that the DP spec says all sinks
> _shall support_ 640x480, they're not guaranteed to support it
> _well_. Continuing to read the spec you can see that the display is
> not required to really treat 640x480 equal to all the other modes. It
> doesn't need to scale or anything--just display the pixels somehow for
> failsafe purposes. It should also be noted that it's not hard to find
> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
> all. The HP ZR30w screen I'm sitting in front of has a native DP port
> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
> display via a DP to HDMI adapter and that screen definitely doesn't
> support 640x480.
>
> As a compromise solution, let's only add the 640x480 mode if:
> * We're on DP.
> * All other modes have been pruned.
>
> This acknowledges that 640x480 might not be the best mode to use but,
> since sinks are _supposed_ to support it, we will at least fall back
> to it if there's nothing else.
>
> Note that we _don't_ add higher resolution modes like 1024x768 in this
> case. We only add those modes for a failed EDID read where we have no
> idea what's going on. In the case where we've pruned all modes then
> instead we only want 640x480 which is the only defined "Fail Safe"
> resolution.
>
> This patch originated in response to Kuogee Hsieh's patch [1].
>
> [1] https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Changes in v3:
> - Removed WARN_ON
>
> Changes in v2:
> - Two underscores for __drm_helper_update_and_validate().
> - Return err and use WARN_ON instead of returning a bool.
>
>  drivers/gpu/drm/drm_probe_helper.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)

Pushed to drm-misc-next:

e7c254d75d16 drm/probe-helper: For DP, add 640x480 if all other modes are bad

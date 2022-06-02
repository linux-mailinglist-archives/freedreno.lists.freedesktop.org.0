Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5553C0AF
	for <lists+freedreno@lfdr.de>; Fri,  3 Jun 2022 00:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8927C894DD;
	Thu,  2 Jun 2022 22:18:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B855113948
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 22:18:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h19so8027396edj.0
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 15:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XcPEK0q3mt1ouHTWeNMQyYJ2QS2WLPCsci1x61vNTCo=;
 b=WrJVHTcfJLoL6zkwaUyGcH/jZkhVT5MYScztQxaxeuqyAXvuQ1DqBnZJlHxOSQwPiE
 C9w6a7IuWkfQ8VQm04IOYyfBadLWtG1DrSjYfzagsmIPc/pUTODWRQvJXcuEwtVg/6/P
 k3tfDSbYDhw0Sv1e+nUPKxMFJoo5OxybVavpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XcPEK0q3mt1ouHTWeNMQyYJ2QS2WLPCsci1x61vNTCo=;
 b=vKkSOUFKrR2+2I8JUYSJSMmWBXkftu1ryYTtFgfQbw9Y7ZYw8k8ZQ8igp2ZqJZoZnG
 Ql2N9nvMgQ0ClyjH/xjyO/tpd/7Vsp13OEg+D0LFmEOaWYPHQUrPhS47+RV6j9oIQ97T
 p4dOL5bj/8L+4xzXOHFT5pK4VKspyLPETvuBscm8txLc8wC3fK1ry8Hq3dIXdgTvKkR6
 7lwlDAoTFB10zYTDFb9PLBJQoRR0/obiuxeilPNc3lh6qh35BDwdNviAPuvoQSI3hYK3
 1rxqYLW2qH2V7ygl4TXh/ZRkTJzh9J1hQI4lkZ17VQAa6Mhrphi7PSlKwrc9L/+UyV9E
 lOig==
X-Gm-Message-State: AOAM533S9dIXXkh0ZxhYCD0HH2OfwAaoK/OxXWsPwYAcp1+7zidF6rSQ
 mvPEw8gpdI0zYwChuM+7nybSsepn289+IFX3
X-Google-Smtp-Source: ABdhPJyr42EgonFJaFBiOV2ymxJMbC6QnQQzDvLI2HXpV9atsrCWXXK6PpEZRd0AN2Yrubed0E8MnQ==
X-Received: by 2002:aa7:d582:0:b0:42d:ce84:7e07 with SMTP id
 r2-20020aa7d582000000b0042dce847e07mr7668983edq.297.1654208307298; 
 Thu, 02 Jun 2022 15:18:27 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 es8-20020a056402380800b0042617ba63c3sm2874287edb.77.2022.06.02.15.18.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 15:18:24 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id x17so8139818wrg.6
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 15:18:21 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr5200892wrw.679.1654208301046; Thu, 02
 Jun 2022 15:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 2 Jun 2022 15:18:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XK5KsR51YnSks8sHy+hzfm6xRqUa7mPkCpRO4XDTzYHg@mail.gmail.com>
Message-ID: <CAD=FV=XK5KsR51YnSks8sHy+hzfm6xRqUa7mPkCpRO4XDTzYHg@mail.gmail.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/4] drm/dp: Make DP AUX bus usage easier;
 use it on ps8640
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Philip Chen <philipchen@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 10, 2022 at 12:30 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch is v3 of the first 2 patches from my RFC series ("drm/dp: Improvements
> for DP AUX channel") [1]. I've broken the series in two so we can make
> progress on the two halves separately.
>
> v2 of this series tries to incorporate all the feedback from v1. Hopefully
> things are less confusing and simpler this time around. The one thing that got
> slightly more confusing is that the done_probing() callback can't return
> -EPROBE_DEFER in most cases so we have to adjust drivers a little more.
>
> v3 takes Dmitry's advice on v2. This now introduces
> devm_drm_bridge_add() (in an extra patch), splits some fixups into
> their own patch, uses a new name for functions, and requires an
> explicit call to done_probing if you have no children.
>
> The idea for this series came up during the review process of
> Sankeerth's series trying to add eDP for Qualcomm SoCs [2].
>
> This _doesn't_ attempt to fix the Analogix driver. If this works out,
> ideally someone can post a patch up to do that.
>
> NOTE: I don't have any ps8640 devices that _don't_ use the aux panel
> underneath them, so I'm relying on code inspection to make sure I
> didn't break those. If someone sees that I did something wrong for
> that case then please yell!
>
> [1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
> [2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/
>
> Changes in v3:
> - Adapt to v3 changes in aux bus.
> - Don't call done_probing() if there are no children; return -ENODEV.
> - Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.
> - Patch ("drm/dp: Export symbol / kerneldoc fixes...") split for v3.
> - Split out EXPORT_SYMBOL and kerneldoc fixes to its own patch.
> - Use devm_drm_bridge_add() to simplify.
> - Used Dmitry's proposed name: of_dp_aux_populate_bus()
>
> Changes in v2:
> - Change to assume exactly one device.
> - Have a probe callback instead of an extra sub device.
> - Rewrote atop new method introduced by patch #1.
>
> Douglas Anderson (4):
>   drm/dp: Export symbol / kerneldoc fixes for DP AUX bus
>   drm/dp: Add callbacks to make using DP AUX bus properly easier
>   drm/bridge: Add devm_drm_bridge_add()
>   drm/bridge: parade-ps8640: Handle DP AUX more properly
>
>  drivers/gpu/drm/bridge/parade-ps8640.c   |  74 +++++---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 211 +++++++++++++++--------
>  drivers/gpu/drm/drm_bridge.c             |  23 +++
>  include/drm/display/drm_dp_aux_bus.h     |  34 +++-
>  include/drm/drm_bridge.h                 |   1 +
>  5 files changed, 238 insertions(+), 105 deletions(-)

I'd previously pushed patch #1. Now I've pushed the rest of the
patches to drm-misc-next with Dmitry's review:

10e619f1f31c drm/bridge: parade-ps8640: Handle DP AUX more properly
50e156bd8a9d drm/bridge: Add devm_drm_bridge_add()
3800b1710946 drm/dp: Add callbacks to make using DP AUX bus properly easier

-Doug

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC15539878
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 23:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573E610E06D;
	Tue, 31 May 2022 21:11:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E6C10E06D
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 21:11:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id f21so28964498ejh.11
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 14:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHYrrg1OiYZowD6aPazdTTV7Ju3sH7vUcubOYj24fu4=;
 b=UtRwpwucfDR8gD3L7SaGmezgIA5eG73xQodHXxNq0JxfaLvad7Zzy+Lt8+nRFoDSEz
 cDnX8R6alvDMA8xggJQdl89Yyl40Pi+iiv/q9jVII2cMZt/1qu/TD1lCliPIdELSeYqP
 7hpayhSqZL9lkCIf9aX7v909SxUuQrV+NkdbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHYrrg1OiYZowD6aPazdTTV7Ju3sH7vUcubOYj24fu4=;
 b=tqXSwXAFRN1rnLpOOfMH6We5TpCagJFOo3fZ+ZhgF5sd5cvLi9GtvtxMUNwzRX3zQK
 aLGDf3fouTClxGXrQF9+UbL1g5Pn56ehG0QhPZ1Hgk4vrqOhWm90gE4Mp8RC4xw7afU+
 4vUJZxeawnviz1xhKl5hqm526PZE59r9VrOAuMKeNI9D5tY5voRqBhtywwsGFsi2mYCp
 0U7dbZXR6hP5QAZjwP3ywUR+wbmeP9qv9X+VdkhGa79JS5sh1z3bb9JT3DF9/rPHwOZC
 yK1uoDtiRyKwWC6QLUgdfj/6s065EyZthjb9jCKLw5AbdT/yahK/TtaYBB39DlaMrwVR
 35Tw==
X-Gm-Message-State: AOAM530AqcpGHB8/wnb6GpVD7jyrwk7a9jKbAWOGulRPGHLgD5ljLjse
 8KA2P2pip6yit8HOSXMD1wuNuYye45h5l7yu
X-Google-Smtp-Source: ABdhPJzS9+UgB7eg2csB2dVjuPA+jGYS7sFkLPXRxB0Rk6C3UV2vSLo1VdLUrU+qIvweRC1MFCYtHg==
X-Received: by 2002:a17:907:1c2a:b0:6ff:4275:1e54 with SMTP id
 nc42-20020a1709071c2a00b006ff42751e54mr18700499ejc.138.1654031497441; 
 Tue, 31 May 2022 14:11:37 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 s24-20020a508d18000000b0042dd60352d1sm3459281eds.35.2022.05.31.14.11.36
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 14:11:37 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso1916405wma.4
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 14:11:36 -0700 (PDT)
X-Received: by 2002:a05:600c:acf:b0:397:345f:fe10 with SMTP id
 c15-20020a05600c0acf00b00397345ffe10mr25847322wmr.15.1654031047944; Tue, 31
 May 2022 14:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220510192944.2408515-1-dianders@chromium.org>
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 May 2022 14:03:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-gW_TMKKJA-5bCETp+KB4sAUDnMuGJMMTwAixb7Ho6w@mail.gmail.com>
Message-ID: <CAD=FV=W-gW_TMKKJA-5bCETp+KB4sAUDnMuGJMMTwAixb7Ho6w@mail.gmail.com>
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Philip Chen <philipchen@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
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

I'm hoping to get some review for this series. Anyone? Dmitry: I know
you looked at earlier versions of this series. I guess you're happy
enough with it now but don't feel enough ownership to give a full
Reviewed-by?

-Doug

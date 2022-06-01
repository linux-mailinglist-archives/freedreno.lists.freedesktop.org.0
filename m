Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE4E53AD36
	for <lists+freedreno@lfdr.de>; Wed,  1 Jun 2022 21:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441F110E6EB;
	Wed,  1 Jun 2022 19:27:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A3010E6EB
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jun 2022 19:27:42 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id z15so896064uad.7
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jun 2022 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yq2KQdG6/LqMMNGY1MWEE6ZyXA6F1VGTHd9bSTup/3o=;
 b=UARHyJjjhNcYzRbzkaCgemaWFT5Gh3U0EynMwzXn2AMBL42sV7T+9SKExYW+jqptUw
 5cCXSI7UQRbu2C3dVEwi1yOHBQG7evklGKr3UmM5mf6MQflTQ9kFM93gkYt5WUDvz8re
 C8FgujhQx59oIpLc2KkHWKGquo4eY6wE+1s8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yq2KQdG6/LqMMNGY1MWEE6ZyXA6F1VGTHd9bSTup/3o=;
 b=a10UKbVVvpASojU3pRyEZJ24XfuvzWDWLB3keWf9gKBbcF+mb+2qHw9y6WUi/o1ny+
 fSRFcZghUanoAgiLKRfbp/EdsjxjLiLQAUsAmRlwrmC03QZs0h1JJ/ioiKrm8bMa3hXw
 xIHEUoqEG/elnZfL/jWCn31Fv8sdJoKTKVwJfAOMkDVFNYj9ZouoRnuBa7gt4DHz5yKd
 Z3MJEny1yM5PATBs6mvHVs89FJPgaT7qL3aZDARzYGY3ol5bfuOoZrWDaqHCYZpw1HgQ
 kH04MgraVY08Q1OSJXKl5b3ew00KXvUFCQq+T4omjQ/Li55j6qnffO58wINoULvNc3B/
 VG2A==
X-Gm-Message-State: AOAM532EEDR8JH/c59TsIcT6As5/OC90dj70lRw5DkBjPMCU/gTADjsU
 0LoV+CU7GFUmGSzsLbPss73PUA2hfXgfcEDT
X-Google-Smtp-Source: ABdhPJy1kimUMKOqt/tFbxAu8oGvAbzzqRUIl60BWa1j7pOXiFL4UXSBi+AHUmz7ddJjw5vxiLoY1A==
X-Received: by 2002:ab0:604a:0:b0:362:911f:fe65 with SMTP id
 o10-20020ab0604a000000b00362911ffe65mr24372268ual.107.1654111660596; 
 Wed, 01 Jun 2022 12:27:40 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 o21-20020a67fbd5000000b003366998fba1sm316167vsr.24.2022.06.01.12.27.38
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 12:27:39 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id 63so2644343vsx.5
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jun 2022 12:27:38 -0700 (PDT)
X-Received: by 2002:a05:6102:23d9:b0:335:e916:b99d with SMTP id
 x25-20020a05610223d900b00335e916b99dmr830606vsr.70.1654111658217; Wed, 01 Jun
 2022 12:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
In-Reply-To: <20220601112302.v4.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
From: Sean Paul <seanpaul@chromium.org>
Date: Wed, 1 Jun 2022 15:27:00 -0400
X-Gmail-Original-Message-ID: <CAOw6vb+6g2Se-TPPy1=9P+tK7f+9sb6tuqbSAEqXXCG=XGPyhA@mail.gmail.com>
Message-ID: <CAOw6vb+6g2Se-TPPy1=9P+tK7f+9sb6tuqbSAEqXXCG=XGPyhA@mail.gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4] drm/probe-helper: Default to 640x480 if
 no EDID on DP
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 2:23 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> If we're unable to read the EDID for a display because it's corrupt /
> bogus / invalid then we'll add a set of standard modes for the
> display. Since we have no true information about the connected
> display, these modes are essentially guesses but better than nothing.
> At the moment, none of the modes returned is marked as preferred, but
> the modes are sorted such that the higher resolution modes are listed
> first.
>
> When userspace sees these modes presented by the kernel it needs to
> figure out which one to pick. At least one userspace, ChromeOS [1]
> seems to use the rules (which seem pretty reasonable):
> 1. Try to pick the first mode marked as preferred.
> 2. Try to pick the mode which matches the first detailed timing
>    descriptor in the EDID.
> 3. If no modes were marked as preferred then pick the first mode.
>
> Unfortunately, userspace's rules combined with what the kernel is
> doing causes us to fail section 4.2.2.6 (EDID Corruption Detection) of
> the DP 1.4a Link CTS. That test case says that, while it's OK to allow
> some implementation-specific fall-back modes if the EDID is bad that
> userspace should _default_ to 640x480.
>
> Let's fix this by marking 640x480 as default for DP in the no-EDID
> case.
>
> NOTES:
> - In the discussion around v3 of this patch [2] there was talk about
>   solving this in userspace and I even implemented a patch that would
>   have solved this for ChromeOS, but then the discussion turned back
>   to solving this in the kernel.
> - Also in the discussion of v3 [2] it was requested to limit this
> 83;40900;0c  change to just DP since folks were worried that it would break some
>   subtle corner case on VGA or HDMI.
>
> [1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15caff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=488
> [2] https://lore.kernel.org/r/20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


Reviewed-by: Sean Paul <seanpaul@chromium.org>

>
> ---
> I put Abhinav's Reviewed-by tag from v2 here since this is nearly the
> same as v2. Hope this is OK.
>
> Changes in v4:
> - Code is back to v2, but limit to just DP.
> - Beefed up the commit message.
>
> Changes in v3:
> - Don't set preferred, just disable the sort.
>
> Changes in v2:
> - Don't modify drm_add_modes_noedid() 'cause that'll break others
> - Set 640x480 as preferred in drm_helper_probe_single_connector_modes()
>
>  drivers/gpu/drm/drm_probe_helper.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 425f56280d51..75a71649b64d 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -569,8 +569,17 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>                 count = drm_add_override_edid_modes(connector);
>
>         if (count == 0 && (connector->status == connector_status_connected ||
> -                          connector->status == connector_status_unknown))
> +                          connector->status == connector_status_unknown)) {
>                 count = drm_add_modes_noedid(connector, 1024, 768);
> +
> +               /*
> +                * Section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a
> +                * Link CTS specifies that 640x480 (the official "failsafe"
> +                * mode) needs to be the default if there's no EDID.
> +                */
> +               if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> +                       drm_set_preferred_mode(connector, 640, 480);
> +       }
>         count += drm_helper_probe_add_cmdline_mode(connector);
>         if (count != 0) {
>                 ret = __drm_helper_update_and_validate(connector, maxX, maxY, &ctx);
> --
> 2.36.1.255.ge46751e96f-goog
>

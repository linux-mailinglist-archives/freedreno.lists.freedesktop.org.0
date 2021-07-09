Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 580AF3C257E
	for <lists+freedreno@lfdr.de>; Fri,  9 Jul 2021 16:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85F56EA35;
	Fri,  9 Jul 2021 14:02:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299786EA35
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 14:02:36 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id p134so2194770vke.8
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qiOUB7HLvLlvZOpZ/gkN2JlQJ5E4mMeYNLinigOA+9s=;
 b=T3wAp9DoNvgWy0Ro/pS13nqAvPokAxi8LgstNsyBbwHLqLqINLmtfgoFs/Q+BlwsIj
 8gvKq/S9P92Ny6t7qSxlsWjHtwZcDtNlGlFjVqIfX3ba00kPul2dqbIUTDiz2sOPMEWj
 EP/uYiL2UszRtbPSpERLnzSKOQQ6pm2kpZxkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qiOUB7HLvLlvZOpZ/gkN2JlQJ5E4mMeYNLinigOA+9s=;
 b=gM1x0YgKsuw6ICWVnn/KddPtrU2BkvznhkZjCVJwlBgEOWPDDFcpex+uFEUNQJokGT
 uUHTT/MNKSyrYoFdxyQwgTbzN/kpacKBS2zIXAbQ13zixw+UwI4eWYMb1s7iuVWH9Ttx
 TMF2WGSRGMUMW4S5E3bJ2doWpi3Pf8IiIbhxG13a9j5k84c8QbFv1kZXta5AT8QOFCUV
 Dv+uv4HgSNlCgVpL8/FH1D2pKQ6wcleHcXSKMxY0EElhk5Gh5fjuTuMD8FcXTk+bqnDa
 E0iZPVjkk6goK8Ph7xd5zEZaunXWB1XINpf0eldcp+3nBj1mjoUBjiSHenv7x/RJRg5c
 1O5A==
X-Gm-Message-State: AOAM532w1d5Egp/3BGjo4LA+33g5ii0e0QwxIs49tePDHwgghGSfnIgR
 9N1zJfftTQ+rW1b6ou8jBOJyOCXJnIz6qQ==
X-Google-Smtp-Source: ABdhPJx0mhDr+9B2VNpmeEOtMjlRimdLFVccPjNSkCvJ+cyebHLA3+LU9ycdHZfWCmjcTW/fZUByxQ==
X-Received: by 2002:a1f:2608:: with SMTP id m8mr32638569vkm.17.1625839353595; 
 Fri, 09 Jul 2021 07:02:33 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id h5sm762960vsr.27.2021.07.09.07.02.33
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 07:02:33 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id s13so3623832uao.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 07:02:33 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id
 u130mr49090811ybb.257.1625838856780; 
 Fri, 09 Jul 2021 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jul 2021 06:54:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
Message-ID: <CAD=FV=UP9jrS=JG=TuB7+i9QcZv8GOLYdPdb3_KNhEsgapGeww@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v8 0/6] drm: Support basic DPCD backlight in
 panel-simple and add a new panel ATNA33XC20
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, Jun 26, 2021 at 9:52 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> This series adds the support for the eDP panel that needs the backlight
> controlling over the DP AUX channel using DPCD registers of the panel
> as per the VESA's standard.
>
> This series also adds support for the Samsung eDP AMOLED panel that
> needs DP AUX to control the backlight, and introduces new delays in the
> @panel_desc.delay to support this panel.
>
> This patch series depends on the following two series:
> - Doug's series [1], exposed the DP AUX channel to the panel-simple.
> - Lyude's series [2], introduced new drm helper functions for DPCD
>   backlight.
>
> This series is the logical successor to the series [3].
>
> Changes in v1:
> - Created dpcd backlight helper with very basic functionality, added
>   backlight registration in the ti-sn65dsi86 bridge driver.
>
> Changes in v2:
> - Created a new DisplayPort aux backlight driver and moved the code from
>   drm_dp_aux_backlight.c (v1) to the new driver.
>
> Changes in v3:
> - Fixed module compilation (kernel test bot).
>
> Changes in v4:
> - Added basic DPCD backlight support in panel-simple.
> - Added support for a new Samsung panel ATNA33XC20 that needs DPCD
>   backlight controlling and has a requirement of delays between enable
>   GPIO and regulator.
>
> Changes in v5:
> Addressed review suggestions from Douglas:
> - Created a new API drm_panel_dp_aux_backlight() in drm_panel.c
> - Moved DP AUX backlight functions from panel-simple.c to drm_panel.c
> - panel-simple probe() calls drm_panel_dp_aux_backlight() to create
>   backlight when the backlight phandle is not specified in panel DT
>   and DP AUX channel is present.
> - Added check for drm_edp_backlight_supported() before registering.
> - Removed the @uses_dpcd_backlight flag from panel_desc as this
>   should be auto-detected.
> - Updated comments/descriptions.
>
> Changes in v6:
> - Rebased
> - Updated wanrning messages, fixed word wrapping in comments.
> - Fixed ordering of memory allocation
>
> Changes in v7:
> - Updated the disable_to_power_off and power_to_enable panel delays
> as discovered at <https://crrev.com/c/2966167> (Douglas)
>
> Changes in v8:
> - Now using backlight_is_blank() to get the backlight blank status (Sam Ravnborg)
> - Added a new patch #4 to fix the warnings for eDP panel description (Sam Ravnborg)
>
> [1] https://lore.kernel.org/dri-devel/20210525000159.3384921-1-dianders@chromium.org/
> [2] https://lore.kernel.org/dri-devel/20210514181504.565252-1-lyude@redhat.com/
> [3] https://lore.kernel.org/dri-devel/1619416756-3533-1-git-send-email-rajeevny@codeaurora.org/
>
> Rajeev Nandan (6):
>   drm/panel: add basic DP AUX backlight support
>   drm/panel-simple: Support DP AUX backlight
>   drm/panel-simple: Support for delays between GPIO & regulator
>   drm/panel-simple: Update validation warnings for eDP panel description
>   dt-bindings: display: simple: Add Samsung ATNA33XC20
>   drm/panel-simple: Add Samsung ATNA33XC20
>
>  .../bindings/display/panel/panel-simple.yaml       |   2 +
>  drivers/gpu/drm/drm_panel.c                        | 108 +++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               |  73 +++++++++++++-
>  include/drm/drm_panel.h                            |  15 ++-
>  4 files changed, 190 insertions(+), 8 deletions(-)

Pushed to drm-misc-next.

4bfe6c8f7c23 drm/panel-simple: Add Samsung ATNA33XC20
c20dec193584 dt-bindings: display: simple: Add Samsung ATNA33XC20
13aceea56fd5 drm/panel-simple: Update validation warnings for eDP
panel description
18a1488bf1e1 drm/panel-simple: Support for delays between GPIO & regulator
bfd451403d70 drm/panel-simple: Support DP AUX backlight
10f7b40e4f30 drm/panel: add basic DP AUX backlight support

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

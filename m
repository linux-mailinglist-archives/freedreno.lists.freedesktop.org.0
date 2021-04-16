Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62891362BB0
	for <lists+freedreno@lfdr.de>; Sat, 17 Apr 2021 01:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989496E135;
	Fri, 16 Apr 2021 23:02:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3936E135
 for <freedreno@lists.freedesktop.org>; Fri, 16 Apr 2021 23:02:57 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id bs7so13760699qvb.12
 for <freedreno@lists.freedesktop.org>; Fri, 16 Apr 2021 16:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S2TYM+wdp6+vDu4GYyPIj8WsiphUkb2AvhRdqqeeoy0=;
 b=Jrf5W3Bx2YFA/wzMJQ4naBpogVfH2bAOaRDsvRP+wQCyW65LnEFXDogl9l/5ok/Y+d
 HKuhWhsbxsOZ3HbwY6lDvjJuo+jYbjpbbe/Bqt6o3yHBZPTrgvTmnqrZkXu7zDf4Ocx9
 AXFe6MfdwJicBmuEKIBtdvCrHkcK8pWB9JXJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S2TYM+wdp6+vDu4GYyPIj8WsiphUkb2AvhRdqqeeoy0=;
 b=tUA42Ifv5Gi5aqBukNOM/yeBHlKw/7ioSQvIsz5jECOW/tMcQssiNk5XmxDoRfSwBA
 EeI0IkHQ+hYlZYLSB3kViwzOT3MjHAlDeohES9NDAylfqA6qDm5de0zraveH+VMjQkP6
 83ufA7dsoylatFh8RYBJ4DbRAJh396gUehr90hPvpTr91MpWQxMI/pJt3qjoj9hTEI/B
 p4zJPcp4KaxYoM/mWk5jW2kuasiK5mNeE994MZ5O6oONYtXKPP6rHjdEI7FAw6yTzAMw
 Ket5CYFC6TASG33P4SU13MEWv9PBG0vAOc83J5Dv18R5mpRSpBibTrsGqUd+4smhUaie
 LT3A==
X-Gm-Message-State: AOAM5314GuKN2G8lpY5BQ4nTrcvwLvo+p7xE/ei8za6PmvqECOsLfAGN
 EV8uD1Ywbz+jU5Qgt3vdTuBZ8BN1pVPKgQ==
X-Google-Smtp-Source: ABdhPJwPHG40tytaRrU/I6MVidrKz8LUcXAezA51mlcX+1i+ZM4aZ8vjRyainZnnWSiiYmUjI4ygwg==
X-Received: by 2002:a0c:e842:: with SMTP id l2mr10712335qvo.21.1618614176234; 
 Fri, 16 Apr 2021 16:02:56 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
 by smtp.gmail.com with ESMTPSA id p6sm464244qkk.30.2021.04.16.16.02.55
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 16:02:55 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id p3so11194404ybk.0
 for <freedreno@lists.freedesktop.org>; Fri, 16 Apr 2021 16:02:55 -0700 (PDT)
X-Received: by 2002:a25:244d:: with SMTP id k74mr2023484ybk.79.1618614174530; 
 Fri, 16 Apr 2021 16:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Apr 2021 16:02:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSjRhNk_VT9vXEpzO=7pKi3VJG+SB7wnZnKZjeD+UsZg@mail.gmail.com>
Message-ID: <CAD=FV=WSjRhNk_VT9vXEpzO=7pKi3VJG+SB7wnZnKZjeD+UsZg@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [Freedreno] [v1 0/3] drm: Add support for backlight control of
 eDP panel on ti-sn65dsi86 bridge
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
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 14, 2021 at 9:41 AM Rajeev Nandan <rajeevny@codeaurora.org> wrote:
>
> The backlight level of an eDP panel can be controlled through the AUX
> channel using DPCD registers of the panel.
>
> The capability for the Source device to adjust backlight characteristics
> within the panel, using the Sink device DPCD registers is indicated by
> the TCON_BACKLIGHT_ADJUSTMENT_CAPABLE bit in the EDP_GENERAL_CAPABILITY_1
> register (DPCD Address 701h, bit0). In this configuration, the eDP TCON
> receives the backlight level information from the host, through the AUX
> channel.
>
> The changes in this patch series do the following:
> - Add drm_dp_aux_backlight_ APIs to support backlight control using DPCD
>   registers on the DisplayPort AUX channel.
>   The current version only supports backlight brightness control by the
>   EDP_BACKLIGHT_BRIGHTNESS_MSB/LSB registers (DPCD Addresses 722h-723h).
> - Add support for backlight control of the eDP panel connected to the
>   ti-sn65dsi86 bridge.
>
> Rajeev Nandan (3):
>   drm/dp: Add DisplayPort aux backlight control support
>   dt-bindings: drm/bridge: ti-sn65dsi86: Document use-aux-backlight
>   drm/bridge: ti-sn65dsi86: Add DisplayPort aux backlight support
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml      |   8 +
>  drivers/gpu/drm/Kconfig                            |   8 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/bridge/Kconfig                     |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  26 +++
>  drivers/gpu/drm/drm_dp_aux_backlight.c             | 191 +++++++++++++++++++++
>  include/drm/drm_dp_aux_backlight.h                 |  29 ++++
>  7 files changed, 264 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_dp_aux_backlight.c
>  create mode 100644 include/drm/drm_dp_aux_backlight.h

So I haven't looked in massive detail at this patch series, but the
fact that it's touching "ti-sn65dsi86.c" is a red flag. I know in
out-of-band communications you said you weren't sure how to do better.
...but, perhaps, if folks don't hate my recent series [1] there may be
a way forward.

I wonder if perhaps now that the AUX channel can be registered early
if it gets around the circular dependency problems and now you can put
your code in some combination of the panel code and (maybe?) a new
backlight driver if it's generic enough.

It's possible that you might need to add some code to be able to look
up a "struct drm_dp_aux *" from a device tree node and you might need
to add a new device tree property like "ddc-aux-bus" in order to do
this, but I don't _think_ that would be controversial?

[1] https://lore.kernel.org/r/20210416223950.3586967-1-dianders@chromium.org

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

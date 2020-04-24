Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D961E1B7C80
	for <lists+freedreno@lfdr.de>; Fri, 24 Apr 2020 19:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849286EADD;
	Fri, 24 Apr 2020 17:14:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0341F6EADD
 for <freedreno@lists.freedesktop.org>; Fri, 24 Apr 2020 17:14:20 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id p10so11128716ioh.7
 for <freedreno@lists.freedesktop.org>; Fri, 24 Apr 2020 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RYByyO3QIEU47gTN7mqAa4K1vs54y8GQ0x5KuvlJFVY=;
 b=crFmzsS8lWUOAAgiwUHxODA0VdX/NmN1uriNwtVUUxeQaK6UjeTU8g+fpOFh5DHg5Z
 ywSPkI7dTX4Q+k1xGvY8RE+c1imAur9njIPVgQGFLJrrJWol7k8ymDw011RnY4NCmTRD
 J8cDVFeHjut2K/RXWWmDzhYA0uh2wEb/vXvkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYByyO3QIEU47gTN7mqAa4K1vs54y8GQ0x5KuvlJFVY=;
 b=FNBRKcQqAZeq0FpGQx1Ryxy9rFcElAsCdQyl0S4ybGBu3cRJyq2PjHDKe/C771G3kB
 FiHe+efkeaH8jliwOxLw9m56MNW08rMO5fSzKS4f87S+9z7M/OGQhvhWqoegcZeaarN3
 3ctxSD9LmW9h/RTKHicYR92Ii0PEy71ybCCAc12s+ugOYO4sRPeWSknHrx1JDzMVpaBZ
 jFaByxhdIhzruKk7u2WZ9BIICBufOJH6InopdiIAWaEnjI0o1JXcy5t7+/Te+hzzMvS3
 dSqItSIMHRUbPOA7brK+d6/4SKmhSrlQCUSSownS49ZiWHbk6fmB/M21r0KFaxkILHTl
 qhnw==
X-Gm-Message-State: AGi0PuZe6+FInAxe9IVhPHt3fTmPp2fSaVwIfrIzweGZnnqIbZpRKIRw
 f3czuqUgxv5tNd+X9ssdhAp0285acRe7Uw==
X-Google-Smtp-Source: APiQypJZzYWj8YdB17NzNHzrncd3vPf31+4cUXkBj65xqNkXzxZ49mf6s3/xxcZqTT8knoK1BRKZeQ==
X-Received: by 2002:a6b:7843:: with SMTP id h3mr9605377iop.202.1587748459824; 
 Fri, 24 Apr 2020 10:14:19 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com.
 [209.85.166.52])
 by smtp.gmail.com with ESMTPSA id n23sm2021960ioh.6.2020.04.24.10.14.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 10:14:13 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id f19so11140175iog.5
 for <freedreno@lists.freedesktop.org>; Fri, 24 Apr 2020 10:14:12 -0700 (PDT)
X-Received: by 2002:a5d:8615:: with SMTP id f21mr9473817iol.155.1587748451793; 
 Fri, 24 Apr 2020 10:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
In-Reply-To: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 24 Apr 2020 13:13:34 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKus8S-ZWjuozKQ8Ft4s-8dPsihrNoZf-GjcToR466RZA@mail.gmail.com>
Message-ID: <CAOw6vbKus8S-ZWjuozKQ8Ft4s-8dPsihrNoZf-GjcToR466RZA@mail.gmail.com>
To: Tanmay Shah <tanmay@codeaurora.org>
Subject: Re: [Freedreno] [DPU PATCH v5 0/5] Add support for DisplayPort
 driver on SnapDragon.
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
Cc: devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 abhinavk@codeaurora.org, swboyd@chromium.org, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Kristian Kristensen <hoegsberg@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 8:31 PM Tanmay Shah <tanmay@codeaurora.org> wrote:
>
> These patches add support for Display-Port driver on SnapDragon 845 hardware. It adds
> DP driver and DP PLL driver files along with the needed device-tree bindings.
>

I focused on patches 2, 3 & 5, seems like you have good feedback on
the others by more qualified folks than me.

At a high level I don't have any major issues with the set. There are
some rough edges that I noticed as I was reading it (as would any
patch of this size), but I think it's probably not a good use of
either of our time for me to nitpick 10k lines of code over multiple
iterations.

So in the interest of not letting the perfect get in the way of the
good, I suggest we apply the set and fix up as time and necessity
allow.

Patches 2/3/5 are:

Acked-by: Sean Paul <seanpaul@chromium.org>

Sean


> The block diagram of DP driver is shown below:
>
>
>                  +-------------+
>                  |DRM FRAMEWORK|
>                  +------+------+
>                         |
>                    +----v----+
>                    | DP DRM  |
>                    +----+----+
>                         |
>                    +----v----+
>      +------------+|   DP    +----------++------+
>      +             | DISPLAY |+---+      |      |
>      |             +-+-----+-+    |      |      |
>      |               |     |      |      |      |
>      |               |     |      |      |      |
>      |               |     |      |      |      |
>      v               v     v      v      v      v
>  +------+          +---+ +----+ +----+ +---+ +-----+
>  |  DP  |          |DP | | DP | | DP | |DP | | DP  |
>  |PARSER|          |AUX| |LINK| |CTRL| |PHY| |POWER|
>  +--+---+          +---+ +----+ +--+-+ +-+-+ +-----+
>     |                              |     |
>  +--v---+                         +v-----v+
>  |DEVICE|                         |  DP   |
>  | TREE |                         |CATALOG|
>  +------+                         +---+---+
>                                       |
>                                   +---v----+
>                                   |CTRL/PHY|
>                                   |   HW   |
>                                   +--------+
>
>
> These patches have dependency on clock driver changes mentioned below:
> https://patchwork.kernel.org/patch/10632753/
> https://patchwork.kernel.org/patch/10632757/
>
> Chandan Uddaraju (4):
>   dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
>   drm: add constant N value in helper file
>   drm/msm/dp: add displayPort driver support
>   drm/msm/dp: add support for DP PLL driver
>
> Jeykumar Sankaran (1):
>   drm/msm/dpu: add display port support in DPU
>
>  .../devicetree/bindings/display/msm/dp-sc7180.yaml |  325 ++++
>  .../devicetree/bindings/display/msm/dpu.txt        |   16 +-
>  drivers/gpu/drm/i915/display/intel_display.c       |    2 +-
>  drivers/gpu/drm/msm/Kconfig                        |   21 +
>  drivers/gpu/drm/msm/Makefile                       |   16 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   28 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |    8 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   65 +-
>  drivers/gpu/drm/msm/dp/dp_aux.c                    |  531 ++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h                    |   35 +
>  drivers/gpu/drm/msm/dp/dp_catalog.c                |  988 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h                |   86 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 1707 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   35 +
>  drivers/gpu/drm/msm/dp/dp_display.c                |  943 +++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h                |   31 +
>  drivers/gpu/drm/msm/dp/dp_drm.c                    |  170 ++
>  drivers/gpu/drm/msm/dp/dp_drm.h                    |   19 +
>  drivers/gpu/drm/msm/dp/dp_hpd.c                    |   69 +
>  drivers/gpu/drm/msm/dp/dp_hpd.h                    |   79 +
>  drivers/gpu/drm/msm/dp/dp_link.c                   | 1216 ++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h                   |  132 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c                  |  490 ++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h                  |   95 ++
>  drivers/gpu/drm/msm/dp/dp_parser.c                 |  473 ++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h                 |  220 +++
>  drivers/gpu/drm/msm/dp/dp_power.c                  |  545 +++++++
>  drivers/gpu/drm/msm/dp/dp_power.h                  |  115 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h                    |  489 ++++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.c                |  127 ++
>  drivers/gpu/drm/msm/dp/pll/dp_pll.h                |   57 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c           |  401 +++++
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h           |   86 +
>  drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c      |  524 ++++++
>  drivers/gpu/drm/msm/msm_drv.c                      |    2 +
>  drivers/gpu/drm/msm/msm_drv.h                      |   53 +-
>  include/drm/drm_dp_helper.h                        |    2 +
>  37 files changed, 10178 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.h
>  create mode 100644 drivers/gpu/drm/msm/dp/pll/dp_pll_10nm_util.c
>
> --
> 1.9.1
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 202743214A3
	for <lists+freedreno@lfdr.de>; Mon, 22 Feb 2021 12:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608896E0D6;
	Mon, 22 Feb 2021 11:01:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655B26E0D6
 for <freedreno@lists.freedesktop.org>; Mon, 22 Feb 2021 11:01:00 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id n8so2132737vso.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Feb 2021 03:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgFHY4hV1gsz8pgEmyxYxqT5LdN1M6Rn37TYsGGZMr0=;
 b=QGOfC1OxJtyzhn/Dqh9x46vUR0wedl0F6e2YLebzF7a2LSj9jBLLI0PtMzqfOTNvY2
 1zISBI7qQJRWsEByoOWAsCA5uT/NmuX1iJutbxhkjBxxCMp5FaU1olopGZcY/zpbiVb7
 5aTe64cskNMRi/sSIcu/D8s1yj6PVS08su5Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgFHY4hV1gsz8pgEmyxYxqT5LdN1M6Rn37TYsGGZMr0=;
 b=rh5gWsrLOLTquQrZy3i86wPzQy8ysGXW0/fkDGEMaRB5mUgtNSGOxSDNR6Ohm5o/V1
 44Hs3dfcrlLOAaL8joSSxWDM6kamZ6aHwW7g4xB4gybTyU2DoTP5l8ML/LHeJUlU1fuE
 GtS81xaMcXkn+XNOTJI2kYLIjQIDiS9XWzQD2vSYrnVBWghOdmgrCFPIqH4+3ECawNBQ
 GzxWaFm/X04uY9+GchZnQeTrKtR1fBSqE++lSuvz2mOfVudJIZpnoYdSpgXSIuWTtzYW
 xPavX0bbkeL/mWCBwXf4H9S6YakQoIIto8m8OYec1KNkgjtEzD7Ge0Fjcc8hndhVXGqy
 w5HA==
X-Gm-Message-State: AOAM533a0A7kVpXq7HUcPVsdmeaVWMYLIMBLcO76mUeNLwWI06ljuDWc
 Sy/C1qDLCLcE78aAZq/8nfyLVQhwfL9DMGYEvLg9XA==
X-Google-Smtp-Source: ABdhPJxtvbO7yc7JIxcXC+vdsfZmlOTELtCIG4dyQr0KPt0s8Qz9jqkc/ShnqA459sEHTxSt78vabRBPoAMMyMx2ZKQ=
X-Received: by 2002:a67:8945:: with SMTP id l66mr12716289vsd.48.1613991659266; 
 Mon, 22 Feb 2021 03:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
 <CGME20210222053139eucas1p2661f94e218ae4c553e031ffa2e7b0cb3@eucas1p2.samsung.com>
 <CANMq1KALq+C2GD2uRohKpwvkDC05-fHyo=_WoHwnsKNjgcSfEQ@mail.gmail.com>
 <a804b8eb-3c79-4753-670c-cd5c2dfbc3a4@samsung.com>
In-Reply-To: <a804b8eb-3c79-4753-670c-cd5c2dfbc3a4@samsung.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 22 Feb 2021 19:00:48 +0800
Message-ID: <CANMq1KCUX-8FXb+3WH=dHOU6C0YAMPsMCsH3DLGdiJKdvpHShQ@mail.gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [Freedreno] [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags
 disabling features
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 3:21 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Hi Nicolas,
>
> W dniu 22.02.2021 o 06:31, Nicolas Boichat pisze:
> > On Mon, Feb 22, 2021 at 3:08 AM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >> Hi Nicolas,
> >>
> >> Thank you for the patch.
> >>
> >> On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
> >>> Many of the DSI flags have names opposite to their actual effects,
> >>> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> >>> be disabled. Fix this by including _NO_ in the flag names, e.g.
> >>> MIPI_DSI_MODE_NO_EOT_PACKET.
> >>>
> >>> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >> This looks good to me, it increases readability.
> >>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>
> >> Please however see the end of the mail for a comment.
>
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
>
> And comment at the end.
>
> >>
> >>> ---
> >>> I considered adding _DISABLE_ instead, but that'd make the
> >>> flag names a big too long.
> >>>
> >>> Generated with:
> >>> flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> >>> flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> >>> flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> >>> flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >>>    xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> >>> (then minor format changes)
> >> Ever tried coccinelle ? :-)
> > Fun project for next time ,-)
> >
> >>>   drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
> >>>   drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
> >>>   drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
> >>>   drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
> >>>   drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
> >>>   drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >>>   drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
> >>>   drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
> >>>   drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
> >>>   drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
> >>>   drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
> >>>   drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
> >>>   drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
> >>>   drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
> >>>   drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >>>   drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
> >>>   drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >>>   drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
> >>>   drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
> >>>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
> >>>   drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
> >>>   drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
> >>>   drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
> >>>   drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
> >>>   include/drm/drm_mipi_dsi.h                           | 8 ++++----
> >>>   25 files changed, 36 insertions(+), 36 deletions(-)
> >>>
> >>> []
> >>> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> >>> index 360e6377e84b..ba91cf22af51 100644
> >>> --- a/include/drm/drm_mipi_dsi.h
> >>> +++ b/include/drm/drm_mipi_dsi.h
> >>> @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >>>   /* enable hsync-end packets in vsync-pulse and v-porch area */
> >>>   #define MIPI_DSI_MODE_VIDEO_HSE              BIT(4)
> >> We're mixing bits that enable a feature and bits that disable a feature.
> >> Are these bits defined in the DSI spec, or internal to DRM ? In the
> >> latter case, would it make sense to standardize on one "polarity" ? That
> >> would be a more intrusive change in drivers though.
> > Yes, that'd require auditing every single code path and reverse the
> > logic as needed. I'm not volunteering for that ,-P (hopefully the
> > current change is still an improvement).
> >
> > Hopefully real DSI experts can comment (Andrzej?), I think the default
> > are sensible settings?
>
> Hehe, "real DSI expert" :), ok I've read spec few times :)
>
> If I remember correctly the spec did not prioritizes these modes, specs
> are publicly available if somebody want to check it feel free.
>
> These values were taken from defaults for Exynos DSI, as nobody at the
> time has better idea.
>
> We could try to optimize it by looking for example in different dsi
> hosts defaults, or maybe dsi devices, but I am not sure if it is worth time.

Little git grep experiment:
# git grep compatible -- drivers/gpu/drm/panel | wc -l
219 panels in total

# sed -n 's/.*\(MIPI_DSI[^ \t]*\).*/\1/p' include/drm/drm_mipi_dsi.h |
xargs -I{} sh -c 'echo -n {}:; git grep {} | wc -l'
MIPI_DSI_MODE_VIDEO:68
MIPI_DSI_MODE_VIDEO_BURST:23
MIPI_DSI_MODE_VIDEO_SYNC_PULSE:20
MIPI_DSI_MODE_VIDEO_AUTO_VERT:1
MIPI_DSI_MODE_VIDEO_HSE:6
MIPI_DSI_MODE_VIDEO_NO_HFP:1
MIPI_DSI_MODE_VIDEO_NO_HBP:1
MIPI_DSI_MODE_VIDEO_NO_HSA:1
MIPI_DSI_MODE_VSYNC_FLUSH:1
MIPI_DSI_MODE_NO_EOT_PACKET:16
MIPI_DSI_CLOCK_NON_CONTINUOUS:19
MIPI_DSI_MODE_LPM:54

At least, there is no regret flipping the polarity for
MIPI_DSI_MODE_VIDEO_NO_HFP/HBP/HSA.

I guess we could consider flipping the default for MIPI_DSI_MODE_VIDEO
and MIPI_DSI_MODE_LPM (some drivers set the flags in code, instead of
a structure, so I think MIPI_DSI_MODE_VIDEO is almost always set).

Still not volunteering ,-P

>
> This solution is good for me.
>
>
> Regards
>
> Andrzej
>
>
> >
> >
> >>>   /* disable hfront-porch area */
> >>> -#define MIPI_DSI_MODE_VIDEO_HFP              BIT(5)
> >>> +#define MIPI_DSI_MODE_VIDEO_NO_HFP   BIT(5)
> >>>   /* disable hback-porch area */
> >>> -#define MIPI_DSI_MODE_VIDEO_HBP              BIT(6)
> >>> +#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
> >>>   /* disable hsync-active area */
> >>> -#define MIPI_DSI_MODE_VIDEO_HSA              BIT(7)
> >>> +#define MIPI_DSI_MODE_VIDEO_NO_HSA   BIT(7)
> >>>   /* flush display FIFO on vsync pulse */
> >>>   #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
> >>>   /* disable EoT packets in HS mode */
> >>> -#define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
> >>> +#define MIPI_DSI_MODE_NO_EOT_PACKET  BIT(9)
> >>>   /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> >>>   #define MIPI_DSI_CLOCK_NON_CONTINUOUS        BIT(10)
> >>>   /* transmit data in low power */
> >> --
> >> Regards,
> >>
> >> Laurent Pinchart
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://protect2.fireeye.com/v1/url?k=e6f0d6d2-b96befef-e6f15d9d-0cc47a31309a-f4be6a0935319c2d&q=1&e=5e175166-1972-4f28-a483-e9a65c07e25f&u=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

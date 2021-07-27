Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15AF3D7333
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 12:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788806E1F3;
	Tue, 27 Jul 2021 10:29:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550006E45E
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 10:29:20 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id n15so4538194uaj.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
 b=VA9XBSq4CQhlCAZrPbTm3nskntRBag7xfqyt0l5ZRi4tj4r7Nwmj7cH8Q//ULvZ68Y
 5rx6ds4fUh1cKyKjtK9DlDLoCmoMTBGuBTVGak7TJbutzKps51Gx+PW0a4zDeLzgCVRA
 7v+taAWoRMIo4GLW7W31F6kuP0wNC9VL3N8Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BNXOQOHHvkyOlpYQvBOMgkkH26gWwGd0okW8oi8QdqI=;
 b=XNDVmaiB/ecq23JPM24tkROVa7WcR54oRdkSBcOjlPawEIq5DufgqKxUAOZx3iQk+2
 chRA/Az5TD4m9UINoA2Xzwt7PSh8SiR5edfBRDHUmkdOA28kmVAmD1ud3W4FaeTyZ6T0
 cA/WXxprgELm7iZIM/2vFnSHaIGxn8lnbsdBp93BzobUfR/Ny/gdM7dWHKFN5RKrmZ78
 agdINt1vV/LaMWDWXFOI3EC/nALS0rSp2v9KYuCYcFtIWJvIx/MioE8Q1PfxzSiDACsx
 oaudh+9elNj8meeO0MQhJdMw2wDcKC8+LFIbp04i7VbtdmJLlm9s2GPX7uGxa8pQUll7
 pZvw==
X-Gm-Message-State: AOAM5322DLol5VQ2XH+kYKT129ypyJlfBH0OBdclz6UHOTH5htsuBcKs
 6eaxsoU+eBMzh4EtyoyHWA8dvDVpJ1kNKJ96YQeH/w==
X-Google-Smtp-Source: ABdhPJyx7sQwhJ8UE8NDg2Kx4YHR88sGvEf5AH10FBKUxfscAE8LJuhcwnvw8wjRTLPiqyBoy6zqtE4uvHrV7c6EPNE=
X-Received: by 2002:ab0:2641:: with SMTP id q1mr16151134uao.82.1627381759398; 
 Tue, 27 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210727094435.v3.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YP/FMblLCPpR7Tgf@ravnborg.org>
In-Reply-To: <YP/FMblLCPpR7Tgf@ravnborg.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Jul 2021 18:29:08 +0800
Message-ID: <CANMq1KAVA3LRXzcKrVoj30KtvwuA0hQ12JdMLu32-RD8h=UjFw@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Freedreno] [PATCH v3] drm/dsi: Add _NO_ to MIPI_DSI_* flags
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
 Jordan Crouse <jordan@cosmicpenguin.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Yu Jiahua <yujiahua1@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 4:35 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Nicolas,
> On Tue, Jul 27, 2021 at 09:45:21AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@samsung.com>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com> # anx7625.c
> > Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org> # msm/dsi
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
> >
> > Changes in v3:
> >  - Added all R-b tags from v1 and v2 (hopefully didn't miss any).
> >
> > Changes in v2:
> >  - Rebased on latest linux-next, after some of the flags got fixed
> >    (Linus Walleij).
>
> Thanks for the update, applied to drm-misc-next.

Thanks Sam!

>
>         Sam
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

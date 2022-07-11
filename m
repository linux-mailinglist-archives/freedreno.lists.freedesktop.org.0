Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 213795708C8
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 19:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1A910FB79;
	Mon, 11 Jul 2022 17:23:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4DD11BB09
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 17:22:59 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m16so7090784edb.11
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 10:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/a1UbjX73QHDgFxXbe9HW11fDUV6n2EgYdg4XVN7V4=;
 b=WZWXJ+sltlTPlPn/bzKiujziHp3Pw0Ib1/YdW52oCRLfs+CfOw7rN0GttGkL8Xuo2t
 NASR2HFpAsXMEaYS7p8e1Q9LoFni0sLiAniavy8jKkR5/Vr2rN/lt8nuT0PobHZMBpM7
 XvK4J/RA2NVwXKuS8IABLHFzBVV5WrxHEY0t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/a1UbjX73QHDgFxXbe9HW11fDUV6n2EgYdg4XVN7V4=;
 b=wPkSXh2AxpjF2/BdNo5+Ofosp8sb7uBd9oqjpieUBEO7IS4Xg9X0z6jW3+zhD2NLUj
 ieq3EOxEuK0/EZ1c5HqFXIQPve8AayiL8OT2HO3d4hwYHxD4MnTeR1V/JtbFY0oKb2Gs
 xDvT+liRD2SROtzS+60vlaMPKkwzKGNu5NmD/9lrsjOAeLrHVM74+V/y9G0Gqn5tuUp2
 HZ8yAWhxZuIKHJl2zAoxwy+Mw/LdaLELbKSONbXYlMZsCklQLlfgxCyMD0lvmqb0f0LD
 T0xA1be2yUnpbuV/5Iyeil9g0tY5CY7XlvMAhQoxgk46tGZc6l0hhtLhGsRxNlffUqhA
 /iiw==
X-Gm-Message-State: AJIora/p4Tktgknwfp2HV/+yETFp5Qfoxo0fDbkoicRiLYR/DARsPRf2
 1RWAeGTRz76QyKLR6lgJS3rEY4g9Aupb8ghlQ8c=
X-Google-Smtp-Source: AGRyM1uBENwe/vtyy0x6IJt/6P6ozv4o5N9JqXwVmD9g2CI2gjOEYihG6PBGzVGALMm9H52hE5JqAw==
X-Received: by 2002:a05:6402:34c3:b0:43a:c323:274f with SMTP id
 w3-20020a05640234c300b0043ac323274fmr17592574edc.67.1657560177777; 
 Mon, 11 Jul 2022 10:22:57 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 fp17-20020a1709069e1100b0072a55ec6f3bsm2861235ejc.165.2022.07.11.10.22.56
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 10:22:56 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 i128-20020a1c3b86000000b003a2ce31b4f8so5395659wma.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 10:22:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr17363425wmq.85.1657560175521; Mon, 11
 Jul 2022 10:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-2-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 10:22:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WQv1Tzm_BZO6-RRPPepgAyB-AYRSxTDaj=AirO9ikG1w@mail.gmail.com>
Message-ID: <CAD=FV=WQv1Tzm_BZO6-RRPPepgAyB-AYRSxTDaj=AirO9ikG1w@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH v3 1/2] drm/bridge: ti-sn65dsi86: fetch
 bpc using drm_atomic_state
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Rather than reading the pdata->connector directly, fetch the connector
> using drm_atomic_state. This allows us to make pdata->connector optional
> (and thus supporting DRM_BRIDGE_ATTACH_NO_CONNECTOR).
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I tested this on a google,lazor-rev5-sku6 (your code correctly found
bpc as 6) and a google,coachz-rev2-sku0 (your code correctly found bpc
as 8).

As an extra safety net, I also double-checked that the generic
edp-panel would work. I also hacked the first device to use
"edp-panel" as a compatible string, found the panel to be detected,
and found bpc was properly found as 6.

So from a testing perspective this seems good.

Tested-by: Douglas Anderson <dianders@chromium.org>

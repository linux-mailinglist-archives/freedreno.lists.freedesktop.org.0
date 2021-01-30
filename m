Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B93C30968B
	for <lists+freedreno@lfdr.de>; Sat, 30 Jan 2021 17:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C0B6E0F1;
	Sat, 30 Jan 2021 16:16:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73B36E0FE
 for <freedreno@lists.freedesktop.org>; Sat, 30 Jan 2021 16:16:22 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id l27so11903751qki.9
 for <freedreno@lists.freedesktop.org>; Sat, 30 Jan 2021 08:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ejssOulrsTZ3ouHbrBBarxFuH2SuoMwxOAnWZQut8vY=;
 b=fmLNhBeiMEpCT64iXb708ra7uyU/Zu3j1K6JAv36RVHp01n5CleHqXKzoT74F9zaKL
 wncl6lJDD/PlSfUmmKmJdnMKUoo797O6FRVEjLRnyufjvFId6qRLeJQlRkiG6ypIC5+B
 fE5+v0pAHXXbvTEC65/I2ZAMahOFJe4XIbIutYTHZs4bANICZZw7g+HNQ5VwlgpOMUtv
 C1+rSGClaWl1qjmgmV0TJB9xn/iFlgNVbxQpxd+1m3AYeijxvhrI0sT6EDqPsgSEcUUO
 72tMlzC4kQ4hJFXavIUisZ1M3dK7Yf0icFZeWv9toAeRTyfhzKK252rM9jUJSt6+cdA7
 a77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ejssOulrsTZ3ouHbrBBarxFuH2SuoMwxOAnWZQut8vY=;
 b=udepcNeq66FPRA6Li47Ct67hkFxokEKJuyHMIqax05/B3JQYJmDxQ6wDGh9gNwsPi9
 citWqUWd3rKSEWS3DhWJgawzE6JhcGKqXCxM/vXKRvxgp8JUode8hM0E0fZX1JP76MdU
 s8G5v7ZcAieLXwNOiOnc1Ae4MWcIe6FZaUCV/PhSpHCHcm+YzR+QGvoEX8MN0/LiGnZx
 boJfQcKOhIDWhoT6ZNl8KH42cNw9D8DlyhSwuYnAb85tMLVKsja7zBC7k86Odmfpocer
 5M/HRTOoSRhGLSmoMe3wSLP1V+bWLxA1jvDbw3oA2f0aEd1e8RNEmKqg9MxEJs3OA5cs
 ZFaw==
X-Gm-Message-State: AOAM5303BAKfrRMeXYpASgTG483ktTDTWLv0pPiXygkRnfjWM4dlSlMq
 ebpx86+cTI5u1eAUdvJmTNcpKFWpg9PrEC55YYA4tw==
X-Google-Smtp-Source: ABdhPJxjFzuwpFzrLhh+nGrXrs4raiQtDHat0NUdPD5KVJSQnlTf0MuHS/yGpjPuaALH/of+u93L6laMiPrv5cVnAro=
X-Received: by 2002:a05:620a:ec2:: with SMTP id
 x2mr8981436qkm.138.1612023381824; 
 Sat, 30 Jan 2021 08:16:21 -0800 (PST)
MIME-Version: 1.0
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
 <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
 <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
In-Reply-To: <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Jan 2021 19:16:10 +0300
Message-ID: <CAA8EJprOYwe8pSc+QzptVjxWKiTG-jGxoUh0aa5JTGq-4nnt+g@mail.gmail.com>
To: Benjamin Li <benl@squareup.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: save PLL registers across
 first PHY reset
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
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Anibal Limon <anibal.limon@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 30 Jan 2021 at 05:00, Benjamin Li <benl@squareup.com> wrote:
>
>
> On 10/30/20 6:55 AM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > On 07/10/2020 03:10, benl-kernelpatches@squareup.com wrote:
> >> From: Benjamin Li <benl@squareup.com>
> >>
> >> Take advantage of previously-added support for persisting PLL
> >> registers across DSI PHY disable/enable cycles (see 328e1a6
> >> 'drm/msm/dsi: Save/Restore PLL status across PHY reset') to
> >> support persisting across the very first DSI PHY enable at
> >> boot.
> >
> > Interesting enough, this breaks exactly on 8016. On DB410c with latest bootloader and w/o splash screen this patch causes boot freeze. Without this patch the board would successfully boot with display routed to HDMI.
>
> Hi Dimtry,
>
> Thanks for your fix for the DB410c breakage ("drm/msm/dsi: do not
> try reading 28nm vco rate if it's not enabled") that this patch
> causes.
>
> I re-tested my patch on top of qcom/linux for-next (3e6a8ce094759)
> which now has your fix, on a DB410c with HDMI display and no splash
> (which seems to be the default using the Linaro SD card image's LK),
> and indeed it is fixed.
>
> I assume you already also did the same & are okay with this going in.
> Appreciate the testing!

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested on RB5 and Dragonboard 845c (RB3).




-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

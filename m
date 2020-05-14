Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C51D3664
	for <lists+freedreno@lfdr.de>; Thu, 14 May 2020 18:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EA16EB80;
	Thu, 14 May 2020 16:23:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4B46EB80
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 16:23:44 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id y25so1523569pfn.5
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OqjZEsENiuJ7Z2+zCW9pzRm/SY0vcINZf6TSPb9wFL8=;
 b=T5HS0B1fvJofutv3NJqUrbAvHVxEP8Z/4pbg8rWnyUbriguTHHrLowQ8XSkvu1D4nb
 CKxxadhSnrOhka8fhDtg4GRuLt/M9djey/HD7gL8AniRdx98Ev//amZicIk25BLCfDDp
 gSMyC2uil/ZYl+myPhupP0IWuS1OqIEI9X8ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OqjZEsENiuJ7Z2+zCW9pzRm/SY0vcINZf6TSPb9wFL8=;
 b=pv5Pf6896mmOQ4hDQUDejgQ3ZdaWMnv0IgqjfQhdeOg5y7TZm1uQNf7obMS9mJVbXp
 FEJhqoXd5dPRn8NZo5U0imbz91qX9vgMo9qYwScyCp5tZXGwtpJVIisA0mVWA2UqqUtM
 BWJef6UKwWJw+bWBV22026doISK3xKHiSu3ZkzHr3arwGypP8indbbOUTAAGtOdlLY0b
 qt6IsrG2086vbVt+zAK7IOkPZI0WK8pppw5j+ayoyzoxkwCeV+bXgnPZvFUv9Y6nZ7ZF
 yluKBDKOy1eeyqzxibkV7egBRxszQpV23P7qoYeNsBGAjgkuI1xATH6mf1eCbIDG/NF5
 iv/g==
X-Gm-Message-State: AOAM530r5s7OhAVNf10SSnkKYNfqIjtaJAqOCOWQ1L5U9GSuLo/muNy/
 ywY00eaSF/JAEtS3w2lDBvAREjCEBW4=
X-Google-Smtp-Source: ABdhPJysjpvk8SRgXPN3af+hoWivDIc3Agm3oBmqtGiUkwazqOM1+oqxybfGRDPx8oiAWLLHhjJk4w==
X-Received: by 2002:a65:5781:: with SMTP id b1mr2170241pgr.388.1589473423954; 
 Thu, 14 May 2020 09:23:43 -0700 (PDT)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com.
 [209.85.214.175])
 by smtp.gmail.com with ESMTPSA id 1sm2672247pff.151.2020.05.14.09.23.43
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 09:23:43 -0700 (PDT)
Received: by mail-pl1-f175.google.com with SMTP id m7so1350211plt.5
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 09:23:43 -0700 (PDT)
X-Received: by 2002:a1f:9605:: with SMTP id y5mr4360665vkd.75.1589473046623;
 Thu, 14 May 2020 09:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 May 2020 09:17:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
Message-ID: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to force suspend on runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>     _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Changes in v3:
>  - Use force suspend instead of managing device usage_count
>    via runtime put and get API's to trigger callbacks (Doug).
>
> Changes in v4:
>  - Check the return values of pm_runtime_force_suspend and
>    pm_runtime_force_resume API's and pass appropriately (Doug).
>
> Changes in v5:

Can you please put the version number properly in your subject?  It's
really hard to tell one version of your patch from another.


>  - With v4 patch, test cycle has uncovered issues in device resume.
>
>    On bubs: cmd tx failures were seen as SW is sending panel off
>    commands when the dsi resources are turned off.
>
>    Upon suspend, DRM driver will issue a NULL composition to the
>    dpu, followed by turning off all the HW blocks.
>
>    v5 changes will serialize the NULL commit and resource unwinding
>    by handling them under PM prepare and PM complete phases there by
>    ensuring that clks are on when panel off commands are being
>    processed.

I'm still most definitely not an expert in how all the DRM pieces all
hook up together, but the solution you have in this patch seems wrong
to me.  As far as I can tell the "prepare" state isn't supposed to be
actually doing the suspend work and here that's exactly what you're
doing.  I think you should find a different solution to ensure
ordering is correct.

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

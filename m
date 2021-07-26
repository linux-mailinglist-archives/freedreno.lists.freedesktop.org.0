Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426C73D6736
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 21:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F366E833;
	Mon, 26 Jul 2021 19:03:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5360F6E25B
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 19:03:44 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m13so17294755lfg.13
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 12:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=14vdBBpljswALd6WKvqBt7tFyvQ5ydfoUw2eohntOGo=;
 b=qr/oz3dOYzpxblqZamgqeUQV67KgrORlntTWUQXhSAVTTuudpwKAHkt0Njz8IWdCa5
 tFmKUy6vgWUzhEWiYjj9VHpn218PYKvboIGwLPwgATII1NluyNvG3sLr8WqkOPUegSn8
 1DLx7OTUwasmBowM8A3ZxfWCr7JyjT2BetV4TBOgULIR13lkYUqVU4YgzLt5kGrzrWc4
 pbpZgQhfuQcPneenrAeRA9mjOx+sz5Xzj3nYbQaNkg9+ZpZKmfrsmVMqX8OG3YTksYjx
 0FisoIpgnLvb/c2KKdLHUdYC318jJw3FlpsnDSD0niHtYIsyHRnPCZhQJ1joZYJ2AFFu
 L52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14vdBBpljswALd6WKvqBt7tFyvQ5ydfoUw2eohntOGo=;
 b=GxPj6g25w2RHvd+4gDiQIdV50B2UtQ+bKsIuH6rXNt9IoYdVk8RPmuiaZO5vewAjk7
 CTctt7839qOq0TJV+5HXeDnMfwzfLPPwEUJ46zXhNKbVAoZCTYvlY9vlRDFioKU3Z4WP
 +2zVKiagIBUyLEOreTLqOKJQILwr1sj5YAgRrJ57gRNOrN3azq7bnbxPWTG8sUssYQJ4
 4Ao/PJ49im0GVemi1iOXivIiT+J4EnCJnCHKl2byNc1cVEu1yitAO5z8Pl+jNj3mhMkr
 LLe6ypdbIfonQVygfqOzrevQaBsT1LHmTOWmz68dbzjLO/4V34Km8xHRNwKH6KZ6xoxc
 1knQ==
X-Gm-Message-State: AOAM5327/QRYLbm4I1JgnmT0/2vrMJqPKPfECYwO3PxNmtsap9wxWoGB
 t41z10Cmt+ncGY9s7XDqpuVpA9cUj6LW1vgA0fsorQ==
X-Google-Smtp-Source: ABdhPJxaH39aX5F+AW541px6IFsSJ4Z9AkqxaTvrVN21I+A8CZpuVp2u0lP5Jp+e5r6g4ryqUw8a/GHNku+u6Tk+ckI=
X-Received: by 2002:ac2:4a66:: with SMTP id q6mr13551699lfp.204.1627326222269; 
 Mon, 26 Jul 2021 12:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210707180113.840741-1-robdclark@gmail.com>
In-Reply-To: <20210707180113.840741-1-robdclark@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 26 Jul 2021 12:03:30 -0700
Message-ID: <CALAqxLVLV8cLVTOFPZmzKeDaG0qFoQ6H=+2a8LaAvgs+4EYMfw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix display fault handling
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 10:57 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> It turns out that when the display is enabled by the bootloader, we can
> get some transient iommu faults from the display.  Which doesn't go over
> too well when we install a fault handler that is gpu specific.  To avoid
> this, defer installing the fault handler until we get around to setting
> up per-process pgtables (which is adreno_smmu specific).  The arm-smmu
> fallback error reporting is sufficient for reporting display related
> faults (and in fact was all we had prior to f8f934c180f629bb927a04fd90d)
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reported-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Fixes: 2a574cc05d38 ("drm/msm: Improve the a6xx page fault handler")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> ---

Hey folks!
  Just wanted to follow up on this, as it's still missing from
5.14-rc3 and is critical for resolving a boot regression on db845c. Is
there anything keeping this from heading upstream?

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

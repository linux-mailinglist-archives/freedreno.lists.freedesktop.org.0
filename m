Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262C4323FF
	for <lists+freedreno@lfdr.de>; Mon, 18 Oct 2021 18:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02E86E073;
	Mon, 18 Oct 2021 16:42:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61176E073
 for <freedreno@lists.freedesktop.org>; Mon, 18 Oct 2021 16:42:49 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r6so860853ljg.6
 for <freedreno@lists.freedesktop.org>; Mon, 18 Oct 2021 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dgwWr3BXdTwUC0OrGuOgT8cS3CjgXPDui5v0oZBimWw=;
 b=j5j2m4OsgxsL2ElnGTkxunX1vf480gdCZWPnVSX5PsnMbjz3K+UnrJ3ky4IQhFOM62
 3ugYm7QBA1+1fKxqjagvX3O9gMkElc6Lz1V4k0D9kxvlhh//EJKzEYAKK2qDosxxGaIA
 Cdb9iFiBi8nXl6UJTewq99KHqloPeOC5Bd9O9XWXI/DmB45nCCAJigeazo3RzU6oxNbI
 JPPqJmjZ3WTMJC8CLDk+eldymAz6IL6UGhj4VvM3mcdfRD+PFBeggPMjSl5ZRxq57/vf
 nAaBK1y5gv/EHacIIHZmuwLROHizMmABHqumEsCRq0dM/WgVU9NNXQ8QQV7xry1ZEJTb
 Jt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dgwWr3BXdTwUC0OrGuOgT8cS3CjgXPDui5v0oZBimWw=;
 b=gaU/M8QcLSqCzvLUArDYrvNku/PclDpf4LbUMR4FTM9zpE4okcj/NAweVOhi7OvPE1
 PbSnkeFJBamYeAzckjj6hTAQ075YYS/jLi5g/u5qBSV26YZxDVmtTKcTXrlVmZPcxzp4
 FJPHhfOuiXfABxJsbsH5bPOrQunxkLYpAVNlHb4+YCvW86ZWSS3eGqFHY8mbieod/gsR
 VLKgC4TeLA3UHbzlNM8O1m8ezIcRLbgcEXxBOrAzs6nP/FHZ+AMfiJrKe0/UJadAgrIm
 26wLrPnu+aJLNNyTls2E7m0M43B7OauL9iogyZ1wda99CV9bxv1hV7tkSg49Zzxki7Up
 NiMQ==
X-Gm-Message-State: AOAM530mK9IMDrpeaoQe5bMoBOesAEHe9ZEuK3+Cm3FFnLAMwQX/cR3r
 dkMzgQWzg9oeXN2Ey9pOBUCD0YqRP0FC8mXETUPHvw==
X-Google-Smtp-Source: ABdhPJwnHe4vWrE0K3Wm0c2Rfoo9x9QZhO1oxkDeBbktqaK53ENKMBgbVLMJfggxzoMrl5SYEGZkxiz2RQIRstjni2Q=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr865105ljq.61.1634575368092;
 Mon, 18 Oct 2021 09:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153627.2787882-1-robdclark@gmail.com>
In-Reply-To: <20211018153627.2787882-1-robdclark@gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 18 Oct 2021 09:42:36 -0700
Message-ID: <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <akhilpo@codeaurora.org>, 
 Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Sharat Masetty <smasetty@codeaurora.org>, 
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, 
 Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/devfreq: Restrict idle clamping to
 a618 for now
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Until we better understand the stability issues caused by frequent
> frequency changes, lets limit them to a618.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Caleb/John, I think this should help as a workaround for the power
> instability issues on a630.. could you give it a try?

While I hit it fairly often, I can't reliably reproduce the crash, but
in limited testing this seems ok to me.
I've not hit the crash so far, nor seen any other negative side
effects over 5.14.

So for what that's worth:
Tested-by: John Stultz <john.stultz@linaro.org>

Caleb has better luck tripping this issue right away, so they can
hopefully provide a more assured response.

thanks
-john

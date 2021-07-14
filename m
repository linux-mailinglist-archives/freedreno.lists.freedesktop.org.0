Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04563C9333
	for <lists+freedreno@lfdr.de>; Wed, 14 Jul 2021 23:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC176E30D;
	Wed, 14 Jul 2021 21:39:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551F56E30D
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jul 2021 21:39:32 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 j4-20020a4ac5440000b029025992521cf0so995717ooq.7
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jul 2021 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7yU/lXVPq8v5DxUavviakd+XqTwyKh5GL+eckjJwhhU=;
 b=Huzsn41/m5wNJTthgcAkHFWvNusXC97KqI0iRCAyi4I1V8yYIvTOhj+iZO052RBDgY
 /jxRFEZK8vH/CEYJ5CnaKLfuPND5/1DeDeNXoS5qhh5axGrqcLRDIAgCJvKCy8aLX8g1
 uCSMpbZnly1BXgEIB0LWc1Jh/Ao6j+lmqofVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7yU/lXVPq8v5DxUavviakd+XqTwyKh5GL+eckjJwhhU=;
 b=CUffa9f8n3svyHKtUxK4pRlspiIYugPAX8l4kNqHg1cRtwtddmQfQItTNh5nZeB1Lb
 nK6tAblq+B+9/mLKvMaQrf359PPCsaRTNsb9CEyLOg72VFMW8G+UB34DZibG8du4rHiL
 i3A/eqgDk9mhrndqhyjJkCXP6HygOOEZOioqC2ZfOsL7JMjQzxcOiCNMRVPofQ53Qe0e
 1B5m6Nhsh0uygM8GGuCo28+jrAYR80doohihr/SLbnspirWa2ixbZMI8B8bLWpPnlTTt
 WpGmQAfw6D78mcXxxSYzSrGKblPJWgflRqtV8QXtxwrAI/OSeEqReGjboLCMej2ev1W3
 OPyA==
X-Gm-Message-State: AOAM533JekCXTul0acv6cG3f1c75iizKDRTVZPnNzNLmrt+IOBGTr2RZ
 MAJqYs6eFoglbVlMxbabZnnKas75p7jSZvRQEY+tJg==
X-Google-Smtp-Source: ABdhPJwE2R3+k8+ce7HwbkPywG7nnMFEF4vtMpBltJIbIWP52CkUWZLrAOaoBO6XdJi33DjezNuNWFNaiYMAd18hPNU=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr17846oot.16.1626298771497;
 Wed, 14 Jul 2021 14:39:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Jul 2021 23:39:31 +0200
MIME-Version: 1.0
In-Reply-To: <20210709024834.29680-1-jrdr.linux@gmail.com>
References: <20210709024834.29680-1-jrdr.linux@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 14 Jul 2021 23:39:30 +0200
Message-ID: <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
To: Souptick Joarder <jrdr.linux@gmail.com>, abhinavk@codeaurora.org,
 airlied@linux.ie, 
 chandanu@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 khsieh@codeaurora.org, robdclark@gmail.com, sean@poorly.run, 
 tanmay@codeaurora.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Remove unused variable
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Souptick Joarder (2021-07-08 19:48:34)
> Kernel test roobot throws below warning ->
>
> drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
> warning: variable 'drm' set but not used [-Wunused-but-set-variable]
>
> Removed unused variable drm.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

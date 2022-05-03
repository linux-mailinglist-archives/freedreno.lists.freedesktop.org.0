Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902A517B83
	for <lists+freedreno@lfdr.de>; Tue,  3 May 2022 03:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C975D10E09C;
	Tue,  3 May 2022 01:13:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A0710E05D
 for <freedreno@lists.freedesktop.org>; Tue,  3 May 2022 01:13:31 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e5e433d66dso15919183fac.5
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 18:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qclzEzb88Rc+t48ko4XJR5J/G6hNGvffLYAtLNLjtGg=;
 b=oMv1VPZrM/ZMi0f31QB0gucXh6+DhBnn6+/swVv6D98hjF8pWpFV/xn5gE3d794mEC
 xObGXS8eh3MuWnUQHgWMshigJKgs98S9V0q5/CrKww50GnqZclCKCDZCXv+QI3uY6/R1
 irOU7irFy7w78/DZbonvKxn9PXcauIBf0eWqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qclzEzb88Rc+t48ko4XJR5J/G6hNGvffLYAtLNLjtGg=;
 b=5P5u3Fj2Lg/YKITnyysuGLmSiNFkMJK7FOo/oNCQ4j+aDr+qri4bOdNRSKLVIXjJrG
 1kvxMwKWXMEZkQmN7+sah3agHQR7+4/oVzssrumncCdrOt5jeQYp0sVySmhG63WcxdsJ
 jNJUR3GjD23DMYq2blSENTwyCMWrxVm6iGp3KkHHlumxzRmCzRa8x6qF4ikoPOMvRgeU
 rVJxywHRVXv4a01r5O3RzG8FdMKcMj3RFBmpoX1MKdev1zrW7WM73mnnMnBo/uy3DUaO
 w1NftCrn/n90ioQdS2HrodXMoUINQoMZqp/S6b1BjVMh/1ID/eItPTObVpiHL8yCXbBk
 Zlxw==
X-Gm-Message-State: AOAM53330CThmGVaVaWdR+LUbe6PEpNIrPQdbnrAra1gAgozWkK26l7p
 2lzbRZ/DtuTYvTZfQ8TLeFyfsg6sS3kzMYo+q9vLEQ==
X-Google-Smtp-Source: ABdhPJwH+KZOm2Y5mOS6pSMlAX2uuDmmCWPtK1tWF+fVhA7rmbH21MIi1mlPWosYQGBdHKh+DYu5bVsrhYOdvZpQNY8=
X-Received: by 2002:a05:6870:40c1:b0:ed:9a12:3f95 with SMTP id
 l1-20020a05687040c100b000ed9a123f95mr806123oal.193.1651540409644; Mon, 02 May
 2022 18:13:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 18:13:29 -0700
MIME-Version: 1.0
In-Reply-To: <1651532668-18873-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651532668-18873-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 18:13:29 -0700
Message-ID: <CAE-0n51TjqYKzPbP7JHKi+ostwM7Q8FX64eC3Gufuz846mLA3g@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: fix event thread stuck in
 wait_event after kthread_stop()
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-02 16:04:28)
> Event thread supposed to exit from its while loop after kthread_stop().
> However there may has possibility that event thread is pending in the
> middle of wait_event due to condition checking never become true.
> To make sure event thread exit its loop after kthread_stop(), this
> patch OR kthread_should_stop() into wait_event's condition checking
> so that event thread will exit its loop after kernal_stop().
>
> Changes in v2:
> --  correct spelling error at commit title
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 570d3e5d28db ("drm/msm/dp: stop event kernel thread when DP unbind")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..5200a58 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1106,12 +1106,17 @@ static int hpd_event_thread(void *data)
>         while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
> -                               (dp_priv->event_pndx == dp_priv->event_gndx),
> -                                               EVENT_TIMEOUT);
> +                               ((dp_priv->event_pndx == dp_priv->event_gndx) ||

Why the parenthesis (before and after)?

> +                                       kthread_should_stop()), EVENT_TIMEOUT);
>                 } else {
>                         wait_event_interruptible(dp_priv->event_q,
> -                               (dp_priv->event_pndx != dp_priv->event_gndx));
> +                               ((dp_priv->event_pndx != dp_priv->event_gndx) ||

Why the parenthesis (before and after)?

> +                                       kthread_should_stop()));
>                 }
> +
> +               if(kthread_should_stop())

Missing space after if

> +                       break;

Is it possible to move the wait_event to the end of the loop and always
run the loop initially? That way we don't have to check for
kthread_should_stop() again.

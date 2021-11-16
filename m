Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49539451FF4
	for <lists+freedreno@lfdr.de>; Tue, 16 Nov 2021 01:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3CF6EC74;
	Tue, 16 Nov 2021 00:43:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9AC6EC74
 for <freedreno@lists.freedesktop.org>; Tue, 16 Nov 2021 00:43:24 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id t19so38616383oij.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Nov 2021 16:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AR+MJXQt1hZ4ak+KffeN9j/qO8HcFtJTxsTibtq8SN0=;
 b=OcKmfLQ8A9BF4S3di4lz4OZXJGUTA4mbSUlF7s+b0wJ+grSJIRm0i7Ca1yMgwNY2g8
 70uW5S/5kzyfc1VQ8Ov++7/+Wf/wwIurMBsGC3VDQ7uOz30vQJ8ca0/iDQhvQA8YU7oX
 rWRos7i6GY4nzLNbDZkm+x0eFcNMhKjkB3BMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AR+MJXQt1hZ4ak+KffeN9j/qO8HcFtJTxsTibtq8SN0=;
 b=Esxtsfv5sY0K7QyA+tkIuA5FgtrGM/yG8Y4s5GRw+pSsG9/YodzXNPG6SRiCAFez8L
 S01l2zDBmLRrN7WzR64Gcb+8McyIFx9KjtYxomCYujN9KBDGH7u6vfmDVWItObJXdPw5
 4FUfc3K9EqvHNXPfwzWSChQnsZpLlvnGieKmJgfbakzCsjWfGJntzyndeIc7fFlh9kkL
 2N/dgcX+BF+DDUuA5zkPoqXg+EE6AagaYoZQT3SMt8D/Pt7CP/o9BWzSmJF9nSwbjFsn
 imc4TvaMvy1yJWCVZRbPs3AkJBBHOp/s5DR6qf5fZvJ5/+mwPrD1rsYQ4d+lw88QGjJP
 4ppg==
X-Gm-Message-State: AOAM5337RSIWqIZ6ghG4cxHaOOrbi+am955p/LrhBS/EcK3XGwtl74cj
 GZBQ+Sl4Y7bZ4aOK8OkZHTVMYUxvh5YBp+IvWgvZbA==
X-Google-Smtp-Source: ABdhPJz9z5atxroq/GjxihboHlC2x5PboGmywHnjxtnAjxqEQZyoBJQEvr8K/IKhil58m74mic8cKR+6S4n+PtT7tBE=
X-Received: by 2002:aca:2319:: with SMTP id e25mr49152738oie.164.1637023403674; 
 Mon, 15 Nov 2021 16:43:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 16:43:23 -0800
MIME-Version: 1.0
In-Reply-To: <20211110120512.150940-1-deng.changcheng@zte.com.cn>
References: <20211110120512.150940-1-deng.changcheng@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 15 Nov 2021 16:43:23 -0800
Message-ID: <CAE-0n50=P06ByQrG0FixVK4cGW--Vgt6uwGsLUu792SPhqzqXQ@mail.gmail.com>
To: cgel.zte@gmail.com, robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH linux-next] drm/msm/dp: remove unneeded
 variable
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 deng.changcheng@zte.com.cn, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2021-11-10 04:05:12)
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> Fix the following coccicheck review:
> ./drivers/gpu/drm/msm/dp/dp_debug.c: Unneeded variable
>
> Remove unneeded variable used to store return value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..c5c75273d1e5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -365,7 +365,6 @@ static const struct file_operations test_active_fops = {
>
>  static int dp_debug_init(struct dp_debug *dp_debug, struct drm_minor *minor)

Would be nice to make it void as well and then cleanup the caller. Can
you do that too?

>  {
> -       int rc = 0;
>         struct dp_debug_private *debug = container_of(dp_debug,
>                         struct dp_debug_private, dp_debug);
>

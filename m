Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE2425B1A
	for <lists+freedreno@lfdr.de>; Thu,  7 Oct 2021 20:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140FD6E580;
	Thu,  7 Oct 2021 18:45:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF16D6E578
 for <freedreno@lists.freedesktop.org>; Thu,  7 Oct 2021 18:45:57 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id o83so2854155oif.4
 for <freedreno@lists.freedesktop.org>; Thu, 07 Oct 2021 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rDadMTPT7yyY7zuLSmBvIb9W4n6qJgK6CHOiJKi6wrU=;
 b=dGQk+EoGS93Xn4qHMUWC9fqgM3FVdBsK9PkC29RD2iUQAxVVP7KAoVKjv54fxqJkzN
 KJ6XZoKXFqaMjVMMXW/jvz+J9W1IqQ5VApJlrWQkwHn6KQ7MsGCQAvRSpkg4qcWbAKMa
 rUz68kF/gjv8BKru2E0qaN98F2fgjgIEGBS7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rDadMTPT7yyY7zuLSmBvIb9W4n6qJgK6CHOiJKi6wrU=;
 b=dh/H8ssrllZiIgfWP7flxmHZBRK9ht+r3M7KPT+huOTJ6x8zrf/V9thV/eD5awwo/q
 qyvTtDvxdEPvA7lAMsEoJH2S76fym2qNLn8FjpKpweBlVOH1c9kctdwqqyzlgBvJoTHK
 kGds/VfbqJi0HMoKX7D9FVYc64JMday/D4kaCKMUGAYj7E1BTihm0U3Jd2EDm5MIMo76
 fvoCqTEPUNhS0tdSxe97EaccFE1cGcOFiORggq0BPi/jD7RtWFWi8ZbCNvM1hMgIPu/P
 +w3YOFWl3zgYLlh8s1vp+/RuKt54ZI9v7XMLELUfKzxQQjw41J+vZRTgOm+4CmSk7cx4
 B2IQ==
X-Gm-Message-State: AOAM532JbXZNVL1btUv9ynYrkQWmso/tTHAJdad8Bo0qpO02f0dCueeg
 SBSAYENNsS4MVYLan0lS/mkSoy7xPgi40CaVdUjTpw==
X-Google-Smtp-Source: ABdhPJxBJsyd0RzB+el+45iuDcFtlkQElBx3yXG2b/lZ0Xu1oExh/Yl03jChEI82FDGbQZVvKT7JtH8AKdJBrny2ByM=
X-Received: by 2002:a05:6808:f8f:: with SMTP id
 o15mr12980586oiw.164.1633632357140; 
 Thu, 07 Oct 2021 11:45:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:45:56 -0400
MIME-Version: 1.0
In-Reply-To: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
References: <20211007183341.3140281-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 14:45:56 -0400
Message-ID: <CAE-0n53LwqpTyxrRwwEiJQVpKgS4QVNuQFz8WD1VfR=s4eHWoA@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Simplify the dp_debug debugfs
 show function
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

Quoting Bjorn Andersson (2021-10-07 11:33:41)
> The "dp_debug" show function allocates a buffer and piecemeal appends
> line by line, checking for buffer overflows etc.
>
> Migrate the function to seq_file, to remove all the extra book keeping
> and simplify the function.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dp/dp_debug.c | 161 +++++-------------------------
>  1 file changed, 24 insertions(+), 137 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 2f6247e80e9d..566037942343 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> -static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
> -               size_t count, loff_t *ppos)
> -{
> -       struct dp_debug_private *debug = file->private_data;
> -       char *buf;
> -       u32 len = 0, rc = 0;
> +       struct dp_debug_private *debug = seq->private;

const?

>         u64 lclk = 0;

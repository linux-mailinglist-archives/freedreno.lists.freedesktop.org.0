Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1827A26B
	for <lists+freedreno@lfdr.de>; Sun, 27 Sep 2020 20:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A67589E2A;
	Sun, 27 Sep 2020 18:55:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4060E89E2A
 for <freedreno@lists.freedesktop.org>; Sun, 27 Sep 2020 18:55:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x23so4321752wmi.3
 for <freedreno@lists.freedesktop.org>; Sun, 27 Sep 2020 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=brvQm4unB3hIW5ks3wpg170xx2FM0HklqjhCrETMSNw=;
 b=JFzdOJLTF1KRTT0oZdkxEw5FHIUmpAjxRb6c+ecTjVsE1za0CU4dvy8wHmdQka+QCy
 2IhVbXv3DBsE4a5Wjm4vQR6v5LhmaFd+Rncmw3nIY6ES7Ta9Cg6mMB2hOtrDZXppot7W
 RPe6NHvCxSOgwhWZeFKN6b0FdYiZ3CQwmLfcU+VzOjo/YWrh0mMTg/5MFX3rxZJuwKRY
 jGBPj0D3rl9Sf9sBU3Z0vjfDmzXA51ER3Wy1e+g2kj8qGivJc8QIKEVoV9Hg0OGMMgr5
 6WmwiBwi03iYpYXjbIR4+CTzk6pq4wbDrwFQIXOTz4LKcGWd93dVAc1uMRCLQQlJ+dbP
 DsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=brvQm4unB3hIW5ks3wpg170xx2FM0HklqjhCrETMSNw=;
 b=T1HYUlB7nZwQxMfn2HVmnKJQWfJ2YFG1Lb3zQT7SDZCRD04nIyQNM5tmOdsojuaNPd
 ELI1SACf+EH0ObIyu0vJs4W0cya3/YjiB1/P25KzxeVScbdljA2WaMubHwIlP9Jizwg/
 i0QqzrBytcCSrWXYzA7dQkGMuVBwntwF7lrzcB4/zRpVImdimwSeBE+17RwTzJH8ErCn
 gMUaazi2Vil7Yx5aPi8m24gtHQ+BWuIMO9KvTvV2RLRTVfcQyie/QNekBzR9yDd9s75w
 bIh8sl0XBi+rS8qhpKLPq0LZf/GREyL/qZl9p2vMjRN5zG1Gd7nlhvNxETdAtg/NGsTa
 4xug==
X-Gm-Message-State: AOAM533tbxZP+87LnbZ/SGZKYBZDbbhZaa7p9FR+E6sGKW3jX2swRhrq
 O1+2JyrMLJpMcEhYzvo1YCUW1942yCugrLxVKDQ=
X-Google-Smtp-Source: ABdhPJyciMQiTeNvYglZLOHS2eTlNWi1mE4u3Eejs/H7XAjuqgHYQE8Xqkj+zDqXIj5Sr/dWauhAxw99yHdJ8k5ebFU=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr7872233wmg.164.1601232899846; 
 Sun, 27 Sep 2020 11:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200926125146.12859-1-kholk11@gmail.com>
 <20200926125146.12859-7-kholk11@gmail.com>
In-Reply-To: <20200926125146.12859-7-kholk11@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 27 Sep 2020 11:56:03 -0700
Message-ID: <CAF6AEGtZhnWqzP4YAh-zBX_kYXZWWx6a_deV8ONHfQ4af394ew@mail.gmail.com>
To: AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: Re: [Freedreno] [PATCH 6/7] drm/msm/a5xx: Disable flat shading
 optimization
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
Cc: freedreno <freedreno@lists.freedesktop.org>, marijns95@gmail.com,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 martin.botka1@gmail.com, Jordan Crouse <jcrouse@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Sep 26, 2020 at 5:52 AM <kholk11@gmail.com> wrote:
>
> From: Konrad Dybcio <konradybcio@gmail.com>
>
> Port over the command from downstream to prevent undefined
> behaviour.
>
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index b2670af638a3..bdc852e7d979 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -759,6 +759,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>             adreno_is_a540(adreno_gpu))
>                 gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
>
> +       /* Disable All flat shading optimization */
> +       gpu_rmw(gpu, 0x00000E60, 0, 0x1 << 10);

Looks like VPC_DBG_ECO_CNTL.ALLFLATOPTDIS (based on downstream
41582a1f24d2961094c556db788028b433d8476a)

BR,
-R

> +
>         /* Protect registers from the CP */
>         gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
>
> --
> 2.28.0
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

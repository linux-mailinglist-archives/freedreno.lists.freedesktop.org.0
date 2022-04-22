Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909CD50B56C
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 12:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5499110E16F;
	Fri, 22 Apr 2022 10:42:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DED810E029
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 10:42:08 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id p65so13708856ybp.9
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sRlCrOg5yqyYWcX3Vmg+YXtz00jXFt02K1SvmfVHuEo=;
 b=YZKNNVCdCW1H9YpHWN2WwcXTeHpzenuCACQWt1cFsofkPWDjj+CZhGo5qBz34bXMrL
 a8sGChDb4rj11K4jsnxJQrpcCmi/sg7315+vVhjz+9kcNVq0RLVpAunksA3AeNO7kccO
 QnNI74QbFKhy8/7Hn2169LoSjveGvAA/Z6ar8aCW0HQP89inqH/9L9x7cFs3j0YJMi24
 Vjl4hdYaqEQWvZhlLqiDMVG79bCKBj8oRlloEsu3mrlqK7q7t842V9yGwDbx4guv3qh6
 zSgBtiXdqIR3W3Eg+4JrHKGcvBwnvXDx2oadjegPOLpPoCnkhqXvmyP5PynUzjZz/MkE
 hD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sRlCrOg5yqyYWcX3Vmg+YXtz00jXFt02K1SvmfVHuEo=;
 b=NLiUI8+Ylj8QteNLCf9FJh4hr22dh5cUwQOVjy6CVVCAUIKJ9YPoxSCUCoDwIavxJw
 o4zIVZcGLmL9pnA5D0PY730fQGND8m9QBN2OiIvwQlKw/DGFo2RPFa3IrnbghOULMvue
 BPMIyQ7K4P2UVxPkwAPxwF5LnGqqt5t5PA5OnA6InHZv/ns6rOVDW+pXWc8+PQb6ybxD
 qt//f2320sEPiTyGpVk9uOpVE+w3MDqS6vnn4btYGYrJx97Ahl81Jpb+3rbDho5rm82U
 yJ4Qdt8QnBh9YVk2X4x3dm9sN/IQSEL4igzzMYpPTYKNjao6LybOzLMT1ur60QG6/+RH
 MvCA==
X-Gm-Message-State: AOAM533+yzq/z3mz8e/j9MnETdNYt7wZj2wMdv4KJrc7V1z4LtEAue/S
 W/kTzB+8xd/f/FdUj0MLUBDPtL2fJJwD9170ScRGDA==
X-Google-Smtp-Source: ABdhPJy+O9d88W+UfOJ7vyvqvuTfKHdZH3HhJTpSFNYmS29n1nw7GUb9A4Lca7pUm7kxAmK0DqCAl/r83g43Qgqyask=
X-Received: by 2002:a25:d507:0:b0:63d:a541:1a8c with SMTP id
 r7-20020a25d507000000b0063da5411a8cmr3865477ybe.92.1650624127547; Fri, 22 Apr
 2022 03:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Apr 2022 13:41:56 +0300
Message-ID: <CAA8EJpqJrWpRo_DJJdJqSMyDUyJJt3L3S7dNuWw6YeQgsp+TkA@mail.gmail.com>
To: cgel.zte@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, bjorn.andersson@linaro.org,
 daniel@ffwll.ch, quic_khsieh@quicinc.com, sean@poorly.run,
 Zeal Robot <zealci@zte.com.cn>, linux@roeck-us.net
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 22 Apr 2022 at 11:50, <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>
> Fixes:  8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a42732b67349..3926d2ac107d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1239,7 +1239,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
>         dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> -       if (dp->irq < 0) {
> +       if (!dp->irq) {
>                 rc = dp->irq;
>                 DRM_ERROR("failed to get irq: %d\n", rc);
>                 return rc;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry

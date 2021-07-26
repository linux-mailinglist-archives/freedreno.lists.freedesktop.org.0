Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA77A3D6A09
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 01:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2B46EA30;
	Mon, 26 Jul 2021 23:12:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D6C6EA2C
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 23:12:00 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u25so12944513oiv.5
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zWSSKS52Tw9EtPDJPZFp6PDF18R8QEjzi4tDc7XTm68=;
 b=D2vVl3wynPvKcvYJD6/6Cg2607VClmCtm2IPScqheq0f5JxJNEGst14VcHoB07puIg
 1b1PbQWIblkc7/QWlhXiZODyt7GRtIsgt123Pl/WlMIvrAljZJ/ku5IY6ivdeLL3N3LY
 KeS4i5vTk7PQcZi/z6eImNYdQ7mKBhZdA9LSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zWSSKS52Tw9EtPDJPZFp6PDF18R8QEjzi4tDc7XTm68=;
 b=VW21AfXAFL+vBACrEeqrJRCuCp7JiJerUfDZlg35/y2JuISCefIvWBMet6DVKmyMpU
 xUOFOK+UxoYYvhKc4RBoLoJVrS41TMa1aYPrceP7nNtrV7NDFVHn4QGxv4sDAEPQZucI
 wRw4mR/mPk580rt9zFZIt7oEbp1EB6kCQiY1mi6s+Vh9IaCxOZ3ow06d3dxbfKJ8Gikx
 dYOWmymmhD5azKQ1KXk5jkMaGRgKynLawalXLunCmyN+jRbqs8+FIXdCsOu55V1ivNRj
 FavOT4gVgtnGg1tnIKtc/P6GmwtdoG5QmAEpg5RtZZMjLf2hAwU/kN3g51uIxX9fcN/2
 fEmQ==
X-Gm-Message-State: AOAM532OGTOoHglbgCFfJ3GhLq3MtPhe0p1AUainb3e2DB5TpccJcG9+
 6AZSjbq+zAhVqh77Ja9cCR+Iel7X8qPVHztHQVX9DA==
X-Google-Smtp-Source: ABdhPJzxz2fykuwWqicUpMoh8v2qDbIbIYvlVC/Dke+rx5LNymlZLrvW5jdDlYZckOnME3krVBJSl0qzUAsrRUYdLHw=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1030315oib.166.1627341119452; 
 Mon, 26 Jul 2021 16:11:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:11:59 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-2-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-2-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:11:59 -0400
Message-ID: <CAE-0n500_tQZK6cDfJgPWO-VWfzW3kj+oS5VEY2EOBHuqv+JHQ@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/dp: Remove global g_dp_display
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:31)
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
>
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Thanks for removing the global.

>  drivers/gpu/drm/msm/dp/dp_display.c | 78 ++++++++++++++---------------
>  1 file changed, 37 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 70b319a8fe83..8696b36d30e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -27,7 +27,6 @@
>  #include "dp_audio.h"
>  #include "dp_debug.h"
>
> -static struct msm_dp *g_dp_display;
>  #define HPD_STRING_SIZE 30
>
>  enum {
> @@ -122,6 +121,13 @@ static const struct of_device_id dp_dt_match[] = {
>         {}
>  };
>
> +static struct dp_display_private *dev_to_dp_display_private(struct device *dev)
> +{
> +       struct msm_dp *dp = dev_get_drvdata(dev);
> +
> +       return container_of(dp, struct dp_display_private, dp_display);
> +}
> +
>  static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>                                                 u32 data, u32 delay)
>  {
> @@ -198,14 +204,16 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
>         int rc = 0;
> -       struct dp_display_private *dp;
> +       struct dp_display_private *dp = dev_to_dp_display_private(dev);
>         struct drm_device *drm;
>         struct msm_drm_private *priv;
>
>         drm = dev_get_drvdata(master);
>
> -       dp = container_of(g_dp_display,
> -                       struct dp_display_private, dp_display);
> +       if (!dp) {

How can it be NULL? dev_to_dp_display_private() returns container_of()
pointer so it doesn't look possible.

> +               DRM_ERROR("DP driver bind failed. Invalid driver data\n");
> +               return -EINVAL;
> +       }
>
>         dp->dp_display.drm_dev = drm;
>         priv = drm->dev_private;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

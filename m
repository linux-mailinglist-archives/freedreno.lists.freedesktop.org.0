Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5F34234D8
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 02:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067626E47B;
	Wed,  6 Oct 2021 00:15:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FF36E486
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 00:15:33 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 o27-20020a9d411b000000b005453f95356cso97186ote.11
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 17:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9tzMxEXeRZ9vZ6WKGHD8GdqG31K/v2rLyNRBux+Swf4=;
 b=OQygNhVVehGtg+wS+bXFa/5K4w+jHJ8XiWZZc9xqBeysMV0N1n9NlIwDng1+Cojt5u
 TRNVm2MYGpXYZIg/Z4wzA5EMFkwgvIy1kC8LA8oorAxOy3dN7WqdJT8YHWrb0mhSPmlt
 pOVWRrrO4p9IeMsttWIJAuM9EAtEVukvZfZP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9tzMxEXeRZ9vZ6WKGHD8GdqG31K/v2rLyNRBux+Swf4=;
 b=5+ijw6riFo/HbJB7NHbh7dsnkOUMYTCxhprc4QMHUYgUcZIFC4f9FRz3NR7O03dj+c
 bGHFJxnmYEBNN547k1L8uku6NTsJHd0mgoBdHt4ty8RzHJMoFrrt71ohfA0xJJk5TLrY
 hJky2XfFaIJ9Zan1rQ2koWbWYPIJ6AqiQqkNoL/p/X7aIG8U692/DAaICSHmDhYaRFOW
 1oYVhigQB/uTrPlgX37+d7XTmEoKXSkX66hKvEFkqwhexM2gG0imdaENdvTwl39T6fkH
 gtbHlpHfpgx8S8HaZ2af9b9Tjo/iGTTlDpK17cPnn6FcAYAy6qE8Zr1n4s7bYAEaLbrB
 ffAA==
X-Gm-Message-State: AOAM533hsfKDb+04Bg2zzmDVHTcDxQ9jdpl5QcENzW3tqqlw4OB2enL2
 3i88SjDw+3eQjb3VRKzbHs7hzbNraGiSLPIjiEzQJA==
X-Google-Smtp-Source: ABdhPJzSi7rJ/j68GKHBK0r+knYE/P5yBIQ/VbjAnJL7ff/zbZl98PnkJ9ta6ivRwIe2lxeGGKRz/NNCimqJP8IUsLk=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr16675560ote.77.1633479332704; 
 Tue, 05 Oct 2021 17:15:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:15:32 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:15:32 -0700
Message-ID: <CAE-0n53cQwmz2j1TDkfmt7+JLFD3QBkY8_Tb1HPALqsWJFWmUA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 3/7] drm/msm/dp: Allow specifying
 connector_type per controller
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

Quoting Bjorn Andersson (2021-10-05 16:13:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5d3ee5ef07c2..eaf08f9e7d87 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -115,8 +115,25 @@ struct dp_display_private {
>         struct dp_audio *audio;
>  };
>
> +struct msm_dp_desc {
> +       phys_addr_t io_start;
> +       int connector_type;
> +};
> +
> +struct msm_dp_config {
> +       struct msm_dp_desc *descs;

const?

> +       size_t num_descs;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +       .descs = (struct msm_dp_desc[]) {

const?

> +               { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       },
> +       .num_descs = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
> -       {.compatible = "qcom,sc7180-dp"},
> +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>         {}
>  };
>
> @@ -1180,10 +1197,29 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         return 0;
>  }
>
> +static struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)

const msm_dp_desc?

> +{
> +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +       struct resource *res;
> +       int i;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return NULL;
> +
> +       for (i = 0; i < cfg->num_descs; i++)
> +               if (cfg->descs[i].io_start == res->start)
> +                       return &cfg->descs[i];
> +
> +       dev_err(&pdev->dev, "unknown displayport instance\n");
> +       return NULL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
>         struct dp_display_private *dp;
> +       struct msm_dp_desc *desc;

const?

>
>         if (!pdev || !pdev->dev.of_node) {
>                 DRM_ERROR("pdev not found\n");
> @@ -1194,8 +1230,13 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (!dp)
>                 return -ENOMEM;
>
> +       desc = dp_display_get_desc(pdev);
> +       if (!desc)
> +               return -EINVAL;
> +
>         dp->pdev = pdev;
>         dp->name = "drm_dp";
> +       dp->dp_display.connector_type = desc->connector_type;
>
>         rc = dp_init_sub_modules(dp);
>         if (rc) {

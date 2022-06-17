Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2D54FE87
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EFB1124A1;
	Fri, 17 Jun 2022 20:52:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC3D112440
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:52:42 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id p8so6715284oip.8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zfdMPFQLtynymEdExqfgDNO6jYr15Yc2szC/qTvNqXc=;
 b=FLRtbfnbWLQS1vb5eeDTBn1ifXwUDQZG1/XVUVl1FLOIJykhQJyfn+uWbH2XnzdCz6
 Ad+r59Zb4HpRB9uujT3zdjbqaYFVz9zPIm0Jkmu6Zo6vvu5Ky7sa+FObdEm1jGb/itZG
 EU+O9JqCUuVSS8JRea+QvCWY70lIFU/BSv6Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zfdMPFQLtynymEdExqfgDNO6jYr15Yc2szC/qTvNqXc=;
 b=N2cSWOrQhaVA9DBUfYMGjq9aqx336wRcYUB+iqi/xoWXDapI/JSiv7dTVBesfZOuub
 Vt/1LvzrBXRGNnHze3uH/JQc2jaXfahp1y+U5H98j2AcC3mRBSq60rOeRHmQ1d8S9o9v
 imWyxBuW+rHkMvvTuLeBk8wRL/XSYaAi85+P5WGEWGHZ28iuvGyZg9SrHwWjyldNpqXZ
 JSc8ctNlqUW1P7oR3ARSquKwIZOr3Nl4W8vBNk84ZQzHtRFeeYlzam4vjfnmnfPmCnrX
 3jraF1cI91q3s3Ojd+hpWaHzh+eMtAUIz4qzFtq+rn2WtBafUnVjoO6pXNsc6lz6vwlZ
 XxGw==
X-Gm-Message-State: AJIora/gPL8ghyuR0P4hPk8cqgcsh07DYHBDWzkJATtjhWgyX+G+jaHm
 BSJ+o2ZGp9aMAYH96hmTIEPjjj+5YjUb7QUcH/j5BA==
X-Google-Smtp-Source: AGRyM1suSR453qA+5dSch0ZvpRtGfqRjnHNr1SDHaTA+0o2m1rKfJMVWy6hbx0LHhvgcM97D2zccNi9b/DSwV0+EihY=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr6052910oib.63.1655499161401; Fri, 17
 Jun 2022 13:52:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:52:40 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:52:40 -0700
Message-ID: <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 3/3] drm/msm: stop storing the array of
 CRTCs in struct msm_drm_private
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 12:14:29)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 44485363f37a..567e77dae43b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         ddev->mode_config.funcs = &mode_config_funcs;
>         ddev->mode_config.helper_private = &mode_config_helper_funcs;
>
> -       for (i = 0; i < priv->num_crtcs; i++) {
> +       drm_for_each_crtc(crtc, ddev) {
> +               struct msm_drm_thread *ev_thread;
> +
>                 /* initialize event thread */
> -               priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> -               priv->event_thread[i].dev = ddev;
> -               priv->event_thread[i].worker = kthread_create_worker(0,
> -                       "crtc_event:%d", priv->event_thread[i].crtc_id);
> -               if (IS_ERR(priv->event_thread[i].worker)) {
> -                       ret = PTR_ERR(priv->event_thread[i].worker);
> +               ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> +               ev_thread->crtc = crtc;
> +               ev_thread->dev = ddev;
> +               ev_thread->worker = kthread_create_worker(0,
> +                       "crtc_event:%d", ev_thread->crtc->base.id);
> +               if (IS_ERR(ev_thread->worker)) {
> +                       ret = PTR_ERR(ev_thread->worker);
>                         DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> -                       ret = PTR_ERR(priv->event_thread[i].worker);
> +                       ev_thread->worker = NULL;

This wasn't set to NULL before, so is it necessary to set it to NULL
now?

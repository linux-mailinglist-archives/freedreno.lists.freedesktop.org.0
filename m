Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DE4F4F53
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 03:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEE310EA98;
	Wed,  6 Apr 2022 01:59:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A376910EAB3
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 01:59:44 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso810123otj.9
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=jv43f2rrIHjk1Fj7wJPYOjxueyGmJxQafkTafIj1hDc=;
 b=e2thw7ORFBl8BjqnMIlCXWzL8TEvHVFQvm51vKJ6HZWpwH+ikEQJ9uUr0XXWzGW/LA
 yvYoh4bLmeNTMzkPCkk//kXR/dxKm75XLsoiBJ1Al+b52tsq58jDPpGQv+E9tLhjL83i
 YLYPRMTNSc565Jq1KFxV+EQkYyiXSwK32k/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=jv43f2rrIHjk1Fj7wJPYOjxueyGmJxQafkTafIj1hDc=;
 b=vpfxoGjkA0+AZ2IsSpQTWtMgCmEaQg3VxiHvIlw/iVzmtQXOqsj9qqKwuYGNQ3Ite5
 MMB9K3+aSfqeXMgyD2aOW3g11ea/AYWVy0nAHozksSCHxFGzsJm6ze2oIeqNwNaOWUTA
 sQ+yyk1Ui7rO4Iy8HVI5QQoiD8npuxRDG26OV0wkp1l5CEdblPeIv4SnqyrLQzViJGEn
 J/FkWuU/B116DaFHyOgifdHwfErgz8Ougshu9zcE/e+BXGJQM/Fl3572xBjem/hK8a0r
 jMC/1WdMxeKQ2QbQ7IXDN2jQyObT8h0ejjh5qOSbuD21a0d6TJklq9b75JI0y5UWFClm
 qfxA==
X-Gm-Message-State: AOAM533udkry8RQPUP2Sb55ng06dFXLg4cc5g/ynAFJXNh8xDJ9h3MQO
 NobP7yO8EyidaWu7GnlERCZ2VIMrtCJ2jXeZo5hq0A==
X-Google-Smtp-Source: ABdhPJzJE9a18gRAhOd6LPf+zCiWM3yrZAtlUUjLRrak7Q4fo7tUpBr2ScsKEhil00lOrpnbqc7pUFELqtLxYKz0Tiw=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr2258425oth.77.1649210383948; Tue, 05 Apr
 2022 18:59:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 18:59:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
References: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 18:59:43 -0700
Message-ID: <CAE-0n52u=wx403GmAvccbk1JgOgK4zz+MTBS60hvJT701WdKHA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unused plane_property field
 from msm_drm_private
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-05 16:41:21)
> Remove from struct msm_drm_private unused field plane_property.
>
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ee3093890d97..3bce127953ec 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -192,9 +192,6 @@ struct msm_drm_private {
>         unsigned int num_bridges;
>         struct drm_bridge *bridges[MAX_BRIDGES];
>
> -       /* Properties */
> -       struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
> -

Can we remove PLANE_PROP_MAX_NUM too?

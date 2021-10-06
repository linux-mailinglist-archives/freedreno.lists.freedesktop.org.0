Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2EE423503
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 02:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF28F6E48E;
	Wed,  6 Oct 2021 00:31:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133C96E499
 for <freedreno@lists.freedesktop.org>; Wed,  6 Oct 2021 00:31:51 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w206so1673175oiw.4
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=m+MQKr5bcojm+sq7twaLg9pOUyJH5Cs+bOJrOsgta0s=;
 b=GS/JhV0jd+qpvRnhjBqMFbLHcJyA18vDoEZRkcsyl70o2Zw9rFeYG2+GLxajHYUhQ/
 9mlZAfVZPGpCekxLKcIrOYPDk6TZJ9bRQRpE+bDcTzj2V5QnhwTSC+QryLhGHxlbHKJW
 pYDjcJibQ+zO4NJCsKj6a/Do0AGe+60gkzyXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=m+MQKr5bcojm+sq7twaLg9pOUyJH5Cs+bOJrOsgta0s=;
 b=q8RFmg7DT1LUcBB+LwOhMp12vFAQZb8soI4pTYRaJ9gpdpUy1h9hYfh8vqWodpKK8E
 q6IdPn48FEVbSROL9FE79sol2nN8TOe5I5mi8UfpQiV/faR1dGRzpNx46/IsGbVenYw9
 dzKtzGtdTpzJawPzI6bGjHu084UESlQLlt71W7Vw9AiPr5zRPe966La6JzX2qgfJ+P72
 DE1R0GyGSCe/LUaFTGDC0+PM5VyoFhI1L7Z4GxbO+PtWmxO5qY6G7pPv+LijkmdI9ki2
 Ane6q3/cCx0ygmK6Msk7LnaT9UMIijKqhyIEcfSOiygB9AzEJFw6Y1EItir5Iv9il6iF
 7oAg==
X-Gm-Message-State: AOAM533lSAaV62m3VEaeRZRviaCz0O9y6+nljMhssWLcubogXAvKe3Xz
 deltNDincuUvPDcN7PjVU+7AdaH0fyCkwRlmlDhgTw==
X-Google-Smtp-Source: ABdhPJzMWWttSwSsQa0qR8s31oOrQHsLnN0nu6wJj4lnGpC7laluIjYD8fdeIhSf0clYnnBS2KZ1NOlkP+u5kDOTJRg=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr5002008oia.32.1633480310393; 
 Tue, 05 Oct 2021 17:31:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 17:31:50 -0700
MIME-Version: 1.0
In-Reply-To: <20211005231323.2663520-4-bjorn.andersson@linaro.org>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 17:31:49 -0700
Message-ID: <CAE-0n53wHmorZ4HdhJmXTf+Z0j++LFut_aTryuCAa8ONW3iuLA@mail.gmail.com>
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

unsigned?

> +};
> +

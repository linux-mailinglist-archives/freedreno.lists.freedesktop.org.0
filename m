Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92294F4F44
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 03:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032410EA8C;
	Wed,  6 Apr 2022 01:58:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E3610E9A0
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 01:58:45 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d39f741ba0so1384445fac.13
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 18:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DIVGMsVz0TJ2gV9WgOfFFiA5gprB53tRsUuj8i64WaE=;
 b=IVl44d/QhSPb+vA65mjFI4QChRvBC65acN6oulekqU11IURJUXLWGepW0IbWIkETJy
 +WrVrlZdgkcjdpCGWe5Ypk8BbFo4Srsdx5lGVYum8opBfgNK1ukiEaUzavcB9V0i23rJ
 iGmIv0l4Ztmr9owj6F0mBxOG9orcs5peuCsOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DIVGMsVz0TJ2gV9WgOfFFiA5gprB53tRsUuj8i64WaE=;
 b=scQF0cTJtsQC+nEtH/oysENwEMJfJz7kh3I7ij755slQibw9nczeZptfMf7HuU4EUb
 WnYXUl2kC9s8C819a1Kw8zMoNsLGUQziYbIYHaixcH8mPBjmesznnK13Ftelk4L+OgQq
 c7xMA+Dp3hleIm+7mtzbF0sWkFxPLuH1NRVvSXn7boSa8sDgWHcbSftFw9GwxqTwYBBL
 K/yITXb1oB8IS8AZYlbaRSfdcdLUR5rwQtkgXjq/8KkJHv4NE5UrQ8gZ9Q99vpvXsj3C
 fBrRgCzDs1OdBTXBNvKjdkq6QdXA7cKuiNm3/A/qcI+603sSa6xuKyYjKUcfzJXcfZnD
 DgwQ==
X-Gm-Message-State: AOAM532ethg7kI2bGiaiNLamcAVfKslYBVJlCo1lXtIEj4wUYdW2zpdX
 tTYci7ErLiJfjYuIpu9TbwhpukAK+w4S4R8R8NxF4Q==
X-Google-Smtp-Source: ABdhPJygRyk6aXcwBIkmW3sXOMOwd//3/kqvY2L6PMY2iOeU+lK9xBLITJ+JWL6zDwHPOXhk4dBea47tvccNlzGqjpY=
X-Received: by 2002:a05:6870:e314:b0:e1:e5f0:d777 with SMTP id
 z20-20020a056870e31400b000e1e5f0d777mr2777654oad.193.1649210324223; Tue, 05
 Apr 2022 18:58:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 18:58:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
 <20220330223008.649274-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Apr 2022 18:58:43 -0700
Message-ID: <CAE-0n50gmcGrqj5p92tdTe4cyqhT4kiucRahnuLAuNtbZmXWDQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/dp: make
 dp_connector_mode_valid() more precise
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
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-30 15:30:08)
> Make dp_connector_mode_valid() return precise MODE_CLOCK_HIGH rather
> than generic MODE_BAD in case the mode clock is higher than
> DP_MAX_PIXEL_CLK_KHZ (675 MHz).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

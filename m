Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F478E3EA
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 02:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619610E640;
	Thu, 31 Aug 2023 00:26:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE2E10E63D
 for <freedreno@lists.freedesktop.org>; Thu, 31 Aug 2023 00:26:31 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-d77f614243aso113837276.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 17:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693441591; x=1694046391; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H3zj4E10NO9siAHOXcmUeyO6qgzIlCjzw1ywFvHQe48=;
 b=WyC+vUXUafQBZxal/9eC9sBHD+CxgXdx1kbzHnnDO4poVmxDC/2dPclR62WBAPT5/R
 gUv4w1tV0N72VbyssDEavt1MJWF8jCBoTwfLONmZMVeOThsCqkhGN5sM5DP5NkPFz4Ef
 p0g36YlPKEH8a/6qSl5M1CtG4zwQZRB2n0T6tWXILq276uk6BZf0rFtC1EPgYng48QwM
 QPMUGMJdj5H4qsO2MFgW4/7buAOdnUdH3qzPLaDy3QIoAfKyUCABsUARUeKmHX6XaaOS
 YXb7AOdPjaLIdFqcY8QMKYfZTeBDgAi23eIfwpg50jsvlS6BufgW5II6KzZwjyC3gRdQ
 jfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693441591; x=1694046391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3zj4E10NO9siAHOXcmUeyO6qgzIlCjzw1ywFvHQe48=;
 b=kN4gP3SbwhDDEBiB632LxC3AgygftL7NMteJYKcRS0eL0VPXGRKB/7xnRocw6jTtLm
 p6scWm+50sIY5sDu0bbvMYWQu8YY6eqiniHiBoMvse2SWEkNV2UKhQKuXrSLLoOnMs87
 vf8ILpuwADjXWGSYibKmVo0nHH1b3cTqZNhod1vw/J12bnx0j7pVwU+AXE9h3QaZKB44
 yjYDnl5SrEV3hs04LiIZYoEF6mCESzJc8yfalr+kEdo6F/yEZx31/cUQymwmLAVFos58
 VMC3d82xh97s34RH/sih4fWaU4zTIEFnX7US4lcDTw8s3N87WFt1gfKHI0rTexEHAbSg
 Twrg==
X-Gm-Message-State: AOJu0YzXoEZp0G+0oEfts7DMqeMgbGX8ZKXE+uQC5aU5qnZRFbglHhaH
 iZQJqMtVPcRw1BBuM7Db7dbE+rTdT1L6kQz8XuEr4w==
X-Google-Smtp-Source: AGHT+IEC6wjyhLHuyq2sowvLpwNst9mi9DaKnAVZfuuF7YmSGM5ILBiZEq62yGcwMVvFIDZCywIaEKK97E/8B6+kyt4=
X-Received: by 2002:a25:2901:0:b0:d7b:969b:f3e with SMTP id
 p1-20020a252901000000b00d7b969b0f3emr3293721ybp.11.1693441590996; Wed, 30 Aug
 2023 17:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-16-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-16-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:26:20 +0300
Message-ID: <CAA8EJpp=kr0XTrzq0sjssDh3oJYLqYHZjpDxeyKDxV5jfTcaBA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 15/16] drm/msm/dpu: add NV12 in the list of
 supported WB formats
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Since CDM block support has now been added for writeback blocks
> add NV12 in the list of supported WB formats.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 713dfc079718..978330c6678e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -244,6 +244,7 @@ static const uint32_t wb2_formats[] = {
>         DRM_FORMAT_BGRA4444,
>         DRM_FORMAT_BGRX4444,
>         DRM_FORMAT_XBGR4444,
> +       DRM_FORMAT_NV12,
>  };

No. This way the driver would announce availability of NV12 even on
chipsets where NV12 is not supported for the writeback. Please define
separate formats array.

BTW: does HW only support NV12 for the writeback? What about YV12 or e.g. NV21?

>
>  /*************************************************************
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

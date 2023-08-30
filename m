Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689CC78E354
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 01:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0F210E167;
	Wed, 30 Aug 2023 23:38:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692D310E167
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 23:38:20 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d7260fae148so84630276.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 16:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693438699; x=1694043499; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0OA6F/cJGjE0KJb9/0REuMAEmnQQM4Zu3TAc/AkZeiw=;
 b=eHraIArB8V1+WU7w6iuTLDhZIsWWCYBUDBH6lMVcJIq9/jZk+wA0ZD2MHojViR/HEp
 wNxx2KEkOY/uO6Kz/sb8bC+sMpy/X7hdOh1ORq4/7kTdb4MCeKpz0RTtx8q+Vfka7mVE
 euv/1/aL1QbbWIACTnQt4J8GjEuiX+309Ov6KKgC9AH4vlfsqgYzAprmqDG9p2OzBMla
 qXOm4er8JnIGh/FNzWBFJau9AJL3kuCip6/O2/8PyVSzVmRiMYrjctW2p9iJnyjV7dS/
 sv4WybaVqv2B3Ndn1QSGzaf392NE5rFcrL1X1bkpiWf0jJowPqHyj0JzCkCx1O3fJkF/
 TJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693438699; x=1694043499;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0OA6F/cJGjE0KJb9/0REuMAEmnQQM4Zu3TAc/AkZeiw=;
 b=eioAP7bZ3+N/52JzC4cypuicK9QjOHeFg9+EkZtWvmnb9LCqmyIvqLxwyv8RpujQ12
 D1sh0nce+zuMYg5tzPJhmsy3laVx17UC0sMgsjDjGK0V7cYAWYWfgnWqEZwJUTJEn+Wl
 Q+gTVs8TD9MPKRgX9CycSTJ6nkaKJ9aak/5/eTxvj8Ck/+/fFOJJRcfy1ldW2XgHm+Z9
 eu3/QjlP4lMCo8lQuyYnL3vP3simPJONNKxE7wiKHclS7gzajhguKarQbr7tzcYBFzAl
 PIKLa8IFJs4TQJW8C+owxQ5MFwV8Wmuw1gmS1Ln6tJbAZy5y1nBqaty22t4k3GfAeuew
 gzhA==
X-Gm-Message-State: AOJu0Yy5mqrRcdwTo6it4MPX6srpi/U2Nqda6B76v7spJ+MrT6GI1KCX
 h9wRpkomsFdO3SEcrvH8KxSeS6doIMZ8fembUSoPzA==
X-Google-Smtp-Source: AGHT+IGeQW7IWHk2KJWCy3x28ARi2otnY3Ztho5B4SiUmBLUWIBSTp+/mtvRVCUvyoWZFH12R61ivtvnFWmJDdFi1/M=
X-Received: by 2002:a5b:748:0:b0:d3f:208:b8ea with SMTP id
 s8-20020a5b0748000000b00d3f0208b8eamr3491103ybq.11.1693438699616; 
 Wed, 30 Aug 2023 16:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-2-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 02:38:08 +0300
Message-ID: <CAA8EJpoc6ig=Vy7gFJ0nnsAP5HvFB+=ajk94x26Ah0D_g2yJug@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 01/16] drm/msm/dpu: fix writeback
 programming for YUV cases
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

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> For YUV cases, setting the required format bits was missed
> out in the register programming. Lets fix it now in preparation
> of adding YUV formats support for writeback.
>
> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")

Since we were not exporting YUV formats, this tag is not correct. This
is a mere functional change, not a fix.

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index ebc416400382..0aa598b355e9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -86,6 +86,9 @@ static void dpu_hw_wb_setup_format(struct dpu_hw_wb *ctx,
>                         dst_format |= BIT(14); /* DST_ALPHA_X */
>         }
>
> +       if (DPU_FORMAT_IS_YUV(fmt))
> +               dst_format |= BIT(15);
> +
>         pattern = (fmt->element[3] << 24) |
>                 (fmt->element[2] << 16) |
>                 (fmt->element[1] << 8)  |
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

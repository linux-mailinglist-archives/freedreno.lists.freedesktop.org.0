Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436283F418
	for <lists+freedreno@lfdr.de>; Sun, 28 Jan 2024 06:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D589010EFE6;
	Sun, 28 Jan 2024 05:34:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A38410F01C
 for <freedreno@lists.freedesktop.org>; Sun, 28 Jan 2024 05:34:45 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5ffcb478512so11731857b3.0
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jan 2024 21:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706420024; x=1707024824; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=56XAf/FBuLB1j5RG9WDWEta1SAD1AD0IDjZoes74Lew=;
 b=eaWjTahrnkr7efWO6ywHYk+C/DTuqJ4rkYyKaz7aJG8upzDh4iBUjK4Ke36fimPVI9
 XuH1xZI+eZgfoYrpu3QeoWCcksYwhxG2bEo/7xCVMBQ0D69r70hPh3PKu61SeWFcLtYp
 3lMnAEOV9tzmISeFHrUvk/LWhxaJ3V+JxpOL4qdnbtklU0ZBIR/rN1Dlm+Z/rH0jMfvl
 CkKw/RVlQD9eLQN48nanNuCm9xU9zoGBBBWGKISdPqPKPUV0/Tft2agmLwfKjfp+dAYr
 JNPbnWCsOHdxEcoJQJ883Zpeqx7NRH5l34p0TTOAMkxVzMvdTnj1eln4CRGccVaONQV2
 W9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706420024; x=1707024824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56XAf/FBuLB1j5RG9WDWEta1SAD1AD0IDjZoes74Lew=;
 b=Q4Yt15IMFO5+A1uwJluaSWvUlNPv5TZigsGtIJTvFatLHbhCn7jlMpiBkK4g90gNpI
 Sm5s83TDVOcmtcTKPuvJMYqRsySRs6ww5jSc0cGGQ6SVyV3XySh3R2oVGnQpp7NLHUO/
 TpZmdFtWSQCUgBBFJChKOypXjV//4qdgcfrNWDa85YNP7ssjDXCrooyDLonktso9W8JM
 5dSbTIiRtI54jKWfe0d9adpEYWTzwKxh4SGGLNiNL4R3GzGY9GKgtX3fSsOSCzvUyn2Y
 fAyXJVJtBQ6ltY85SeUMzDpi+vtwD1t52cg8IC53scOnEkkZNap6swGaz2kg2iPv5dTD
 ZsIQ==
X-Gm-Message-State: AOJu0YzkdjFcYOXg/36oEV+ylS/mVGkw4LbvORlcxNSj9kYd5Zk3OmrE
 GG1OF6ZiL6c3Uw7ZHsdpb8MUs9yoQxjYGSouIIN9wN+HLPVau8NgV0lQcozOAOQgEHO9WUbmSHi
 L5iaoVUUIK0+tGgd+EeYXjDl3tSlI0spRYEEurA==
X-Google-Smtp-Source: AGHT+IEv2+PacdRXZDKioe8I+TcZjohETPUc05yqNHeQGeD9/yFMR3y1yGV/rRoXycuQG3f5WggV7ajr/dbVj0hPs9A=
X-Received: by 2002:a81:a803:0:b0:5ff:944b:6121 with SMTP id
 f3-20020a81a803000000b005ff944b6121mr1684730ywh.20.1706420024412; Sat, 27 Jan
 2024 21:33:44 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
 <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
 <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
In-Reply-To: <09a10811-ea7c-3e99-d5eb-755aac4ecf0e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:33:33 +0200
Message-ID: <CAA8EJpqFcY8yBmdW8qpMiS1p3bqY2+pgXtvR0Br9-p_VAUnN+Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 28 Jan 2024 at 07:16, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:26 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> >> YUV420. Therefore, program the INTF to send 1 ppc.
> >
> > I think this is handled in the DP driver, where we disallow wide bus
> > for YUV 4:2:0 modes.
> Yes we do disallow wide bus for YUV420 modes, but we still need to
> program the INTF_CFG2_DATA_HCTL_EN. Therefore, it is necessary to add
> this check.

As I wrote in my second email, I'd prefer to have one if which guards
HCTL_EN and another one for WIDEN

> >
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 6bba531d6dc41..bfb93f02fe7c1 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -168,7 +168,9 @@ static void
> >> dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
> >>        * video timing. It is recommended to enable it for all cases,
> >> except
> >>        * if compression is enabled in 1 pixel per clock mode
> >>        */
> >> -    if (p->wide_bus_en)
> >> +    if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> >> +        intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> >> +    else if (p->wide_bus_en)
> >>           intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
> >>         data_width = p->width;
> >



-- 
With best wishes
Dmitry

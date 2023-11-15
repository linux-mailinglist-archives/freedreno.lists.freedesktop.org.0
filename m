Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5597EBE2E
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 08:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEC710E4FD;
	Wed, 15 Nov 2023 07:38:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD6CB10E4FD
 for <freedreno@lists.freedesktop.org>; Wed, 15 Nov 2023 07:38:35 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5c08c47c055so53169347b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700033915; x=1700638715; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q1N5b4p/p13lbsRtP6IYe/M9cBHIoG53IIFCSkJ3nug=;
 b=qetzxhGUWDpb/aWx2DeQPC8V53ozJ1LvgbutTGfLecjXiSYBu763bzBcWMOePjv9du
 sfKE8zXloxrD1XBB5th6UEXL5mN5M36pdYQMMaqPZD5o20v/LHSPsRTqTrFQsEJY6g6Z
 jN3VhdswS24OCpzrCdGPjGxhAoropcXlrd6n2xw/x1RmgApN1VJIimvt73To7JP7MlCT
 PqlW4nOhHroSjHvdhrYFOLKvQWxgEI/QekrTu2V5JETv3WfNZUypg8TeefUrGbp4YVg7
 vBcQV6DFoqhRIiGX3NTCzaouFmPycKN5+7xEliUk1JZHk2YRnS9BDsXU8Nb1ZIiU69NP
 OCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700033915; x=1700638715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q1N5b4p/p13lbsRtP6IYe/M9cBHIoG53IIFCSkJ3nug=;
 b=WzIa9+XGejoTWVopm/vXHd9aFJMIAYsBz/FOaSL/1cp09lesU9ets80zjONjshuRgb
 907sI/KXPPnBdsTfWxbc2uqikmsJSNRjudd28CmX71y+f1Za8J8M0BpL7++L5UOJXnWK
 g5bYW/NcFF9KYx+I3L5ol23+QN15KhxCvUTatCnTgNPOuM8Tvoe995ufrLds3Bwex9sV
 TjMnNO1b8TjozHQYLQnLUnWqLl1CsVGt+uP9F5J4trKGgFrE+8gdNsYOhU4JLDLf63RV
 pLPm86KRHxaK91rxH0rtAtmZTkUXbda563aTCz2YtABXa/F/9IT2N6LgFG36Qc66sP4D
 7WLQ==
X-Gm-Message-State: AOJu0YyNDuLPVyjT0GCDvyQI5LiLBIO3f1ygQpahuQXehLwULUeuczvl
 DsCcplOXSBeMFtnLMaZ0EBBkqR5PWggKonFV1Sx54w==
X-Google-Smtp-Source: AGHT+IHjbgTefhGkY80NO9CwFz5yFYBdsK6NjwMZVNPorX5RtHxDYe0wL9z9xFjGN0NQqPY9WuDeHuInEdv8SASvykk=
X-Received: by 2002:a0d:cfc4:0:b0:5a7:c8fa:c620 with SMTP id
 r187-20020a0dcfc4000000b005a7c8fac620mr11860582ywd.0.1700033914825; Tue, 14
 Nov 2023 23:38:34 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-5-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-5-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:38:23 +0200
Message-ID: <CAA8EJppg=pYh73ncHBCO6Ddv9gG7+WNnpwLYGEv6xEu_3MRNWw@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/6] drm/msm/dsi: add a comment to
 explain pkt_per_line encoding
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Make it clear why the pkt_per_line value is being "divided by 2".
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 66f198e21a7e..842765063b1b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -877,6 +877,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         /* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
>          * registers have similar offsets, so for below common code use
>          * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
> +        *
> +        * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
>          */
>         reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);

Should we switch to ffs() or fls() instead?

>         reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
> --
> 2.26.1
>


-- 
With best wishes
Dmitry

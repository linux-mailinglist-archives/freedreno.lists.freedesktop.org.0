Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C72522859
	for <lists+freedreno@lfdr.de>; Wed, 11 May 2022 02:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A17310E6AA;
	Wed, 11 May 2022 00:20:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B6D10E693
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 00:20:12 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec42eae76bso3555757b3.10
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 17:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NOKwGUyMeVgfGZrU/c9rklePCH6FmNPSbNn+SDO/ULs=;
 b=u6V34wycssLfvzE8R/Nf/ApseGDPsJSTrsu8mIdnblsdOB6MZSXiMqyP7zTA7YEFmM
 CyzZ/rM/48ctt6GKrDV5me5XeD8TMaJHoK/OPte8dYFifopvtQbhkszFqSsbolxmJTSl
 GbvW319vb+WFBHpzt1GkLOgC4hqgqi0N33cNKF288+Ip3WEkRarnPQC+1PBXEFu97BpT
 PLuyNE9KCV5Q1Unx/dUqGpkFflzhg0ykcePnHvZHbk/Ey25adD+kTzhSH1J0tPqgvxfE
 dfp8nTo/g6IVNmXiPuI2F3fdSWLVxibKqBtol1ryIOaBOEeeN4BamnngqLids2ASPcqq
 Tr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NOKwGUyMeVgfGZrU/c9rklePCH6FmNPSbNn+SDO/ULs=;
 b=GfE3LoNYWx3Jyfj786tWBpnu4dP2UKjttbemQg7wmJGDSqm9U6NzGcwn9cJnIHwOV+
 kS9HtuAlqWX4uvE6eneX94oZnGoFzbMZo8Snfnl87wHNej7SUL3Gm6u+TXM9Up5lKU9M
 N9xx14/6KOoBp5zx4b6dsY9NlyBJ9aEOYQ0Aj/p+QxYyaIm45z5WsIH3m3Fcf+OdwO7T
 8PMkGLDozuMSCM6z5vFTqUF+Mw0ES+0JPKiTbqZc+yHbzoER+6yvVrcdOHdAyVHdKcm8
 MqK2cIcaQmv2R9HeETnkriv0karQI7m8Lz06v5sw8sIlgxmDllvKxzi2HIMOPvwDG0kC
 Movw==
X-Gm-Message-State: AOAM532iJPtzyYZbfyCxdLL0JL9h79zDyVJ1FZAdOtMntTJhZ7G/bcNk
 o3+tfxrgqsl6OcgE3ynLQW5zq8Qru2LetqVkvzJ9Yg==
X-Google-Smtp-Source: ABdhPJxlG6XQ5mhCKsFPgTu2pCahShBgY3mb8Xr2yU4IY/oWlb19oiP8XGjsrDKtbiK7OF6IYdtQsojIB/qbUx23yeo=
X-Received: by 2002:a81:492:0:b0:2f7:ce87:c324 with SMTP id
 140-20020a810492000000b002f7ce87c324mr23005145ywe.359.1652228411446; Tue, 10
 May 2022 17:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220510235439.31916-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20220510235439.31916-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 May 2022 03:20:00 +0300
Message-ID: <CAA8EJppOjzENORK9UFAFUus7GkjjrSsKtQp6cURHFM9oz9Fizw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add writeback support for
 sc7180
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 at 02:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add writeback support for sc7180 devices. This has been
> validated on sc7180 chromebook using IGT writeback test
> suite.
>
> localhost /usr/local/libexec/igt-gpu-tools # ./kms_writeback
> Starting subtest: writeback-pixel-formats
> Subtest writeback-pixel-formats: SUCCESS (0.001s)
> Starting subtest: writeback-invalid-parameters
> Subtest writeback-invalid-parameters: SUCCESS (0.004s)
> Starting subtest: writeback-fb-id
> Subtest writeback-fb-id: SUCCESS (0.009s)
> Starting subtest: writeback-check-output
> Subtest writeback-check-output: SUCCESS (0.203s)
>
> Adding this will increase IGT coverage on chromebooks and also
> allow using writeback functionality for other use-cases as
> necessary.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 400ebceb56bb..210becd2a9b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1803,6 +1803,8 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>                 .pingpong = sc7180_pp,
>                 .intf_count = ARRAY_SIZE(sc7180_intf),
>                 .intf = sc7180_intf,
> +               .wb_count = ARRAY_SIZE(sm8250_wb),
> +               .wb = sm8250_wb,
>                 .vbif_count = ARRAY_SIZE(sdm845_vbif),
>                 .vbif = sdm845_vbif,
>                 .reg_dma_count = 1,
> --
> 2.35.1
>


-- 
With best wishes
Dmitry

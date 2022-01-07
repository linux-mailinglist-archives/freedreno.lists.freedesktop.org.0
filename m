Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAB486E7D
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 01:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9810E3EC;
	Fri,  7 Jan 2022 00:15:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A9E10E3EC
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 00:15:40 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 c18-20020a4a3812000000b002da81004c1cso1065617ooa.13
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 16:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=MNyeIISDwaP906Fyw5+wTJ1iyG5+6D9QgHbtTef0zTw=;
 b=BHQjzeDcGe24UGKrK3UHuDDHKFKMvuivbXPMLeOhY99kwMH3AIcd1LKmxfOODHcyiq
 5B1odz88ZZTiyANh5C6KoAmhuDFrsgl/xmOu6PLS16p/dCPi/uUzL9f/j5qVlDptWI5d
 zRrWvzQIMMtfHn+Rmtzz8xDS94tEc2ancboUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=MNyeIISDwaP906Fyw5+wTJ1iyG5+6D9QgHbtTef0zTw=;
 b=fyy5Ukbf5Hlj/TLdjsXD59ADPnSnknb6HGMjdasGcJAnGvfYhb+JuT25eZ2BIJB+l4
 EPj8dABfZKBKFlc3P23SQO4VAnVJUv/tbPbvJieoBU+V2JxFsJIfTvXHEHeJ7Ygp3xVW
 c4e4ZZu6dgCxeLM3zSXtwFo0SP4LG7x3d2FNlSkswZdKQUCp5nfsggQNNDSluhwwbkCK
 pfj1U2TT+Y1RrSLhj8QcHOTCd+iTKoswZXqCNrYF7olGBJFF6IpO0S4ob6i+NnKDHlw3
 KLMG5OXJPAJzJD7ssQYGL1R3q/0S8SH8jxMPFriasE+5nUhGfmRigvlfHmChjGtf/vHC
 8V2w==
X-Gm-Message-State: AOAM533NJ7uNIP3mRjb27Vkx0BTsbl5I+/5L99oVzBWcJOd6F1ydznMM
 7wMJ63iUqv9OmVUKWxt277lTdV/3rVTuTRrMW+/wEA==
X-Google-Smtp-Source: ABdhPJxxe43QBYYTykv4Vu5bViFJ1xZXLwGzxWBx1KASqdAqJuwtKQfJVr38VaAl71Ec9QZCp7/GqF3T3K/7IgcSk8U=
X-Received: by 2002:a4a:dd08:: with SMTP id m8mr38057741oou.25.1641514539834; 
 Thu, 06 Jan 2022 16:15:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:15:39 -0800
MIME-Version: 1.0
In-Reply-To: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:15:39 -0800
Message-ID: <CAE-0n52uRJiY2f_u-Kh+8YZ_Ns=OOb3r02UG45oU8PiaMo2XrA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: add support of tps4
 (training pattern 4) for HBR3
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-06 09:14:56)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 39558a2..ba70387 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1189,12 +1190,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>
>         *training_step = DP_TRAINING_2;
>
> -       if (drm_dp_tps3_supported(ctrl->panel->dpcd))
> +       if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
> +               pattern = DP_TRAINING_PATTERN_4;
> +               state_ctrl_bit = 4;
> +       }
> +       else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
>                 pattern = DP_TRAINING_PATTERN_3;
> -       else
> +               state_ctrl_bit = 3;
> +       }
> +       else {

This should be

	} else {

>                 pattern = DP_TRAINING_PATTERN_2;
> +               state_ctrl_bit = 2;
> +       }
>
> -       ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
> +       ret = dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
>         if (ret)
>                 return ret;
>

With that fixed

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

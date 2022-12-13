Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C424664C04C
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 00:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F6810E1F0;
	Tue, 13 Dec 2022 23:11:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C0810E372
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 23:11:51 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id x11so4980067ljh.7
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 15:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=MAM1zWKmLoLybnlVx2DB+oXg2+2O2pnw6L+In6EaViM=;
 b=jwUPqxBmQ7VtGQpi3Ku0db2HJCatByDjpndoUTTI1N7sNE3QQhWdr3aSxNhCL89LEa
 hFQXlBk/K0aE6oex5CH7USSb/WOpSeJhd0GWh4Q8bHdWF5M/j+appfx9A65lXJ0fPHbo
 yRkvbiKVN4JdC9L1kcxwbIE42pbhbLF8LU6cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MAM1zWKmLoLybnlVx2DB+oXg2+2O2pnw6L+In6EaViM=;
 b=yQrvx4jSwhcFR6A9//jEcq4/EWK6g0ggwgcXOZOkZcd6uj9wjHs3z3NTFLpoBQY99p
 GRdC/mrA5qGWjzuUT/Vk4ArauDtenkdITwSetoH4JGsKWzpEVMu6XIrHO+pXbQ6gqn5o
 polgqp0FmtqnL1ulirrjTk8i2a0Y0Ol3aROGqG5vYqXeZOHHblz7b7JTS1KrFTA0DMAB
 5NWHITZ6fPmsbKrPZoHg8MdGD5L9XQpscPZscQRuR8lr9VJGc2jm6bF+pkBXK5O3gzVJ
 7NoyJvABEPT+xvR1CwNF725n81kfHP4LEAsQTMTmV7TrV5LXPbE6C8idap/QBjjqbGFo
 TDYA==
X-Gm-Message-State: ANoB5pkYZCAnFNosxLl5J+ZMh7dUaWT7+1HpujadC3YiaEMT9khW+xGn
 HvdoJAnWsh7CCU0lsiyFRRYlnLVkL+0qQIHH2GR3Cg==
X-Google-Smtp-Source: AA0mqf7fjRyv34QEVPUbrU3bGl2ESm6HVEMAzysO3m1pE1HnHZcF4ijJ1lDGhU9kCoEZmQATAKQjthDymQAcNAWyH0k=
X-Received: by 2002:a2e:a367:0:b0:27a:2a6d:73a with SMTP id
 i7-20020a2ea367000000b0027a2a6d073amr1335395ljn.27.1670973109877; Tue, 13 Dec
 2022 15:11:49 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Dec 2022 15:11:49 -0800
MIME-Version: 1.0
In-Reply-To: <1670967848-31475-4-git-send-email-quic_khsieh@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 13 Dec 2022 15:11:49 -0800
Message-ID: <CAE-0n52uRPS0nWHsdpozQBDdb2O8t1WqNVuf6JOrwdworbpJzg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v12 3/5] drm/msm/dp: parser data-lanes as
 property of dp_out endpoint
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-12-13 13:44:06)
> Add capability to parser data-lanes as property of dp_out endpoint.
> Also retain the original capability to parser data-lanes as property
> of mdss_dp node to handle legacy case.
>
> Changes in v6:
> -- first patch after split parser patch into two
>
> Changes in v7:
> -- check "data-lanes" from endpoint first
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Subject says "parser" when it probably should say "parse"?

> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index dd73221..b5f7e70 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -94,16 +94,25 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>  static int dp_parser_misc(struct dp_parser *parser)
>  {
>         struct device_node *of_node = parser->pdev->dev.of_node;
> -       int len;
> -
> -       len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> -       if (len < 0) {
> -               DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> -                        DP_MAX_NUM_DP_LANES);
> -               len = DP_MAX_NUM_DP_LANES;
> +       int cnt;
> +
> +       /*
> +        * data-lanes is the property of dp_out endpoint
> +        */
> +       cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
> +       if (cnt > 0)
> +               parser->max_dp_lanes = cnt;
> +       else {

Please add brackets to the above if to match the else.

> +               /*
> +                * legacy code, data-lanes is the property of mdss_dp node
> +                */
> +               cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> +               if (cnt > 0)
> +                       parser->max_dp_lanes = cnt;
> +               else
> +                       parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>         }
>

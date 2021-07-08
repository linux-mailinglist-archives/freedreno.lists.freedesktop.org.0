Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549613BF62E
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 09:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0200A6E873;
	Thu,  8 Jul 2021 07:21:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969296E876
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 07:21:53 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 f93-20020a9d03e60000b02904b1f1d7c5f4so4147574otf.9
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jul 2021 00:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=GlyNpRS/ZnIBH6T2xmI7UmonQRyHCXFhA2s03oASO4Q=;
 b=jL5qIurr1gZORF2l3P73QnDTKzVDziGFZCyboRb1kV87XmAQ3xV2137WoL+6fqbPxf
 USiWqleYoU4DFDU1QZQTlLrmI3bT+B43wyCaF5rxa5uxR2MvLyMbKv/H80xkqOfoCEI8
 loFn7s7cjibETX6nxR1KxSCuBLTgZLr2zhUjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=GlyNpRS/ZnIBH6T2xmI7UmonQRyHCXFhA2s03oASO4Q=;
 b=dS3DyL7yvSN1y+RVAgUw/aKjfV7A2noTXOmnSv1XaCi/eq2p4IBQ1IZEe+IRv9aTLj
 Nep9X+eURMUWrp6PWxjRqt9BKQUhYGQzeMmVbQimKXix19+AV1DT73bLW3m43MwSNsVy
 D9eaVAf9BSuqmqLWDNPQXeGAHRazhoybEPLCASR+TOMcDO3LdcvOLJ+n84g/eKZxvSbA
 Im07jcKTkxFtfVlACDKQLi9wYfiKHvXJmJu56sc2aS7n0S3EijDmTIxYj7X5ZoaixPAJ
 voN0fGskwVm1kzANOCvjRZBheDW0uz0DYnKpslLBaE2icVhkopeCtGQ0nGwBeAnxoAsB
 sLqQ==
X-Gm-Message-State: AOAM532kDfZxXVs5zD6y8mAfNzZFi8LOM3Yn2MTg4OjTUYWpVpoiLqvA
 YwFka8c32iF6Xuwnw+3aFifjPuTfvAUT6Ov3DHuMfg==
X-Google-Smtp-Source: ABdhPJxy7gr/M5KMw/WA3ZBc9mM+qV00yrR2nRuHoHKyp5ya9CGCYK6cQTX1rnZPidxNZK1/pUWAtTPnp2LZZMf9Nv4=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr23059307otf.25.1625728912972;
 Thu, 08 Jul 2021 00:21:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:21:52 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-8-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-8-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 8 Jul 2021 07:21:52 +0000
Message-ID: <CAE-0n51U8faPjxfFcd3uuOk27urR2rCSGhg1Kat1AO6LLixYTw@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH 7/7] drm/msm/dp: retrain link when loss of
 symbol lock detected
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-06 10:20:20)
> Main link symbol locked is achieved at end of link training 2. Some
> dongle main link symbol may become unlocked again if host did not end
> link training soon enough after completion of link training 2. Host
> have to re train main link if loss of symbol lock detected before
> end link training so that the coming video stream can be transmitted
> to sink properly.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

I guess this is a fix for the original driver, so it should be tagged
with Fixes appropriately.

> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 0cb01a9..e616ab2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1661,6 +1661,25 @@ static bool dp_ctrl_any_lane_cr_lose(struct dp_ctrl_private *ctrl,
>         return false;
>  }
>
> +static bool dp_ctrl_loss_symbol_lock(struct dp_ctrl_private *ctrl)
> +{
> +       u8 link_status[6];

Can we use link_status[DP_LINK_STATUS_SIZE] instead?

> +       u8 status;
> +       int i;
> +       int lane = ctrl->link->link_params.num_lanes;

s/lane/num_lanes/

would make the code easier to read

> +
> +       dp_ctrl_read_link_status(ctrl, link_status);
> +
> +       for (i = 0; i < lane; i++) {
> +               status = link_status[i / 2];
> +               status >>= ((i % 2) * 4);
> +               if (!(status & DP_LANE_SYMBOL_LOCKED))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
> @@ -1777,6 +1796,17 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>         return rc;
>  }
>
> +static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
> +{
> +       int ret = 0;

Please drop init of ret.

> +       u8 cr_status[2];
> +       int training_step = DP_TRAINING_NONE;
> +
> +       ret = dp_ctrl_setup_main_link(ctrl, cr_status, &training_step);

as it is assigned here.

> +
> +       return ret;

And indeed, it could be 'return dp_ctrl_setup_main_link()' instead.

> +}
> +
>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>  {
>         int ret = 0;
> @@ -1802,6 +1832,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>                 }
>         }
>
> +       /* if loss symbol lock happen, then retaining the link */

retain or retrain? The comment seems to be saying what the code says "if
loss retrain", so the comment is not very useful.

> +       if (dp_ctrl_loss_symbol_lock(ctrl))
> +               dp_ctrl_link_retrain(ctrl);
> +
>         /* stop txing train pattern to end link training */
>         dp_ctrl_clear_training_pattern(ctrl);
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E6486E81
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 01:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D5610E683;
	Fri,  7 Jan 2022 00:16:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1410E3EC
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 00:16:09 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t23so6080337oiw.3
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 16:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mE1P4O+5lb7Aj+m/u0inLsIsF4f3Obpma9YFsBVI+mk=;
 b=R+c4v+KB6lM8fqhf7qCx4POmsHZ85uFetKficsf+q36Un+SUnj9mAYdkTsUDRSUEum
 3ileYQjfrtriixrocxGrjGqEiu4uGATHnNupNBiTJoL0O/xhscZlTHbAyUz5ryn23sC8
 TDxs9J8GCQtY1X4V4fVgCPSWDG3oMtNcHwmRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mE1P4O+5lb7Aj+m/u0inLsIsF4f3Obpma9YFsBVI+mk=;
 b=Gk9H/zGGVUWRRXs0VxFAig8B2OcT1K2qaFxAO9WmJW1b6bnBJIbBY0UbHzx0hGb/wG
 3bk/uX9CW7Ltu+qC3oxzqWfsFO80ihRCdZE/FR9lcVqvmpG3JIRsyyMAr7KHD3vNILmn
 qR5f4iaDObhs7E9YPNQTCOpI5CaQ+lnDvAi7fJVfMZLt480gJTDILK93snm0Xo6JERNo
 DCJT/TzuUzD7MQ7vy+0ECbGNUMZyQ/tNjy71CK4ypxrtrmJu9OVc0fCdNPAQ/TcTu1jQ
 e9aN6/2yTB9E0hZ3bw2G+fZpqtqTsGiC8YBSPZbFRx4Qx1Wg4PL5xxVNHq/V/LxlBLc8
 8HfA==
X-Gm-Message-State: AOAM532k1/KYMSmaamNY9Z+uGYQf7PLSSxi62IqV0iBrNxk4xCUfoE4p
 lSNkY6lvFAICH4JhS3yQla1UiIIgv4qVWmUdNBuVMQ==
X-Google-Smtp-Source: ABdhPJxYOfr7WP2LZzJN/EUDtSmVISjJlgmRyG+L1riCyACt9jPXB4g4etKquIwp2+r5rnPWy0RDAAxc2R9ayyc2n28=
X-Received: by 2002:aca:4382:: with SMTP id q124mr8016650oia.64.1641514568306; 
 Thu, 06 Jan 2022 16:16:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 16:16:07 -0800
MIME-Version: 1.0
In-Reply-To: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
References: <1641489296-16215-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 16:16:07 -0800
Message-ID: <CAE-0n52-SL6jPVtn_wEPtY1FQ4EUZ2PhiQ=agXcnA0AHPV9TQQ@mail.gmail.com>
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

also

	} else if (...) {

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF652C0E9
	for <lists+freedreno@lfdr.de>; Wed, 18 May 2022 19:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708D910FA17;
	Wed, 18 May 2022 17:16:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9430210FA5B
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 17:16:50 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id v5so1985363qvs.10
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AeSKmYpRieplJqbY6dZu9gnBsUw6uzmIsnN1W8K30V0=;
 b=rLbXfVPr7deF6X6x3JTT+dODTXXHBuyYgpS/GGl1rtEAy1CEVGDA170Y9JrQu7WGzk
 +cA8BopAxiZh9kaM0hqE2z1HxRmdGQbfwZdIjXDtR8mULrC+rOMwQ6mV1O6Y9QiaBRWy
 f72wu3ZVo3173GbjXSNByN983NuGJzJIpnX7TtpZ+/K8+CMuWbm5R/igzyLyW2ffewlJ
 yOted1Uir1/frn7sScctDnEm/BMkgP0Ukb1xP005pgvK/tXxe+z/VQ5hpzq0qZeictTC
 e5ggi7/m3fB+TBwqa6jfyibDPjfdTckiNK4Lnl8FiDEs5PN42VklBFT0BPIPmabmkHgw
 Mz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AeSKmYpRieplJqbY6dZu9gnBsUw6uzmIsnN1W8K30V0=;
 b=HthaqnELLrXh+d3nnWrxKgaXw7u862+HixVx2pjGj/vqMWYw8qnGbn0Wfok7WT62em
 yQ4GfxCfZ72A79LcWY+NT5LEvORnMulrCgEgDb7mP/C7a+jGBW2kv6FXkOF41j/ysoUd
 CWLKV2yJbfqP3CKt0NRJVikLTxxOBklWYx6QPWNQslUIlw/FowmGShDGeRNHTaEhUPwc
 s3JqiMtJwon25qVaLu63AzkpL/Qj+nwBfZG0T8Lf3MTNAR6vq0SIBZRE3F1iQ6zDyOUi
 7crDhSUcnuBCbMYmFf6I4RW88MWzzQ5sBHDhTur1fMly3okczpgOS1ik3ZBqOirA3AvI
 t/fw==
X-Gm-Message-State: AOAM530NglHBSFDkYWuVyvy1dS8VhHZCsiuzGgyJsi9om10I6cy1H9kq
 71vAyJTfRHkB1gnGv3tSNwjdEibuPI4BQCw83huQxQ==
X-Google-Smtp-Source: ABdhPJzVWhb7JxBV/NHJBAs5arvGPcD2jM/v5t6AhXoRsB6n8cdbpK+D+p5XHnapodoBy5oTR6gn44rqH5iIEDFC8Kg=
X-Received: by 2002:a05:6214:931:b0:461:d289:b7f6 with SMTP id
 dk17-20020a056214093100b00461d289b7f6mr558590qvb.55.1652894209627; Wed, 18
 May 2022 10:16:49 -0700 (PDT)
MIME-Version: 1.0
References: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1652892186-22346-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 May 2022 20:16:38 +0300
Message-ID: <CAA8EJpqq4fxxgY0mj0JBans3GE-HAuad4Zsf7Ntwy1WW3bHbTQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 0/2] eDP/DP Phy vdda realted function
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 18 May 2022 at 19:43, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> 1) add regulator_set_load() to eDP/DP phy
> 2) remove vdda related function out of eDP/DP controller

These patches touch two subsystems and have a dependency between them.
How do we merge them?

>
> Kuogee Hsieh (2):
>   phy/qcom: add regulator_set_load to edp/dp phy
>   drm/msm/dp: delete vdda regulator related functions from eDP/DP
>     controller
>
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  6 ---
>  drivers/gpu/drm/msm/dp/dp_power.c   | 95 +------------------------------------
>  drivers/phy/qualcomm/phy-qcom-edp.c | 25 ++++++++--
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 13 +++++
>  5 files changed, 36 insertions(+), 117 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CC75552EC
	for <lists+freedreno@lfdr.de>; Wed, 22 Jun 2022 20:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C81133D8;
	Wed, 22 Jun 2022 18:03:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF711133D8
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 18:03:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x3so1420899lfd.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZTlj82E6kifi0yQhK+5fXqesjcyWHjDoPKb8Xh0tWaM=;
 b=YPs9zoXTZdCCgy6mwDaLLCe3YJ1nDLJYlFsLY0uB/WaPNWnUwxUBc+MtDtbsjeKocu
 LMvnIlwFtpMsYsE8ZyHPS4PaLaP4HcMROBXckCicyevRV/cByI0U04OV77xamBr9ZugX
 1vt1KR0NBizorFEvz6iPuh1BN6LmBC8qw97dqTbfg35KqhJCHB/BNpFz376kCDaeXsai
 Txdp5bTI2FUlSimWgJ0MPsncJig43DS0TwRrnTbQaLWqRLPQP09fSwCEpKNJI/7E30mm
 7L4+BEtYtm0MJ9ZJctR9TOLEinkeOnw1EU4gbPLbv4XCDftefTceaV2Tk7JOrppz9ByX
 fY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZTlj82E6kifi0yQhK+5fXqesjcyWHjDoPKb8Xh0tWaM=;
 b=zpSv6yNw1S4G2TuPDWo2OSbqyNB8y3j2bsahTQlSXvg1sggjePLAoFqClFMmCmHNlL
 4Y2QPEu8zZITG077as3lnEH8IiNsSXlkHDr7FaW0M++ikJaGQIW3Fwz0bW2Ky55/ovwU
 NAk0PTtwS2jyl9WpbAJzA5eq2zg+VLmCGMc4PNuHpF14FxgK0Y2xCyCqEk/3e8YbNHKS
 5OL2Fd8GQKcEzLkhPBJgcEP7hwoIx3tiTg+LKc+gHnlWWT2JTbjD08COylQ1czvm1992
 okbzUg8a2bYayv9qsMYz6/TRLJVCTFMEGbA1CkgYUMqpOPQStNvGPPw6iH43mDqzXkpw
 b+nA==
X-Gm-Message-State: AJIora/b+xjMm2ZDoDd1duyUjN6Ue4Z3bKNz4Hh9e7caPNs0ksFx8Lx/
 oQ158RzT3MMPSgO/nXhKFlkSWw==
X-Google-Smtp-Source: AGRyM1um1hIN5A8SQyQ5l8LM5tA3p+87QUOIBbIhZVlEqLdUp6eNRJ1nKpR+IJ+6NHWSX/0tvLXbjg==
X-Received: by 2002:a05:6512:16aa:b0:479:7df:cb68 with SMTP id
 bu42-20020a05651216aa00b0047907dfcb68mr2742433lfb.666.1655921009223; 
 Wed, 22 Jun 2022 11:03:29 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k6-20020ac257c6000000b004785b66a9a4sm1810904lfo.126.2022.06.22.11.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 11:03:28 -0700 (PDT)
Message-ID: <8b751eb3-2e19-0e03-4c94-b26b3badd397@linaro.org>
Date: Wed, 22 Jun 2022 21:03:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v15 0/3] eDP/DP Phy vdda realted function
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/06/2022 20:01, Kuogee Hsieh wrote:
> 0) rebase on https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tree
> 1) add regulator_set_load() to eDP phy
> 2) add regulator_set_load() to DP phy
> 3) remove vdda related function out of eDP/DP controller
> 
> Kuogee Hsieh (3):
>    phy: qcom-edp: add regulator_set_load to edp phy
>    phy: qcom-qmp: add regulator_set_load to dp phy
>    drm/msm/dp: delete vdda regulator related functions from eDP/DP
>      controller

Kishon, Vinod, how do we proceed with merging these patches?

> 
>   drivers/gpu/drm/msm/dp/dp_parser.c        | 14 -----
>   drivers/gpu/drm/msm/dp/dp_parser.h        |  8 ---
>   drivers/gpu/drm/msm/dp/dp_power.c         | 95 +------------------------------
>   drivers/phy/qualcomm/phy-qcom-edp.c       | 12 ++++
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 ++++++++++----
>   5 files changed, 47 insertions(+), 125 deletions(-)
> 


-- 
With best wishes
Dmitry

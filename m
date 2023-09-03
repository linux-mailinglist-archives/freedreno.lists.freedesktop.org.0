Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E21790E8F
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78FE10E217;
	Sun,  3 Sep 2023 21:51:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3B610E217
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:51:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so3617887a12.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777901; x=1694382701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dTOF9j4For5+IkQ27e09HtuZibYF6090duIvPCLqj1Q=;
 b=xgDShsPOKHnCBbM/iqqQ5ExQRjJIFC9rPleE+fgQunRasU6z28qkaPhVUvfd8mvB8m
 o+sPk9fZcg5eLDtZKlS29YtRpCKUo7rlpEFwfNejJtOoc7yzO78TzSg27YOqEWuyB/ve
 LnYukfJn8LIvgAs+en7lEcLLwplBpjUOlwVWQAy5JzVMxmkGN8nby1FgEhZe8SI3ezKM
 Tk8F633C4bwLz2g41dVPkwOkYo0kR9n5yfWK13QYm1atcyAQppwmhYBAzLzQka9n/BSP
 RZcSh7x9bK/+uhBwwmTrsamckFbMIvDqnKamRVpnwZHnxGJ0rjWxdUDmMQhhsacheANQ
 29Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777901; x=1694382701;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dTOF9j4For5+IkQ27e09HtuZibYF6090duIvPCLqj1Q=;
 b=DAaI2xpxrwBl/oxAuoOnXoIdZiiZBLcKM2ywS9bwVGWPqEg82K/Scqn+u/c4rJcoz/
 R0ow35JOiGkfx0MQwbBQtTCwClTKlLQl4c37ar8RNFzCHPkHjAXonZ/AG3nmWwzo/G1L
 +aWGJJrzATzxFtKsBiHEondOr2JQ+9xVfm/Uv9xDEu5nvUeytBelZCsrVDEp0xzZHvL0
 YA2BlQ3W0CQbFYU6afQS3jwDv4D/o4YbU3+EE8QBsVES6E6fo3w/c4NFGq+q25rp1AY1
 +MizoDpAgeOo1dh69U/I3PjHL4JKLbQr/Gan2iLrTCO7fAaTWvTOnTEZzArAfh8ynqQM
 j8zw==
X-Gm-Message-State: AOJu0YwSdUCnSRnSccW3satDsgRRzrL6B7WDfnqu+OvxgO53zoWXgbn7
 CSBV0p8N78n/5wCEObxsjf9rBg==
X-Google-Smtp-Source: AGHT+IGowAV7YLEFVUh9WoNGqh2dZVwEtPGL9Ejeb0BlXBpT0gKXQdTAwPamljsIXC+jZmW3nDLZWQ==
X-Received: by 2002:a17:907:7804:b0:99b:4210:cc76 with SMTP id
 la4-20020a170907780400b0099b4210cc76mr8743881ejc.28.1693777900332; 
 Sun, 03 Sep 2023 14:51:40 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jo26-20020a170906f6da00b0099ddc81903asm5256353ejb.221.2023.09.03.14.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Sep 2023 14:51:39 -0700 (PDT)
Message-ID: <af6f9379-76f5-44ae-9869-86c63caf3ab6@linaro.org>
Date: Mon, 4 Sep 2023 00:51:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, marijn.suijten@somainline.org
References: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1691533190-19335-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v1] drm/msm/dp: do not reinitialize phy
 unless retry during link training
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
 linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/08/2023 01:19, Kuogee Hsieh wrote:
> DP PHY re-initialization done using dp_ctrl_reinitialize_mainlink() will
> cause PLL unlocked initially and then PLL gets locked at the end of
> initialization. PLL_UNLOCKED interrupt will fire during this time if the
> interrupt mask is enabled.
> However currently DP driver link training implementation incorrectly
> re-initializes PHY unconditionally during link training as the PHY was
> already configured in dp_ctrl_enable_mainlink_clocks().
> 
> Fix this by re-initializing the PHY only if the previous link training
> failed.
> 
> [drm:dp_aux_isr] *ERROR* Unexpected DP AUX IRQ 0x01000000 when not busy
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/30
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


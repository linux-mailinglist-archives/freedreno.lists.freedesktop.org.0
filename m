Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00B707701
	for <lists+freedreno@lfdr.de>; Thu, 18 May 2023 02:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65D610E4C1;
	Thu, 18 May 2023 00:38:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FC410E4C0
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 00:38:25 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac8cc8829fso15193051fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 17:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684370304; x=1686962304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RDmvYByjQsOl+xkWa90beSoV5wSDkboDGuoJ5SmvNAA=;
 b=N4H0t5CPe+pIpKdkiDxQrEhybD9CUcCPAIgYJSqRHvOdDKr2JoIpXZvDFoeKNiNPZc
 g+BwOixhYhgipwcMyZ6ggBzdDC9uyAvhZnMkWGsvf0IH2CizwnWv7jufVNAJDcsCqF+q
 3i3t1eHqRmsXTBhctRpozFztzBrWA6/qavsHelLfECSxDtWwTLcE2veCsfO8D3poeAme
 bfM6MGQ9v462jU2+mn2/yTUcWcmkEPRr8f5RMi78V1laYEhxmRgQBsjlhhPU1MwXAiK0
 Uff+bq7AlYXi4NUbSYGO8VeHT0vSiuWRdyt0xgKBuGD72gitPgfbUfWjuJFzMPP2nHn9
 Q0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684370304; x=1686962304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RDmvYByjQsOl+xkWa90beSoV5wSDkboDGuoJ5SmvNAA=;
 b=kaxOZ00/WtoZOLThwepcXIf1d5MFMTQnXNL+78wlCJlDbzYKJl5ixszQ6li4/EJsSd
 e9mquEanHXM7m0uZdHxSloGeaWdwgj1E92fr+nBXJkd2tMtg+AYb++DgPCYkWypF3gUc
 eyEH96L0wNcb+PBL1y4RANBZjgcTqPbzAEuqOaGr9PhNP4ELGwNJZSTuvqIAioV7iE52
 RLY1hhwhiNfG8Tgx1emZN3QimuMRzb4cUam7fZmLxh4jCe/PfDI6rrcgYJkZm94H9aSx
 eMD/2ylnuPnYJpikeErCSjX4lzmWam0K7qK7Z2fJpLsyExdY9ZDfrv1aGYZRPe92qaAL
 67uA==
X-Gm-Message-State: AC+VfDwWizCD5ftDH6ji8cogpJWF+gtgI5TPQF16eZgN0szEMdLnp7c8
 ooUWwQcCjdmp4UqcbsXzyfjd+g==
X-Google-Smtp-Source: ACHHUZ7QefiowKDijq4DSc6g9gj2uUiHjFCOs/9Zc96kTvdluVfgcGJkerE+ZcEjbdlS+ZQakjZVUw==
X-Received: by 2002:a2e:b172:0:b0:2a7:8150:82c1 with SMTP id
 a18-20020a2eb172000000b002a7815082c1mr9874787ljm.38.1684370303765; 
 Wed, 17 May 2023 17:38:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a2e889a000000b002adaacdb900sm7954lji.42.2023.05.17.17.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 17:38:23 -0700 (PDT)
Message-ID: <1a4158f8-d1ca-4c15-51ee-8eeb721a07a1@linaro.org>
Date: Thu, 18 May 2023 03:38:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v12-3-9cdb7401f614@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v12 3/9] drm/display/dsc: Add
 drm_dsc_get_bpp_int helper
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/05/2023 01:27, Jessica Zhang wrote:
> Add helper to get the integer value of drm_dsc_config.bits_per_pixel
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   include/drm/display/drm_dsc_helper.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


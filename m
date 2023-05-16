Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C0705B45
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 01:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F91510E380;
	Tue, 16 May 2023 23:22:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E29310E380
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 23:22:47 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f24cfb8539so154975e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 16 May 2023 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684279365; x=1686871365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7VAhpo92jN54Fe2L3yyfkmVB4msq33PbAZ9pt+KT4z8=;
 b=PEjKzkKFwg9DhWnkbxJIppl3GBnbkXu3XtMQpwJuourIFZZZmC5fiZnifNiPLMTCjU
 SnbTkokLPCSXFA37zY/8Rv7xKY/0oKMGKzm7Ly/pA25Sm8ULpecPptiYZgAMj3aeZKO9
 h764fhx/OgSu/GsW2Mj5DHnkceGTUY3fSuSI+xY/2m+1cEtiR2gvu/MgGSz1SsTuhKkA
 VdQ81FC9pEQb7QmaXuFANifFA0ywpBkaZCIEX5lUBjf/5PWaOGpJfwJr86AEpL48qjdl
 V4EweawUNHyM8ZbYHrPS7nKv7hg384jkBl140aRR32GLgB3E1TJB+KTdrUDGueSmvCZj
 G/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684279365; x=1686871365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7VAhpo92jN54Fe2L3yyfkmVB4msq33PbAZ9pt+KT4z8=;
 b=UwRcRJqiStpF+XAO3Gldldi2atjQ8QKPC3tKw4RNLvcKzU0IISQZBlRAHMygLmVGqi
 sB1qPVx2LXUDL6smQdAlTedKPLc8+MeKHfYlOEDjAGbNxC8mhh7JgDhlsvqM/qXIMduO
 boCaD1xVsRudTuDjFtvVs91AhQoillpQ21T6PNuBiY12KPOKhVDBCGWg7PPMK7saQLyH
 YK26bVDd+1o9/XAePQSttPVVLGvXyodI1CN6sWvW8CGZ4TMUvL5iz5zc5FwVhKGlF6C3
 n9xT1I9lj61gmCxlDpycb3nLe+4H+ViSEp+4RVzhb95XaOz6+HbLcoNzuhnKszCl8UCb
 7CKA==
X-Gm-Message-State: AC+VfDzkNQR8zxXtyuCrs+lr6j0Xft5t+mWZMwvHtEPmNjXbv53H0XIR
 Q/pkuibTFMXiIXHrIp5B0zRUHQ==
X-Google-Smtp-Source: ACHHUZ6ZLHWS6AxNdvby7Rx3xUbbWtDDyrWiA8gw73Uk9O49w5tJDuZUC7wwOX77tlraOpnpmbnTBQ==
X-Received: by 2002:ac2:46f6:0:b0:4f3:7b1b:ff7b with SMTP id
 q22-20020ac246f6000000b004f37b1bff7bmr3043742lfo.9.1684279364857; 
 Tue, 16 May 2023 16:22:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a19f70c000000b004db3d57c3a8sm3119886lfe.96.2023.05.16.16.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 16:22:44 -0700 (PDT)
Message-ID: <aec4f825-482a-5e8f-66e1-d74b218e1a8d@linaro.org>
Date: Wed, 17 May 2023 02:22:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org
References: <20230516222039.907690-1-robdclark@gmail.com>
 <20230516222039.907690-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230516222039.907690-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 2/2] drm/msm: Be more shouty if
 per-process pgtables aren't working
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
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/05/2023 01:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Otherwise it is not always obvious if a dt or iommu change is causing us
> to fall back to global pgtable.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


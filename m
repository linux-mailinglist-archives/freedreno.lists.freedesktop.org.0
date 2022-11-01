Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4505B614268
	for <lists+freedreno@lfdr.de>; Tue,  1 Nov 2022 01:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AE810E277;
	Tue,  1 Nov 2022 00:46:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD18610E277
 for <freedreno@lists.freedesktop.org>; Tue,  1 Nov 2022 00:46:04 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k19so18499489lji.2
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 17:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EArgov1X4gC3+dL4gkFRc7cqQE/ITXTDW6MPfiwBrSw=;
 b=rSH48XY/CPCA2gnjl1xJ+JY8ET4dFqjPIulTNTlhE+pBDGbNpXw5OheBHqtdnFA4tD
 Tu40Dmmf3CBU4/IAOUBn/OnUFDDf2qf7Nmq6+p5KmGlvkGuH+UMbsQofaBRyvQod1GQA
 ip3OABTYPyxh2DEVe7LjzXaez73qQwnyOOdow7Pq9rGM3SYAYJCUZ7TbnzZgteV7JWIY
 /HrKvf92vi9UKWdFTJB+/IQ2ruvH1I8ng+fESq5NKFtvOuu7qZIe9TH0607ncJqyMOF7
 K6xKuBIRv06jzk7th5N20V/KjhSHgtngajUSyEryRC7YRIKB7NpJPfyzTNCafx0ay2AW
 Jh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EArgov1X4gC3+dL4gkFRc7cqQE/ITXTDW6MPfiwBrSw=;
 b=YAjzHqoqXvsxg67bRku4CvLkEBaD1zXT5dbMi6pjx4zgPXIcjqC1QPEHpkNsMuZwpJ
 nR1rMPjfechpXa+otIBAiE24aDLq4PJluDw0aPzJcG697kTEnHpr8coLR4M69MZMncz6
 mHod/qMkEwOol/ad7z/umGJYZn6nATIFexX/UDJWXYEdTAcdodUPOU7byDP7CoKZ5bVl
 PpcyohP9o4LF7iEgLlZ18cfgpLGAcFQONdgQwvC3IwrQdT+iaKXg9lEUyJThG2mHUxDX
 y7h7ui5ylfHMCjbagI7tZ/WZvvsJ2Oacl1SZhbmt7R8Mt7GZ0DO5X578k7C4Zl8ucyGi
 gA0g==
X-Gm-Message-State: ACrzQf2gboYytXQnMYin0s4Poaqzl/jqy2trYG7tpzhBkbyytPUMrG7Q
 oxR0TZf2LIDTi6AVSDZ/CZl+Pg==
X-Google-Smtp-Source: AMsMyM4h6felVH/qGl4RpJK6aD+raP0pmoOvXFggZk3REUimptdDjbfd+YAfJHqzP0isLFRSn0uWcQ==
X-Received: by 2002:a05:651c:1306:b0:277:5cb3:7f11 with SMTP id
 u6-20020a05651c130600b002775cb37f11mr2627329lja.207.1667263563231; 
 Mon, 31 Oct 2022 17:46:03 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a2e1517000000b0026dd4d3fe2asm1570196ljd.91.2022.10.31.17.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 17:46:02 -0700 (PDT)
Message-ID: <80465042-9e29-b496-78c3-70ac8f356869@linaro.org>
Date: Tue, 1 Nov 2022 03:46:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221031225414.1280169-1-robdclark@gmail.com>
 <20221031225414.1280169-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221031225414.1280169-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/adreno: Simplify read64/write64
 helpers
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/11/2022 01:54, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The _HI reg is always following the _LO reg, so no need to pass these
> offsets seprately.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +--
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 27 ++++++++-------------
>   drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 24 ++++++------------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +--
>   drivers/gpu/drm/msm/msm_gpu.h               | 12 ++++-----
>   6 files changed, 27 insertions(+), 46 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


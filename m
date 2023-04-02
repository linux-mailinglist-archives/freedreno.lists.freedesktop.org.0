Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE96D38D8
	for <lists+freedreno@lfdr.de>; Sun,  2 Apr 2023 17:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC2410E0D8;
	Sun,  2 Apr 2023 15:44:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCE610E0D8
 for <freedreno@lists.freedesktop.org>; Sun,  2 Apr 2023 15:44:01 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id by14so8710598ljb.12
 for <freedreno@lists.freedesktop.org>; Sun, 02 Apr 2023 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680450239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jXhcT5ZVw1OvQ2qjM62gp4jmz1Chro5Ew3RaPugUX0=;
 b=vmjyzEB8Q2LRKXisvJ5vw0iEDdeP1zteah9BoGMk2wu89tKXwsIJ5SLD1Num8XYLlY
 nyvXxB+3DJM63pM1Mb+cEu/uLvI5pGoYB+Al1LGnC7N7FfqnMGl7kTOOCS27UgSGpd0y
 kJg60dEhsOKK2gAkWM/S+LcOm5sEQxGb1kLcp7fBYLZbBWcIfssbZKnTC4jrRVzMKYQ9
 1Ywjb1KOKzDJyQEw0q0viRqNJWdqR6o4phLElQ9aN1hBakNScRj0ES1Xk5z8AxOJJt0M
 +LShuRN+U8SAXvGightjg12Jl+m9vSxV+wvjlUrnQYL4arer17yYGraL/lStU4YT5jUM
 ouwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680450239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jXhcT5ZVw1OvQ2qjM62gp4jmz1Chro5Ew3RaPugUX0=;
 b=zdkLlkp+9TYn/W9iITfHjcW3ToMv1LMtjBhuSHkJUB758681zA6hzfscTZtHwYWE2c
 wOCb7q13NFb9Ux6w9dcezKkNv5vVxVbhSq0+ry3Iw81uQF23Dbzqoenrfws4jv+v7MFK
 +PfWwsFshBWenUXZvc03ikGGeIej1YAvcjqwPDpHWMOOk9qslzPNZqQ18ByFDPaDJOaN
 UyflMn3HsfkaAC+4Ymd03+ErOctzYF93xYS6lz998irF9US4Jso1sIFgUPK9Zol/NZRO
 lbTJcsphxTXVzA4oO3/zSRcRJegeSo10hhuX3IuGGut7FcU/EIaa9PoKgK/DrcDhvRjZ
 u9tA==
X-Gm-Message-State: AAQBX9eo4ex9TNVY0rrTMkyBMi8lcBhdetvgxx+7wFkj/PGrnFvtmdDM
 qT700j1Aw8mvWekovxxgwqQ0Cw==
X-Google-Smtp-Source: AKy350Y5aEPWgsceuXkfIdTFwafBhWN+FGbs5H/6SNUrjipWa9ZUTqU9oADjjxRPo9rQbefvS5Srwg==
X-Received: by 2002:a2e:9bc7:0:b0:293:4c17:9998 with SMTP id
 w7-20020a2e9bc7000000b002934c179998mr9990534ljj.11.1680450239095; 
 Sun, 02 Apr 2023 08:43:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a2e8750000000b002935632b3f8sm1300173ljj.14.2023.04.02.08.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 08:43:58 -0700 (PDT)
Message-ID: <51451dc1-14d5-595b-589e-1cbcb5468180@linaro.org>
Date: Sun, 2 Apr 2023 18:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
 <20230223-topic-gmuwrapper-v6-1-2034115bb60c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-1-2034115bb60c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 01/15] drm/msm/adreno: adreno_gpu: Don't
 set OPP scaling clock w/ GMU
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/04/2023 14:54, Konrad Dybcio wrote:
> Recently I contributed the switch to OPP API for all Adreno generations.
> I did however also skip over the fact that GPUs with a GMU don't specify
> a core clock of any kind in the GPU node. While that didn't break
> anything, it did introduce unwanted spam in the dmesg:
> 
> adreno 5000000.gpu: error -ENOENT: _opp_set_clknames: Couldn't find clock with name: core_clk
> 
> Guard the entire logic so that it's not used with GMU-equipped GPUs.
> 
> Fixes: 9f251f934012 ("drm/msm/adreno: Use OPP for every GPU generation")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 ++++++++++++++----------
>   1 file changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


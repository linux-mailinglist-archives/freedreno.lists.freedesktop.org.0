Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD170B101
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 23:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4A10E20E;
	Sun, 21 May 2023 21:51:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC25310E0D0
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 21:51:35 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af177f12d1so47326851fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 14:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684705893; x=1687297893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kdcfr+Mqe+nejGnID0ER1VhX+tnCrYLDf1fHXZd1m5U=;
 b=h0YmQE4DZlcAoSXrJx+qa03mKVEVBFzc41z3zopqefnykjW46h18ji9/2nd+1yRHaP
 asANOLz5I72uQvPxHiKNRIjduLepWevMK5vqzXWrz8wx5picu5+GmDMFQnIFMq5AqfgP
 S5m7avBpdKUSWhFwktBj6q7KvNNNHbfDUgkwEvUl20qsfhpJLhwj4GW6bEwh/h3FahrX
 OnC222uKGPUp6B6mPBhcGc/hcmHKZhBmSEOQJWCHhFl1xyOzAtWR62T1J+ummyviEB35
 fyJxRfb2dIKuQhUmy7xmVKmNnZY677DFJl1x3Hc1Vp+igkgNUMXnDrtwlXhD5I6VDmxq
 t8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684705893; x=1687297893;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kdcfr+Mqe+nejGnID0ER1VhX+tnCrYLDf1fHXZd1m5U=;
 b=PWELwFcR5qQwrGgtWhLBzGfh6CxAtab4uD8BXKypZNNjGobCL9Nnpt/fLD0ae3pKGx
 vgWgnEFWX2HDhl5NBFnEd9IfVp2NvqiaMYcWhEz+18zjGXAPBw3l6JtRHS63ZJesz6Kc
 iisJ7g8jVx4yoGc5FfWDIOFIaURNiyevXD0+we1qCIIKJXamFJUL/i0mon8ngbljdI1h
 SV9Ox9Bnqz/7c3euELtgEseR255N43H+4GGVTT+g5R+L1mxPmcXPrQp8vsImGVVxF8QY
 Jmx1UnFUGJ5iRDNu0D1YkeuqEQS6wA2rJrHxxdtzge8jdN+nA2JHiWBUjaQK83OpMhnB
 oSLA==
X-Gm-Message-State: AC+VfDxHzuvtwSu+JG2f4HLntzM0yqFcp3BQ8h1KRYF2uCKyH8fOjLjq
 //dyrA2/j5K4xP64CT0SJYonhA==
X-Google-Smtp-Source: ACHHUZ5KbqwqTIOY5qFN3b7VMVAXJqTU1RHjkNFgfuy0TNIJ999sF7RpjYR5HKC07/5BpEiloXsagg==
X-Received: by 2002:a2e:3213:0:b0:2a9:f114:f168 with SMTP id
 y19-20020a2e3213000000b002a9f114f168mr3093590ljy.46.1684705893285; 
 Sun, 21 May 2023 14:51:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a2eb443000000b002aeeda05382sm858204ljm.29.2023.05.21.14.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 14:51:32 -0700 (PDT)
Message-ID: <25774b84-701a-5ffa-17ed-e498b594a866@linaro.org>
Date: Mon, 22 May 2023 00:51:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Steev Klimaszewski <steev@kali.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <CAKXuJqgf-MeQe8kwmBaz7DBP9sxsWHr=AZmsbRfQgVKGg=6iUQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAKXuJqgf-MeQe8kwmBaz7DBP9sxsWHr=AZmsbRfQgVKGg=6iUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/6] drm/msm/dpu: use UBWC data from MDSS
 driver
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/05/2023 00:50, Steev Klimaszewski wrote:
> Hi Dmitry
> 
> On Sun, May 21, 2023 at 12:28 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Both DPU and MDSS programming requires knowledge of some of UBWC
>> parameters. This results in duplication of UBWC data between MDSS and
>> DPU drivers. To remove such duplication and make the driver more
>> error-prone, export respective configuration from the MDSS driver and
>> make DPU use it, instead of bundling a copy of such data.
>>
> 
> Surely you mean less error prone?

Yes, of course!

> 
>> Dmitry Baryshkov (6):
>>    drm/msm/mdss: correct UBWC programming for SM8550
>>    drm/msm/mdss: rename ubwc_version to ubwc_enc_version
>>    drm/msm/mdss: export UBWC data
>>    drm/msm/mdss: populate missing data
>>    drm/msm/dpu: use MDSS data for programming SSPP
>>    drm/msm/dpu: drop UBWC configuration
>>
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 --
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
>>   drivers/gpu/drm/msm/msm_mdss.c                | 90 ++++++++++++-------
>>   drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
>>   22 files changed, 122 insertions(+), 139 deletions(-)
>>   create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
>>
>> --
>> 2.39.2
>>

-- 
With best wishes
Dmitry


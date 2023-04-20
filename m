Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015196E8770
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 03:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF8710E8A2;
	Thu, 20 Apr 2023 01:26:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC11710E768
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 01:26:12 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4edb9039a4cso230278e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681953971; x=1684545971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G9FvCMd4FeVo4PGdQogEA9VqD03U+AN8Fda9+egyrSU=;
 b=U24J37geoSH8knCLGimuYh2eVXwAASShKiWGWZ7VPiAAnaA8QkEv09KhTwQWoLS1jl
 VNKMYY/X+TFnc2S1IrIfbkqh17JXgQri6kn1hGMGn+K6DcChJWvLpJA2C+3WR6sLz3F+
 O9Nyxnnkxnx2V7OYhtZVGlfajITnf6RK441JpW+XsUtVz8bhgTo9iwXS8qK/yp7d/IMr
 /JOs0Iaf1YHD9U6zKDdx+97c10114TyRz8ZJi/p+4upnMuoQoBhsPIow9wgFIz96YbLn
 GKzWZ23Qstll35AhgRfRJVrMRTrofldp7zCE5X892Vi8tNZOEBbgZxAsCexsXAg5JpqB
 1vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681953971; x=1684545971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G9FvCMd4FeVo4PGdQogEA9VqD03U+AN8Fda9+egyrSU=;
 b=EcFujHxXq6tCG8emZNFrUahtTbFHd03P1vh/y0KR1xT9kWEw/pDyg5CKYi1oShVBW3
 1TK/xY/r9ZvkuNwH43XnZ5Sc/H+h+q1DkU+tX8yaG6NuCxJ7jnZWTAgv+31ZuzP6wMVX
 FaPanus07rCYd63kMSWy5I5iIkM0pm4zD3bHN68QyHbMZjT3/q0GXZHXMAM+vDWD47e0
 YZ4nhy4Arq0N1n/kuQfFfMTCWQZV4WPr9tkNaRU/QM3XCTQRR+8hxoJa5Kuuxd3eB/rV
 ze11ddWBhFDkGSWVqmCLZ8p5lLFNRUkObWWgutF/1t/1le5d+dDPrmT/Afv+A3Enm2La
 YZ1A==
X-Gm-Message-State: AAQBX9emvC5N9Ecvakb0uWsxxRxOvsklnqgbZrxJvf95b9r2e310TDRZ
 N6zmd4eitv5jk7PCT7bhRO5zcA==
X-Google-Smtp-Source: AKy350arA4VCD3/gkVo48bfEQ+3dNYxvQNgHZ0dKcoIlBBgvzM0ukon3pkBRaYJJaKtytZK1dCxMQg==
X-Received: by 2002:ac2:5545:0:b0:4dd:af71:a5b7 with SMTP id
 l5-20020ac25545000000b004ddaf71a5b7mr4148524lfk.41.1681953970982; 
 Wed, 19 Apr 2023 18:26:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a056512025900b004cb23904bd9sm58367lfo.144.2023.04.19.18.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 18:26:10 -0700 (PDT)
Message-ID: <c0e0a55a-cc37-fe8a-8d8a-5fe257f99b9a@linaro.org>
Date: Thu, 20 Apr 2023 03:26:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <5b133c55-e4f5-bfd2-b542-a7d44313c038@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/2] DPU1 GC1.8 wiring-up
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 20.04.2023 03:25, Dmitry Baryshkov wrote:
> On 20/04/2023 04:14, Konrad Dybcio wrote:
>> Almost all SoCs from SDM845 to SM8550 inclusive feature a GC1.8
>> dspp sub-block in addition to PCCv4. The other block differ a bit
>> more, but none of them are supported upstream.
>>
>> This series adds configures the GCv1.8 on all the relevant SoCs.
> 
> Does this mean that we will see gamma_lut support soon?
No promises, my plate is not even full, it's beyond overflowing! :P

Konrad
> 
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Konrad Dybcio (2):
>>        drm/msm/dpu1: Rename sm8150_dspp_blk to sdm845_dspp_blk
>>        drm/msm/dpu1: Enable GCv1.8 on many SoCs
>>
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 16 ++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 16 ++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  4 ++--
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 16 ++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 16 ++++++++--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  4 +++-
>>   9 files changed, 55 insertions(+), 53 deletions(-)
>> ---
>> base-commit: 3cdbc01c40e34c57697f8934f2727a88551696be
>> change-id: 20230420-topic-dpu_gc-6901f75768db
>>
>> Best regards,
> 

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E38ABC4ED
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C69210E433;
	Mon, 19 May 2025 16:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3IWVzl4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3B710E43F
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:53:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDUl5h008303
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mb4xLfXZNKPtfn9wmLcWyrskW+Yx8ILVuk5MPBj/GR8=; b=L3IWVzl42QPTsvqb
 hCmT8q7X/25zGTL2aMN3lLVLS1K+IxsKT4F7nzx1yTuXlqM8kfS1lduqhVdTM8zd
 zoxRxc3BmMrj5J5K6gchQzCskuPmr8cJE3MTxbODocuzCeZXFKj9jOZfmVNXvqES
 FTQNY+sbyk04EXbf6GtGO/42+UCcNjgJCz7Qw6O9rnWcPrpbykvUiMtpkKTraTZY
 itQuSPzRKAelUHUuv8LckKQ+gayHYEZC2Oo6QYkeGcBNmQ8RhIv6OdoStXYqskSg
 OqGKk3qdP+cCkzYT4hPq10ybt6c+hRZ8wX7AUEtX0i1t2Sy54uiTs4sCDfGcYKiv
 cijs5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhryu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:53:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8d448a7f3so24243616d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747673589; x=1748278389;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mb4xLfXZNKPtfn9wmLcWyrskW+Yx8ILVuk5MPBj/GR8=;
 b=md19jmpLifi85YQ5zwiFKQZxurOEdRGKjoPjEHK7pjW+2sZGKuFdDLV6HVSIXaG4ST
 Rq8EkEwzG+BOl7gu1WSJ8INl3kz4eoR9VsihjEcersyKgfFY/sXYLbV/zzAClUwcwrfc
 C6axQlTLYPo9ZJ9XfWTeq5qF3/qGaDCRiUH2FZg75MpBMRFVIhKrmzt8iHU70dKxzMx+
 lgXETZrIlP1dTtURVRD6MWmGZpQBZlrI2HYvq8ffI9PNfhadp52K9a+sfPP3OyUoxkYA
 TNR7QiWHn5LthhhcsvJ5/VinOPQWtfm/xczrUHjgaWeTyxGAj3mNqKOvmXdjuAseOvSV
 03jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEc43oH5EG3ZU2+yEw7OOeDf1fVjpopQhalqVuRcDtwA3WsP7jcKtZg/KQk5JBEmtuMegeWgQ97XU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4HogAUv4dIarkflBu6gIwf4fP3tZ/bG8GCrQZGCWYcK1a97ni
 K2CC1GglhlwREgU2UG6FvmgajhLFs1UfqpEClIuIYcY/fF+WthGXzKmPQgKpgP+fNeLtCYq8Yfd
 EnsAtTsg3251ugE6KqqGf3yiuADL11UknBNv5K22Jr3lQy+YfXUSn70dt5VvUw/7/Bt1/eaY=
X-Gm-Gg: ASbGncs2RuaZRq3GmKjuw11V/br6qLlCR8Zo+o894STsux82A2rY/u4m3x4vvw8iZn7
 ZJNiuCHXk7v3OxTRwn0K3e0ayw/qoOayHsu7a2zEuL6KRGJEVWD9hvGZoZt0EwupfYAHB71T0SF
 OezonXs1DKdzS1VzfgumJDsGI3nCl1wqopdHsac+4aaoc5k5hUSql5VWb83ajAGizNI/FNziLdX
 R5KiDHkb8FYIaQyHfIIir2ogvaNXF4TqcKHCfuzNTqVTIx24fH861w9LfnofKaNPPRjW/PXx05t
 anGpdnCVQ7shUjsvxh5Y2/MckvFlL/lpUvmwdrZFdHjlFIrKIh2PCUPV6SQx+xFEBZt/
X-Received: by 2002:a05:6214:405:b0:6f5:3e46:63eb with SMTP id
 6a1803df08f44-6f8b0833007mr195921996d6.13.1747673588596; 
 Mon, 19 May 2025 09:53:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvIqC4SYEoxg7ld+LNMo4kHLPjNfRWk0GWcdCnLzJRTGyDzMhLlP7Cr3xiD3OkNvOQg+196A==
X-Received: by 2002:a05:6214:405:b0:6f5:3e46:63eb with SMTP id
 6a1803df08f44-6f8b0833007mr195921246d6.13.1747673587898; 
 Mon, 19 May 2025 09:53:07 -0700 (PDT)
Received: from [10.153.41.224] (176-93-133-115.bb.dnainternet.fi.
 [176.93.133.115]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702da4dsm1935650e87.202.2025.05.19.09.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 09:53:06 -0700 (PDT)
Message-ID: <7d7f1712-b037-4f47-96a3-e57a13b58295@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:53:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
 <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T3ypPYbAnCkziikdZadCOYDeWIEaJewt
X-Proofpoint-ORIG-GUID: T3ypPYbAnCkziikdZadCOYDeWIEaJewt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1NiBTYWx0ZWRfX91vyvtNDIao9
 hO2cId4qpXkU8XvkvnOcT4HC8JrkJJnD1CUfQKn3sL9GcvuD34JWbRWaJ/ifUXw98jyQdYxUeoY
 s0xO30UfjNY7YM6P/PyOCOo9oLPuRWdCmhanegJGETxaHGhh7oLuWFLQ7U8p8nVlCp0pwfVbg3U
 hsqw+gDXApU7IeDQR50/MS0E0BvON18SiBNBc8VwbjhE6vsL3i8eGKmydVC5990uxGTC+mL1kaL
 rHiA9UGUj4fs0mv+RzUBiprQ/oX65XJJtlZqGfqO5Kuz+WpVduNioS07Gv0WNXyQOnwpb2lN2a6
 vsyn41eaAbo8PexbLSjsTYepwwqGdZG3bF0mUYXWPldVLod3Z6JUbzElXtAsvbuFFQ1Zv13ecuF
 mk8G8S9r8qqr2F+pwfMJg/LkAn+TJTNy2IqPqW/pz9BDd6njq0vgxMAWxne1D+UAxQFn0NPU
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b61f6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wJfVPMc1y4yLOrLMgEZDyw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QqOX20ToenTIRIA7GcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190156
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 19/05/2025 19:49, Abhinav Kumar wrote:
> 
> 
> On 5/5/2025 5:24 AM, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:51PM +0200, Krzysztof Kozlowski wrote:
>>> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
>>> differences and new implementations of setup_alpha_out(),
>>> setup_border_color() and setup_blend_config().
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> 1. Lowercase hex, use spaces for define indentation
>>> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
>>>
>>> Changes in v3:
>>> 1. New patch, split from previous big DPU v12.0.
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 ++++++++++++++++++++ 
>>> +++++++++--
>>>   2 files changed, 94 insertions(+), 9 deletions(-)
>>>
>>> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct 
>>> drm_device *dev,
>>>       c->idx = cfg->id;
>>>       c->cap = cfg;
>>>       c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
>>> -    if (mdss_ver->core_major_ver >= 4)
>>> +    if (mdss_ver->core_major_ver >= 12)
>>> +        c->ops.setup_blend_config = 
>>> dpu_hw_lm_setup_blend_config_combined_alpha_v12;
>>> +    else if (mdss_ver->core_major_ver >= 4)
>>>           c->ops.setup_blend_config = 
>>> dpu_hw_lm_setup_blend_config_combined_alpha;
>>>       else
>>>           c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
>>> -    c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>>> -    c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>>> +    if (mdss_ver->core_major_ver < 12) {
>>> +        c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>>> +        c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>>> +    } else {
>>> +        c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
>>> +        c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
>>> +    }
>>
>> I tried picking up these patches, and choked on this one. This heavility
>> depends on the DPU fetures bits rework patchset (mentioned in the cover
>> letter, it's fine), but granted the lack of the reviews / updates on
>> that patchset I can neither apply this patch (and its dependencies) nor
>> steer Krzysztof away from basing on that patchset (this patch provides a
>> perfect example of why that series is useful and correct).
>>
>> Abhinav, could you please continue reviewing that patch series?
>>
> 
> I think we could have continued this series on top of the current 
> feature bits model and I thought we were doing that based on #linux-arm- 
> msm chats in Feb between you and me. Not sure what happened there.

I'm also not so sure. Krzysztof has been posting it on top of the 
feature-removal series, so be it. Let's see, how many patches of that 
series would be acceptable in the end and decide the fate of this series 
afterwards.

> 
> Regarding the review, myself and Jessica have discussed this last week 
> and Jessica will take over the review of that series and please work 
> with addressing the comments provided there by her.

Ack

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FA7067B2
	for <lists+freedreno@lfdr.de>; Wed, 17 May 2023 14:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76A710E40C;
	Wed, 17 May 2023 12:12:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE67610E40C
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 12:12:06 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f24d4900bbso873714e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 May 2023 05:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684325525; x=1686917525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VrxdWZeCkSZvh6hExruVDhdjA09cMTN9lbLXcBj98CY=;
 b=uCbJBQK8D7dhKL2tOfcm74BZnTrpmnfCRyUI3NlnrX3js65ya+Nd7Bmh70CC/koXsb
 By0ffnjyMl0S7D+tg+hs3VYDJZKhAKrfgNqsdOf63W2VpcE+SzWwGzxALCAM7o7MQvzA
 khd9SUbWxQkZ9jvWDH27Moy0wAMvckyVw3/C3M5Rcq/3HoYJlpOAeAh50y+yo2a9R0lx
 QQxx86Mf3iCUuio/GzQF7MU+YzTUrIRIlP6CVn0BZovRsl4+Sg7b10ldwKe6+yG+vurG
 kX48RAGJ3Vxm7xw1zUZOIGf5RlCb2TybXJM1brIK1I8EaX+gfBUpqE4YlePDm+ueuO/0
 oWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684325525; x=1686917525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VrxdWZeCkSZvh6hExruVDhdjA09cMTN9lbLXcBj98CY=;
 b=RD5TaCaV1pY72Wpzz5mpYhWaHowD8jA4s1IbVmaRce+FO3IlgnOwyC0u1y4Xxrc+jM
 wY2GDN+TffJmaC5cIHGYu1EHaOw3PMyh/C1SCKWvwHx61RUnjI3Hc+DKhN/8oe9M/K5/
 LwoupCyuB0Dkku3KVphkKnFM9y830fQU0I5GfWsbAAIpyr6sPDCCjEZ7ESj2sIG67f8O
 WVRJEJhZPnhwr1zhxT8D6kDtJnbrafaLZip7sRqVSTCAF6pDv95jjYzObE37nqB/PF76
 10e1J7oFED3ElKiXm8dcE9Z9L92/mgWOUnpfTIop7ZM9kH6BOllJQLhUnyMCje8VvLS/
 Gudw==
X-Gm-Message-State: AC+VfDwb2LrY4V/cuuvFAXfYW7JHvj5QyMTW16Bzlf+DO1nHbBd5zYqu
 5W3ZxGuqv6QyKhLDto8LQ0PLVA==
X-Google-Smtp-Source: ACHHUZ7up1il8t6jgCLNOQ8nTFQXQsjaEJQW9I1sQXX2szBCM70/j3BvBW3L1VF7HNwYBgjpFE9kYQ==
X-Received: by 2002:ac2:4c31:0:b0:4f1:1de7:1aac with SMTP id
 u17-20020ac24c31000000b004f11de71aacmr142812lfq.20.1684325524821; 
 Wed, 17 May 2023 05:12:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b28-20020ac25e9c000000b004f24ee39661sm3308406lfq.137.2023.05.17.05.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 05:12:04 -0700 (PDT)
Message-ID: <42ee22fe-929c-9e62-6525-e4e318d3cae6@linaro.org>
Date: Wed, 17 May 2023 15:12:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230517102807.2181589-1-dmitry.baryshkov@linaro.org>
 <20230517102807.2181589-7-dmitry.baryshkov@linaro.org>
 <SN7PR11MB67506715FEA682D6FC61C073E37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB67506715FEA682D6FC61C073E37E9@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 6/8] drm/display/dsc: split DSC 1.2 and
 DSC 1.1 (pre-SCR) parameters
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/05/2023 13:42, Kandpal, Suraj wrote:
>>
>> The array of rc_parameters contains a mixture of parameters from DSC 1.1
>> and DSC 1.2 standards. Split these tow configuration arrays in preparation to
>> adding more configuration data.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> LGTM.
> 
> Reviewed-by: Suraj Kandpal

Just to note, this is not a proper R-B tag, it doesn't contain your email:


313685b15740 drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
-:12: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Suraj Kandpal'
#12:
Reviewed-by: Suraj Kandpal

total: 1 errors, 0 warnings, 0 checks, 239 lines checked

> 
>> ---
>>   drivers/gpu/drm/display/drm_dsc_helper.c  | 139 ++++++++++++++++++----
>> drivers/gpu/drm/i915/display/intel_vdsc.c |  10 +-
>>   include/drm/display/drm_dsc_helper.h      |   7 +-
>>   3 files changed, 129 insertions(+), 27 deletions(-)

[skipped the patch]

-- 
With best wishes
Dmitry


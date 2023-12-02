Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056E801C56
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 12:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12310E03D;
	Sat,  2 Dec 2023 11:12:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831D110E02F
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 11:12:07 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9ee6fed3eso6269041fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 03:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701515526; x=1702120326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ye7uYp1nmAK2nKeV+Qnc2ULdi2skK6GG5U5rkpVgBoU=;
 b=hXM0x9WBKBwiB55kpTzV7L7r2NMP+TehkaFLLU8UOOHp52slRDvV+0zItdgS0Mbk9T
 1QpFxG2MX+lG3xQArxj38M4RtdMXahpElE5sLiT8dnLtc7WNVXTcqvSw2FYjf8FO9qe9
 VNR/gl10mVD6MwMdlSxftCYbjfLCY9UMIEjm2JHNyZzGvE9nuuOsukqCcR2psx7DqgJi
 WRTGCkeR9YG63ix33Lsh4LeMBn3VeeZQ5Whav4SyVpAoVOXs1QICB5gZF4q5wV/d9jyj
 6OwJZUD+u49HvRTtepFhiwPs9FOrXYYaWlnID8hBXjVJPEvyy/hdnLXAj7Q2Gv7YSLEv
 30qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701515526; x=1702120326;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ye7uYp1nmAK2nKeV+Qnc2ULdi2skK6GG5U5rkpVgBoU=;
 b=o88wecbRGfz8cky6zv6b/pfrIyj0IsIB86oUx2rFI7pQQjznIRdOlQgoLPc6iMt6XX
 UgGTXZCYLdUE1mism03L0M1RC7Z/HO6GX9sIP62zjBfH2IU8BiGjmPObq8w6mlYRxRL1
 y8JpTSMbi5wz3ifFKG5IviwPVqPIQaZ0gmqyQQKsN/aBFiaqvdK5brsYofEiCq+yG9+C
 G1yx2sja2YNuitLT65IzWPJUdnP6r0ezb7YcYYyzb9T77E6kVB71hP/gMEetbzKr3t6W
 7sjsTsVQ5R8dzehLydA7C8RtuJm4ZfAljvkQ48OnKeT/k/FmM6pFysoOiXfDoal17ezz
 Q29w==
X-Gm-Message-State: AOJu0Yy9SYHYKcO4HGivTpiP4ynL1bCMFOgfp5Gh7Ezi25TxwvCphC2h
 pnvZekURX0pHZBpbFA0AMRtUaQ==
X-Google-Smtp-Source: AGHT+IGvGjkThsYR3UUVLQAlKIxV9cBXcsJZftyrwSYfFBkAKYldOtihnoBuJqklB3k+/mK35PAMHQ==
X-Received: by 2002:a2e:81d1:0:b0:2c9:ed9f:9dff with SMTP id
 s17-20020a2e81d1000000b002c9ed9f9dffmr517970ljg.88.1701515525554; 
 Sat, 02 Dec 2023 03:12:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a2ea315000000b002c9bae02ca9sm687112lje.18.2023.12.02.03.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Dec 2023 03:12:05 -0800 (PST)
Message-ID: <67c2f17d-4405-4a44-8215-202759957885@linaro.org>
Date: Sat, 2 Dec 2023 13:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
 <20230708010407.3871346-2-dmitry.baryshkov@linaro.org>
 <47635658-6424-7f95-97e8-0955e262fec1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <47635658-6424-7f95-97e8-0955e262fec1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 01/17] drm/msm: add arrays listing formats
 supported by MDP4/MDP5 hardware
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/12/2023 03:36, Abhinav Kumar wrote:
> 
> 
> On 7/7/2023 6:03 PM, Dmitry Baryshkov wrote:
>> MDP4 and MDP5 drivers enumerate supported formats each time the plane is
>> created. As the list of supported image formats is constant, create
>> corresponding data arrays to be used by MDP4 and MDP5 drivers.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp_format.c | 49 +++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/disp/mdp_kms.h    |  5 +++
>>   2 files changed, 52 insertions(+), 2 deletions(-)
>>
> 
> After going through the patch series, as commented in patch 17 I am 
> totally fine with migrating to drmm-managed APIs but I dont like to 
> maintain 3 format arrays.
> 
> Can we keep the existing format mechanism to avoid having two more arrays?

For DPU we have exactly the same idea: single formats data array 
describing and per-usecase arrays, like plane RGB arrays, plane YUV+RGB 
array, WB arrays.

Anyway. formats was one of the topics where we had a lot of duplication 
between mdp4/mdp5 and dpu anyway. I think I'm going to back up the 
patches 1, 10, 16, 17 (plane patches depend on the format arrays), push 
the rest of the patches to msm-next-lumag and send a series reworking 
all the formats handling.


> 
>> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c 
>> b/drivers/gpu/drm/msm/disp/mdp_format.c
>> index 025595336f26..ba9abe8b3acc 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
>> @@ -81,8 +81,8 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>>   #define BPC0A 0
>>   /*
>> - * Note: Keep RGB formats 1st, followed by YUV formats to avoid breaking
>> - * mdp_get_rgb_formats()'s implementation.
>> + * Note: Keep mdp_rgb_formats and mdp_rgb_yuv_formats in sync when 
>> adding
>> + * entries to this array.
>>    */
>>   static const struct mdp_format formats[] = {
>>       /*  name      a  r  g  b   e0 e1 e2 e3  alpha   tight  cpp cnt 
>> ... */
>> @@ -138,6 +138,51 @@ static const struct mdp_format formats[] = {
>>               MDP_PLANE_PLANAR, CHROMA_420, true),
>>   };
>> +const uint32_t mdp_rgb_formats[] = {
>> +    DRM_FORMAT_ARGB8888,
>> +    DRM_FORMAT_ABGR8888,
>> +    DRM_FORMAT_RGBA8888,
>> +    DRM_FORMAT_BGRA8888,
>> +    DRM_FORMAT_XRGB8888,
>> +    DRM_FORMAT_XBGR8888,
>> +    DRM_FORMAT_RGBX8888,
>> +    DRM_FORMAT_BGRX8888,
>> +    DRM_FORMAT_RGB888,
>> +    DRM_FORMAT_BGR888,
>> +    DRM_FORMAT_RGB565,
>> +    DRM_FORMAT_BGR565,
>> +};
>> +
>> +size_t mdp_rgb_num_formats = ARRAY_SIZE(mdp_rgb_formats);
>> +
>> +const uint32_t mdp_rgb_yuv_formats[] = {
>> +    DRM_FORMAT_ARGB8888,
>> +    DRM_FORMAT_ABGR8888,
>> +    DRM_FORMAT_RGBA8888,
>> +    DRM_FORMAT_BGRA8888,
>> +    DRM_FORMAT_XRGB8888,
>> +    DRM_FORMAT_XBGR8888,
>> +    DRM_FORMAT_RGBX8888,
>> +    DRM_FORMAT_BGRX8888,
>> +    DRM_FORMAT_RGB888,
>> +    DRM_FORMAT_BGR888,
>> +    DRM_FORMAT_RGB565,
>> +    DRM_FORMAT_BGR565,
>> +
>> +    DRM_FORMAT_NV12,
>> +    DRM_FORMAT_NV21,
>> +    DRM_FORMAT_NV16,
>> +    DRM_FORMAT_NV61,
>> +    DRM_FORMAT_VYUY,
>> +    DRM_FORMAT_UYVY,
>> +    DRM_FORMAT_YUYV,
>> +    DRM_FORMAT_YVYU,
>> +    DRM_FORMAT_YUV420,
>> +    DRM_FORMAT_YVU420,
>> +};
>> +
>> +size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
>> +
>>   /*
>>    * Note:
>>    * @rgb_only must be set to true, when requesting
>> diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h 
>> b/drivers/gpu/drm/msm/disp/mdp_kms.h
>> index b0286d5d5130..11402a859574 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp_kms.h
>> +++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
>> @@ -94,6 +94,11 @@ struct mdp_format {
>>   uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, 
>> bool rgb_only);
>>   const struct msm_format *mdp_get_format(struct msm_kms *kms, 
>> uint32_t format, uint64_t modifier);
>> +extern const uint32_t mdp_rgb_formats[];
>> +extern size_t mdp_rgb_num_formats;
>> +extern const uint32_t mdp_rgb_yuv_formats[];
>> +extern size_t mdp_rgb_yuv_num_formats;
>> +
>>   /* MDP capabilities */
>>   #define MDP_CAP_SMP        BIT(0)    /* Shared Memory 
>> Pool                 */
>>   #define MDP_CAP_DSC        BIT(1)    /* VESA Display Stream 
>> Compression    */

-- 
With best wishes
Dmitry


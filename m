Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A337682AD
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 01:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C56810E230;
	Sat, 29 Jul 2023 23:18:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A3D10E231
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 23:18:14 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so263302566b.3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 16:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690672693; x=1691277493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YBd5+9kNrxjQQ/+IaoqmXKdmoRjBOswyaZ9ByqKpWw=;
 b=ULtE+G7Mfj0WgGd0OV9V4TcQsS3aosjjQtzuyLIEqI9IOmnZNR3/s7PcH3isLV4F+H
 et1qcwS7AE6zBc4h2spZJyv+EKPCLNC9QO0lbN7Wc3pCYavXaYoxAXn6ho/S19GkZeRs
 ZLWXzMQtUxLK1BjSuyoaskc7a06RhLPYAalsitskAhBe9vEZ4TJDRyhcI4kXeLMf+80z
 YShwhEfmQjiGkmXorxHvCE6D2jAMmTr7AbnHvC3GThNgsDSN0PK8ZVgWkv6Bd0jnKMI3
 fqfNY6enPl8ZIft8xXyv9/0MTIUa3qVRbeH2CxN5GJnHEq5zauJ5tI2YdhqNj5bn3Wgh
 21NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690672693; x=1691277493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YBd5+9kNrxjQQ/+IaoqmXKdmoRjBOswyaZ9ByqKpWw=;
 b=CSmTj0dhi7XElz0I0mvC/u0cAPr73uveIrdwRk+IHNEashJhan9slxa24jxOzBXBXZ
 kT4mGhyOrF7Bb0ksmx5TI6dkxKy/J6uk/rHzQP2HCVlzOeOA03KV5+bfil3aZVL8XjAK
 pfAK6tW08PU4edGnNUHXnZ4D5ZjmPpEVCFP5KXbo+6L9xusn3Nm6Phl2fHPjQ8devgmT
 iWzdrzJ73cCEWanVlffWmOP0Hw2QNyxcKZfq8y5Rj8bqYxCkM73AOba/TXuiMEeKA8K8
 /H4tCOcicnKZyrpwqfy1ntvolRnZd++4O0yHA538JLCX98s6xxz+pDRInr6urXEBp6kO
 Ai2A==
X-Gm-Message-State: ABy/qLZk4mXm6ZacXQq4ZiFBkvj4Hocke5l7otzJ+udPNGdzMVnxBcNG
 JL20NPENWyi9/0jvsQr7dOQARA==
X-Google-Smtp-Source: APBJJlH7KtG+KWUbmIKej+0VkTarA9QEYtaIl/sY5FxN2HJh/DmXLgqQXVmkDHTGEcwbOY05hXqUbA==
X-Received: by 2002:a17:907:78d3:b0:991:e7c2:d0be with SMTP id
 kv19-20020a17090778d300b00991e7c2d0bemr3999695ejc.63.1690672692994; 
 Sat, 29 Jul 2023 16:18:12 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 jt9-20020a170906dfc900b0098e2969ed44sm3828251ejc.45.2023.07.29.16.18.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jul 2023 16:18:12 -0700 (PDT)
Message-ID: <bd59cd28-b3ba-1805-da2c-8ec6b0b2f1b0@linaro.org>
Date: Sun, 30 Jul 2023 02:18:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
 <byxscievxgqwcdu56mebkoy4jpgogzy3euddz73u2qryh3itwb@to3pyltcqqxg>
 <c9d7994d-5781-41b0-6af0-cc45d4ebf6fb@linaro.org>
 <sul276fwfmniat5dlkdj4rlw3dxjmqrg254iteblwbdlhwfxmg@4orla7ystkp4>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <sul276fwfmniat5dlkdj4rlw3dxjmqrg254iteblwbdlhwfxmg@4orla7ystkp4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/07/2023 21:31, Marijn Suijten wrote:
> On 2023-07-29 02:59:32, Dmitry Baryshkov wrote:
>> On 27/07/2023 23:03, Marijn Suijten wrote:
>>> On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
>>>> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
>>>> Rather than checking for the flag, check for the presense of the
>>>> corresponding interrupt line.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> That's a smart use of the interrupt field.  I both like it, and I do
>>> not.  While we didn't do any validation for consistency previously, this
>>> means we now have multiple ways of controlling available "features":
>>>
>>> - Feature flags on hardware blocks;
>>> - Presence of certain IRQs;
>>> - DPU core revision.
>>
>> I hesitated here too. For INTF it is clear that there is no other good
>> way to check for the TE feature. For PP we can just check for the DPU
>> revision.
> 
> For both we could additionally check the DPU revision, and for INTF we
> could check for TYPE_DSI.  Both would aid in extra validation, if we
> require the IRQ to be present or absent under these conditions.

Yep, maybe that's better.

> 
> It might also help to document this, either here and on the respective
> struct fields so that catalog implementers know when they should supply
> or leave out an IRQ?

Probably a WARN_ON would be enough.

> 
> - Marijn
> 
>>> Maybe that is more confusing to follow?  Regardless of that I'm
>>> convinced that this patch does what it's supposed to and gets rid of
>>> some ambiguity.  Maybe a comment above the IF explaining the "PP TE"
>>> feature could alleviate the above concerns thoo.  Hence:
>>>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> index 9298c166b213..912a3bdf8ad4 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
>>>> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>>>>    	c->idx = cfg->id;
>>>>    	c->caps = cfg;
>>>>    
>>>> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
>>>> +	if (cfg->intr_rdptr) {
>>>>    		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>>>>    		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>>>>    		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
>>>> -- 
>>>> 2.39.2
>>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry


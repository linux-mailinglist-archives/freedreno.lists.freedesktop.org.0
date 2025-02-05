Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E912A28C13
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2025 14:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775110E1EA;
	Wed,  5 Feb 2025 13:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EyPMqHfW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C1D10E15D
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2025 13:42:07 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38da6a1a20bso241918f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2025 05:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738762925; x=1739367725; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=RmTWR3E4/fyFZTzGOvOGvOYig/SbNCWhanmwAwdSBik=;
 b=EyPMqHfWPdry0KCu+z5NKzoFfsT2f0yGREF3qMLRimFIIBKkAgG1ytj1u5l/rfKEdA
 zHkyQsDyV9OSm6LJ8g9+PAWa3m3NWQOUTOPSwQ3dgqgBrqnoZ183kkDY/iCdtKhXMuQ6
 b+pEBxSmuLbSD1CRxAdD7uBk9Bkbw9HBOp4i9tP3k5xm35UtOUygCB5VPhyJPVXdXdEe
 Q/i59EqAuCXPBE2Qa/dH4HyfQwm6/5gevOijt7uc3/WihtieWrFV+lJ4XuF8SvXfc1AI
 OXDUFNNLGnO13q+VQhlqOLj30LDZo2tNzlwbLcheHigYCggR+E/iJWK1cHoubppt2iOB
 +iiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738762925; x=1739367725;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RmTWR3E4/fyFZTzGOvOGvOYig/SbNCWhanmwAwdSBik=;
 b=veO4M0Qyp+3kwpGJ1jr3y/w9ya7PFhdF1hecmhz6sI0IeAcp+Cn6iacn9wu90wVkex
 c5Lzcshiu/2JlQrGM7b9QKuYS89IPVvxdGCXuEiQoXb6hAmveg0pK9am3gFkjfD9fhxl
 hLitJUyQyigQsAlF5rUulTibz+VDZEyMTy32YsG07AK8CuRr5QAnBdVbYYPake0pxXqj
 8yHZ40xvWALVlvxuF+qn72cpdTpEqLIdmfmAMlUSa76XgohPrzWKU3Ve2ezuNwKZhSZV
 R08v1b//lNKAho99Kj8PcR6vjTQq93mHZhkYWjsZBAdIFxeNipfFuDrhiWD1G0kqrBSl
 4Iqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Iips9pqnMXO0PK8WbWfmfMpFsWXyA28K3TywQ+q8uAJdJCM/U91mn4e2CxEz3EIn3ZZzPajgRcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5PUVFWRc57iXHM4SEq9w/x9nHR2osWIFqYfTozkwwZhMu2osM
 Bbgm+TcOY1YCJ/7iP0vF4A8bDNbO9UEGnZWLC6ReeH1KqJvMjsCfrXGRreQRgYU=
X-Gm-Gg: ASbGncslxoieDNzZO+Z3DXwZQUv55tuPNymc+N4F+mh0YCqNL8Z4ZDkEvjydHgpt8Da
 p7DJ0Drnmiw5XvCEU4BZdddWJ3I98Pk4Ys017otnZXFi0aT5Z8tLj8i2a7f4ZPXlp3f4t47+YTR
 rRoCKNTAQ1lQ6cWEet/2VMlb1H52iL48UQ6RpCYrtzu83GfxIp4pPVO8MfXyPdle6PDfZT37ezM
 m/Bh67jIL4Nag1FKfgkbpxn6Q9x9/sIKxS3PJ/tTEn8VtfA6pBmrz5idoUPxXPqGyxRiyDvBJ7U
 BBZmnz+AoMpPgh1KpPLnx5yLkuAZJptILh8=
X-Google-Smtp-Source: AGHT+IE8EPABHPKcFeHpVATpu7tuky6dQjHYjgLf94kz5qKXEiVH4u1yWKm/bGjhuRu/mHAskiDTxQ==
X-Received: by 2002:a05:6000:1869:b0:385:de67:229e with SMTP id
 ffacd0b85a97d-38db4904424mr826959f8f.11.1738762925361; 
 Wed, 05 Feb 2025 05:42:05 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d93369fsm22035425e9.3.2025.02.05.05.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 05:42:04 -0800 (PST)
Message-ID: <1ac208a7-ec63-42fe-b496-5a2e7fd615f2@linaro.org>
Date: Wed, 5 Feb 2025 14:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
 <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
 <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 05/02/2025 12:23, Dmitry Baryshkov wrote:
>>>>>>>> +
>>>>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>>>>> +{
>>>>>>>> +        dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>>>>>>>  }
>>>>>>>>
>>>>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>>>>>>>  {
>>>>>>>> -        u32 data;
>>>>>>>> +        u32 cfg_1 = BIT(5) | BIT(4);
>>>>>>>
>>>>>>> Please define these two bits too.
>>>>>>
>>>>>> Why? They were not defined before. This only moving existing code.
>>>>>
>>>>> Previously it was just a bit magic. Currently you are adding them as
>>>>
>>>> No, previous code:
>>>>
>>>> writel(data | BIT(5) | BIT(4), pll->phy->base +
>>>> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>
>>>> This is a mask and update in the same time, because:
>>>>      (data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>>>> is just redudant.
>>>>
>>>> I did not do any logical change, I did not add any mask or field.
>>>> Everything was already there.
>>>
>>> Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
>>
>> You did not address my comment. Previous code was:
>>
>> (foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>>
>> Just for shorter syntax it was written different way:
>>
>> foo | BIT(5) | BIT(4)
> 
> Previously it was a simple writel() with some bit magic. Now you call


The mask was already there, just implied.

> dsi_pll_cmn_clk_cfg1_update() passing the register bit field through
> the 'mask' argument. I'm asking to get those masks defined. Is it
> possible?

Just like before, because implied mask is being removed due to code
redundancy.

I repeat it for third time already.

> 
> Yes, the code is equivalent and results in the same values being
> written to the same registers.
> At the same time you have added a logical entity, a masked write. I
> want to be able to understand if bits 4 and 5 are a part of the same
> register field or they belong to two different fields and can be

I know you want to understand it and this is achieved in separate patch,
because understanding this is not related to this commit.

> written separately. I really don't understand why are we spending so
> much time arguing about a simple #define. Okay, in case of drm/msm it
> is not a #define, it is <reg><bitfield/></reg>. The net result is the
> same.

I also don't get why simple fix could not be just applied and it has to
become some sort of big refactoring.

Best regards,
Krzysztof

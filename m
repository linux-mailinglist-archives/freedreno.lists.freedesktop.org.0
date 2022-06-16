Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D829554DC71
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 10:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418B6112934;
	Thu, 16 Jun 2022 08:07:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11AB1128F5
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:07:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so1008683lfo.13
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 01:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/pRixx8A5NmIgzuI16/xbS/fxWasbprf5TzsyZtX/Rc=;
 b=O0SNbdpeeKwPEve6kekoUpHg0VY0BV5/OlzzAnPIcmeWqfZ46O3iwx3D2yZcEhmuZb
 pmmvn5eLND7D9sXQWd2nFnyd1VBOuAQ6g5r4f+z1yM03T9c3PLKjLDvgucOtRAlfImth
 dNk+IhW9UB+Qm2aIn3VQit/82dGZvlAi09GvHQOyGsGchU/0wfWpILjnkBLSoIcan2am
 OsRygAdYw8V4rwyOdgHVpnGihU+OuhChaUZQgA9T5/lX+ZPOUdlBCuSqqvWcqKJsxiaC
 YogBLc8YA+wAY3/32/4MtEr1agQ6iOqEnQDchAdqH6x1wUlKuFh9oEgw6krL0Tad0miZ
 ACHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/pRixx8A5NmIgzuI16/xbS/fxWasbprf5TzsyZtX/Rc=;
 b=Cm2by5xJlGJYiQfspCsH1TF5pwnHGKPD8UdE/bGB9y17x3nowre6XJpoZq6wDqzPF6
 2pbDxaxQMJQB8kR5mpyIc9+1gTBvTN8/QGXiI38wibGbEysfZM0wm6J+uZjofNu/TNsT
 Nk5FlNcGDkP8G4Q1L4zS3L9fSzfgekQBhAhBx2I4OmMEiSFXt0Ii+wB9IFnkl6GUvLkP
 EGG5SBifdlUKM/8kQi9BfunyEXSw/aWW8H5KOt6kg1ZLpuNMXFzKXEhQYzjw5D/n3cuv
 +Cs5Bwi32AORRyVFn5BVLkxWWJNHQZel7jIYWSNAt736uhdtBNhoQ6O7eh3UwyymqdbN
 7kSw==
X-Gm-Message-State: AJIora+JSbrsIa/sYA0iNkzumlZ3P0+9kp0xbu/zpjfRhhu/f0fVY+6O
 JtbcmLIstCQcL1soxplCM7+2CA==
X-Google-Smtp-Source: AGRyM1u1xELSmGKoa5EcL2ZapZwgIxY84syV2QpLs574QTwTg3SmggmDf2p8wydDHJjjK5jGJgklKA==
X-Received: by 2002:a19:2d57:0:b0:479:732e:d8d5 with SMTP id
 t23-20020a192d57000000b00479732ed8d5mr1941662lft.131.1655366826908; 
 Thu, 16 Jun 2022 01:07:06 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b28-20020a19645c000000b00473c87152bcsm138299lfj.127.2022.06.16.01.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 01:07:06 -0700 (PDT)
Message-ID: <92d13645-82de-18ea-f0e6-30a8de1ce3c8@linaro.org>
Date: Thu, 16 Jun 2022 11:07:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
 <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
 <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/5] drm/msm: move KMS aspace init to the
 separate helper
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/06/2022 05:34, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-04 17:16:04)
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index a37a3bbc04d9..98ae0036ab57 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -262,6 +263,46 @@ static int msm_drm_uninit(struct device *dev)
>>
>>   #include <linux/of_address.h>
>>
>> +struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>> +{
> [...]
>> +       }
>> +
>> +       aspace = msm_gem_address_space_create(mmu, "mdp_kms",
>> +               0x1000, 0x100000000 - 0x1000);
>> +       if (IS_ERR(aspace)) {
>> +               mmu->funcs->destroy(mmu);
> 
> 
>> +               return aspace;
>> +       }
>> +
>> +       return aspace;
> 
> This can be 'return aspace' one time instead of two.

Yes. I was just always in favour of explicit error returns rather than 
falling through. I'll send v2.

> 
>> +}
>> +
>>   bool msm_use_mmu(struct drm_device *dev)
>>   {
>>          struct msm_drm_private *priv = dev->dev_private;


-- 
With best wishes
Dmitry

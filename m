Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5A6E85E7
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 01:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B9910EB43;
	Wed, 19 Apr 2023 23:26:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5944210EB46
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 23:26:39 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id h8so840369ljf.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 16:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681946797; x=1684538797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tdy0bM0xKZr6oyQKfYHhwGkCtciOdDj0SXYRPcGsGuI=;
 b=ubL231BYxGK7HQEPhqowVdfMZ2aCYI5mDsSNuxYThQQHDca/RsvE29k5A6CFpukMk9
 iylwpkQx+cKG9Nwynr9DFrDZ9Vs+vw7CFARgtuZyMvvf1GTvkg0rQjnWlc3n7b5lsZcS
 MRTOw3+ONmnd75DeSm72s4FLHipfJGg9GC1qXULBncYI4A2xsMq1ifuEbc2F7JUnjmV6
 5kbvWwJwEkP3W9AfNYQnpWrmvOHB7pVZ2fJQ6Jl3987/lPbPmK606BkO7PQKb9NLQQ1l
 RsoON+O897BZQSRhryl+NDg7cqkuqh5bPxuZ+dUVUTOQ5juHiVs31mnjF2Xevvlxu8TR
 UCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681946797; x=1684538797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tdy0bM0xKZr6oyQKfYHhwGkCtciOdDj0SXYRPcGsGuI=;
 b=NPxKr7ZL0Dg3DJ/H4JDGFQrL7hATdfyJZht3DAyqMS1/GoSxG6t1wVwa/Ipul7bhVh
 3ZxHy0UXaQBHGmSL5IBaxF7TzKbrq29TP0v9VjbXD5Yz+0J/tOGFicAZOWkBypo2E1HT
 5QncCgcHVvI2xmcQQhRspyvuFuJTPthx7JQkn1UW5kGDM2n8rQN96WwwgCz+KRN5ZNLB
 KZZP4R/ZEz9qRKwtaQPrpkaHKdC625XyzR8y+EDyoCFlBh9oYvYQfH8HT+zGZE3G6ImN
 8UoDp3w0nWtZPoIRTFwFwbzLJFnzwDgtG1MKoRPgN0SmHGAj8LoW5gWqrYPKoQbqhjZz
 Zb0w==
X-Gm-Message-State: AAQBX9f2XCSfT8H3ZXEvk/VMTfTNiDSpUDZzjILf3XzHYKViSgVW9ogW
 e8kwHCQB1gn+IKEblXjVn31QLg==
X-Google-Smtp-Source: AKy350aGF5EuTAPnF4k7kciyLYx05f7n7+qBryOAqx2OuHplJ1PtxA9Km8wRT+Ez0RlLnwoKVw0kWg==
X-Received: by 2002:a2e:9f49:0:b0:298:aad9:e377 with SMTP id
 v9-20020a2e9f49000000b00298aad9e377mr2290105ljk.14.1681946797482; 
 Wed, 19 Apr 2023 16:26:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a19f811000000b004ec8a7e5362sm41463lff.101.2023.04.19.16.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 16:26:37 -0700 (PDT)
Message-ID: <6ac50d82-c8f0-c0cd-25c4-348f901b88e6@linaro.org>
Date: Thu, 20 Apr 2023 02:26:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
 <20230403092313.235320-9-dmitry.baryshkov@linaro.org>
 <SN7PR11MB675048DBEDFE8CD781628198E3989@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB675048DBEDFE8CD781628198E3989@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 08/12] drm/display/dsc: add YCbCr 4:2:2
 and 4:2:0 RC parameters
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

On 13/04/2023 20:25, Kandpal, Suraj wrote:
> Hi,
>> Include RC parameters for YCbCr 4:2:2 and 4:2:0 configurations.
>>
> 
> Looks Good to me
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

And gentle reminder for patches 9-12. We would kindly ask to get this 
patches reviewed and ready to be merged into drm-intel after -rc1 or 
-rc2, so that we can backmerge the drm tree into msm-next and enqueue 
msm-specific DSC patches early during the cycle. Thank you for your 
understanding and collaboration.

-- 
With best wishes
Dmitry


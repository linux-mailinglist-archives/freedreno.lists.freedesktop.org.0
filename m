Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16168661A56
	for <lists+freedreno@lfdr.de>; Sun,  8 Jan 2023 23:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFC110E01F;
	Sun,  8 Jan 2023 22:08:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4610E213
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jan 2023 22:08:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id d30so5366727lfv.8
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 14:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f6ubnZnnnm86vU9G8oTF7iYXAATguR/oQ9JcuOI4Xb4=;
 b=E+xc4iTYp/PLYZ+e4TrolV7ng//esyyQjPKtR4jEnokZyBcEKoAi4zhZ9ruWeypdcl
 7g2TtMyAcFsoPSX+Yvf4+c12wYd48f8B5l3P2tWT5A+AXV3pHriSyQtcSy8T3YNNfAma
 sNu04ApNLGnoAenyCgLrAD/EErt4sdwH8HZatJ3ygihxgbkzt6zikf9GT6KGvin4RzdR
 9xDqgcDJheBp2i6j5rF5mqxOPfH+dUhEZpRsZpAAZtOU4NkH3m7Zj51MbXIcL32m0c9Y
 SvT63U5SHBwQ9/45cAU6bd8zdczxxoj5PwyUmru5Ft3yIZZmJNVybor8tN83+n44YgM5
 9OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6ubnZnnnm86vU9G8oTF7iYXAATguR/oQ9JcuOI4Xb4=;
 b=ZG6qtMUeWyD92c7ifuYQH7wxhVHYFj8qwsnKULk5mMpXLsYlcKs7BeS6AMjN9xkRJx
 hWWJriBJl+g17L6vuo/wspZEb4fjtYmpk3axUXXnpIwao1RJdBL/nrZ7co/B4CEdTdzf
 yFYDKvZRFUBk4foTp01cta40WJhCJAVJKrDwxHMpeDXe9eZK2sTnGE4SBDKE+JwG/o2Q
 qAI22iuxjCa2Y7DJFglvV091+exnF0CaukoKpH9uy5dRrsRmJELRQVqHvW7gAmy228dx
 rvRuAEoutW13mAAJK0sucVyn7PgXquRsY2y1ItCf6h42akoVQi4/glNfst6nBaohjt+v
 sUWg==
X-Gm-Message-State: AFqh2kpEHx8s/o5GyNHu53Bvd6KxEC3M/yI8ud+shAf/trXqf6VcfLhz
 jZ+oyO3E/x81Fc6IIv6hlmihng==
X-Google-Smtp-Source: AMrXdXsBReaMbutTRcZt/O0SaBsRbQ2XZpqlgv3sWb32zgktzJf0Rsigi+BnZVpThocB45KaI7TkPQ==
X-Received: by 2002:a05:6512:308f:b0:4cb:1189:2862 with SMTP id
 z15-20020a056512308f00b004cb11892862mr13486061lfd.13.1673215689664; 
 Sun, 08 Jan 2023 14:08:09 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056512215100b0049876c1bb24sm1264699lfr.225.2023.01.08.14.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 14:08:09 -0800 (PST)
Message-ID: <0b63ef49-7a59-0a72-503c-1de20a502c6a@linaro.org>
Date: Mon, 9 Jan 2023 00:08:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, ville.syrjala@linux.intel.com,
 yang.lee@linux.alibaba.com
References: <20221206080517.43786-1-jiasheng@iscas.ac.cn>
 <e56c48c2-8439-c9c8-c735-95adece3c68d@linaro.org>
In-Reply-To: <e56c48c2-8439-c9c8-c735-95adece3c68d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add check for cstate
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/01/2023 23:56, Dmitry Baryshkov wrote:
> On 06/12/2022 10:05, Jiasheng Jiang wrote:
>> As kzalloc may fail and return NULL pointer,
>> it should be better to check cstate
>> in order to avoid the NULL pointer dereference
>> in __drm_atomic_helper_crtc_reset.
>>
>> Fixes: 1cff7440a86e ("drm/msm: Convert to using 
>> __drm_atomic_helper_crtc_reset() for reset.")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..22c2787b7b38 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -968,7 +968,10 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
>>       if (crtc->state)
>>           dpu_crtc_destroy_state(crtc, crtc->state);
>> -    __drm_atomic_helper_crtc_reset(crtc, &cstate->base);
>> +    if (cstate)
>> +        __drm_atomic_helper_crtc_reset(crtc, &cstate->base);
>> +    else
>> +        __drm_atomic_helper_crtc_reset(crtc, NULL);
> 
> NAK.
> 
> The proper fix is to add the if() but to skip the else clause. We should 
> not reset the crtc's state if memory allocation failed.

On the other hand... Some of the drivers do exactly this ops.

With the message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


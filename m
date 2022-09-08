Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71065B211C
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 16:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2269E10E42E;
	Thu,  8 Sep 2022 14:48:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ABC10E42E
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 14:47:57 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i26so12377986lfp.11
 for <freedreno@lists.freedesktop.org>; Thu, 08 Sep 2022 07:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UuieVaXEXts9HHmfzhbQi0/SaGvodhk9jcB1Qvi2Vfk=;
 b=OVR1cCbGJE072hGoQUQmFQJ+kprUmprVLEtmSadFZzpbbM7QbSvFvlCIfSqryPYi1+
 SD1skqQd1QH52qTt6B1S/BsqHmuHjpZH9S8UyJzmPe8Zx7lmJFsP6MLRxPjlD72Vew+F
 b3lD9iUSQTOtSZCuSR/OZHMWl5KUpzR00UUcgkT49wx1fcv3qiGGhm3smwbpo3sqBOFZ
 Z5hickhSir1Me8plctfVtkpBlKW0vRDxdoKVZ7W3hL2g2Jcf81GRGI863Xy7G+pj3Pp2
 4oWiONVlaAsk50KQFObKyWirZF0osd3vjKUSXgBE+7K2LLcMQ4dOLD77ynoOtMcJFiKA
 8gqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UuieVaXEXts9HHmfzhbQi0/SaGvodhk9jcB1Qvi2Vfk=;
 b=FD2cDr1ccCwBm/lxZ6OAsCgLB3rDs1ImjqLMowX97J7EJcE1l0SCoOrht1W9fOOK22
 wsE4vXrBxpwelL2Vcfn3EPkUp9lwIpmrzDR+GuIL7VOQwbBNfIuyKZxVXbK7kNCvxe8p
 Xktj2fTjSVGlyAFHTQVFoEu5hVbNZ5UKcbb+2OiY1KcYtCFxZ8h83e73NrH5FvB76D1z
 jA9lNkY8RvjJurhheQdPhP9YjmCJZqDH/IaGnM0wUdz8/yO8rTn9njfuxRan7/XpVvJ9
 DS9XCuWhY2Wef5IdFVBbazxPKvzfUV+Hh9chpi5b9a3MAENSQ9sLQYcsZNo0UKnMXftK
 uHpw==
X-Gm-Message-State: ACgBeo0njaTPJw6PhTyUuPHBaWoYup2u+X97v/jkqV3Snp4ZjCaus6MR
 TKES3WQW3h4GvlOByfIPINDWLA==
X-Google-Smtp-Source: AA6agR7D86UKhJvdjGXOYNf76HQYlp2EoXMifqDRKaFOaRaCQAkypP44nETDFgPRIChEC/kucC5VjA==
X-Received: by 2002:a05:6512:224e:b0:498:f21f:3500 with SMTP id
 i14-20020a056512224e00b00498f21f3500mr659945lfu.581.1662648475360; 
 Thu, 08 Sep 2022 07:47:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a24-20020ac25e78000000b0048aee825e2esm788307lfr.282.2022.09.08.07.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 07:47:55 -0700 (PDT)
Message-ID: <f1d8736c-2e05-885c-aebe-0e89e3139eb5@linaro.org>
Date: Thu, 8 Sep 2022 17:47:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
 <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
 <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4f4862fd-4cbd-82ac-f162-e38c05c92423@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v6 1/4] drm/msm: clean event_thread->worker
 in case of an error
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/09/2022 03:08, Abhinav Kumar wrote:
> 
> 
> On 6/17/2022 4:33 PM, Dmitry Baryshkov wrote:
>> If worker creation fails, nullify the event_thread->worker, so that
>> msm_drm_uninit() doesn't try accessing invalid memory location. While we
>> are at it, remove duplicate assignment to the ret variable.
>>
>> Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of 
>> kthread_run")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> the change itself LGTM,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> One minor nit below
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 44485363f37a..1aab6bf86278 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const 
>> struct drm_driver *drv)
>>           if (IS_ERR(priv->event_thread[i].worker)) {
>>               ret = PTR_ERR(priv->event_thread[i].worker);
>>               DRM_DEV_ERROR(dev, "failed to create crtc_event 
>> kthread\n");
> 
> Can we print ret in this error message?

In a separate change. I'll add it to my todo list.

> 
>> -            ret = PTR_ERR(priv->event_thread[i].worker);
>> +            priv->event_thread[i].worker = NULL;
>>               goto err_msm_uninit;
>>           }

-- 
With best wishes
Dmitry


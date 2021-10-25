Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF44398C3
	for <lists+freedreno@lfdr.de>; Mon, 25 Oct 2021 16:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA68982F;
	Mon, 25 Oct 2021 14:37:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7EF8982E
 for <freedreno@lists.freedesktop.org>; Mon, 25 Oct 2021 14:37:34 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id g8so10852703ljn.4
 for <freedreno@lists.freedesktop.org>; Mon, 25 Oct 2021 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=37RgvT0lSxttAIlpSPbiWU3o8nfxLJzJwGwkROsLVrI=;
 b=PDheW/ZXwp72+mvCVThbwpylurx7v+Cxk9afOfRVMDOUgcboyCOHD8N9w2FJBMecZ6
 DODHV7P0yY6Jbo70Qq+smB6P/iI3dW3upMnC53iBiHe2W4iiYg/lIeLw9FSI1HJ9VpEY
 xfTG21VYrElV69izSy1tOfYMyx+ViO1Aumh16/zmzrZtfrC4HX3A8LqO2r20t7ywASjl
 +mTr1v7Ux2JItddXY6lh/u2RnLz19HgWHwdyBuDUrSJr9j+EsIn/ZyCjH/DvdGnd4Qsv
 ja98WuZ+8d9se8V+KM60Lw1LYLQBiQPrlZX1i4RTreVsSQUvd2fF/UoZbEspCtW++zcY
 Gh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=37RgvT0lSxttAIlpSPbiWU3o8nfxLJzJwGwkROsLVrI=;
 b=2TSouvmcMM+XhwhYshpbcZoyO0a7yx/SHxQTfAkBDJU0mjkiqxLj+j72JVG0JFs05z
 u8wTq2xU4ubX+JA5LJpiCLnDBoI/S7lsHN3lyxz05vYQgsPx7TgloSLE6xjzUKoS4ipk
 5BEwqaiNkdX2jrGhMu2FoWlRVGNdyxC8hd0ek7+7qP3tl/ZZE4Dy5aA4xi79J+UxPXVE
 zRCQZVgU7wVmAUesSvxHItnvE1EYKN5glbSlQg+svtrVwAqYJAxHtrdGaGRqn5biYqKT
 izlJHnNySD4UrkvdArTwePCRL5U+Qb4+sZq71/q6WI8Hd5SJxQuX7c3XbLakTicfvzgc
 DeVA==
X-Gm-Message-State: AOAM53387VoFjCX1YQXUWzs//72r0oVrCo6j+xIUM+/0lX9iRzwBn62O
 0jdlYWdGF5C1POJ28lsGPb1sWhU4KkBzwg==
X-Google-Smtp-Source: ABdhPJzF+wFEONNsTMIkjQf5jW/Xtl49NSImVljVD73HjiPKVvYXkdYFtOaCLEq0Vp+IpFuL/zjJtw==
X-Received: by 2002:a2e:9609:: with SMTP id v9mr18279740ljh.275.1635172652250; 
 Mon, 25 Oct 2021 07:37:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m6sm89924ljp.113.2021.10.25.07.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:37:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-10-vkoul@kernel.org>
 <020ab810-c975-d58b-a572-57eb3010d6c0@linaro.org>
Message-ID: <7ba115c8-16e6-54c4-b151-e69eedcb47d2@linaro.org>
Date: Mon, 25 Oct 2021 17:37:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <020ab810-c975-d58b-a572-57eb3010d6c0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 09/11] drm/msm/disp/dpu1: Add support for
 DSC in topology
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

On 14/10/2021 17:13, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:
>> For DSC to work we typically need a 2,2,1 configuration. This should
>> suffice for resolutions upto 4k. For more resolutions like 8k this won't
>> work.
>>
>> Also, it is better to use 2 LMs and DSC instances as half width results
>> in lesser power consumption as compared to single LM, DSC at full width.
>>
>> The panel has been tested only with 2,2,1 configuration, so for
>> now we blindly create 2,2,1 topology when DSC is enabled
>>
>> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>> Changes since
>> RFC:
>>   - Add more details in changelog
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index aac51c1bdf94..70f57a071165 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -538,6 +538,8 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>               struct drm_display_mode *mode)
>>   {
>>       struct msm_display_topology topology = {0};
>> +    struct drm_encoder *drm_enc;
>> +    struct msm_drm_private *priv;
>>       int i, intf_count = 0;
>>       for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>> @@ -572,8 +574,22 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>       topology.num_enc = 0;
>>       topology.num_intf = intf_count;
>> +    drm_enc = &dpu_enc->base;
>> +    priv = drm_enc->dev->dev_private;
>> +    if (priv && priv->dsc) {
>> +        /* In case of Display Stream Compression DSC, we would use
>> +         * 2 encoders, 2 line mixers and 1 interface
>> +         * this is power optimal and can drive upto (including) 4k
>> +         * screens
>> +         */
>> +        topology.num_enc = 2;
>> +        topology.num_intf = 1;
>> +        topology.num_lm = 2;
> 
> So, here you'd set the topology.num_rm.

I meant 'num_dsc', please excuse the typo.

> 
>> +    }
>> +
>>       return topology;
>>   }
>> +
>>   static int dpu_encoder_virt_atomic_check(
>>           struct drm_encoder *drm_enc,
>>           struct drm_crtc_state *crtc_state,
>>
> 
> 


-- 
With best wishes
Dmitry

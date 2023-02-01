Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00353686762
	for <lists+freedreno@lfdr.de>; Wed,  1 Feb 2023 14:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754D610E0CC;
	Wed,  1 Feb 2023 13:48:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0C10E0CC
 for <freedreno@lists.freedesktop.org>; Wed,  1 Feb 2023 13:48:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ml19so28007498ejb.0
 for <freedreno@lists.freedesktop.org>; Wed, 01 Feb 2023 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ls5wtJ6Hfc+JvUhlGR4xji5YGsJ7LEo3VaBr3I5PfU=;
 b=qR2yX5Y+aRZrBkYeonU56wiifAgLOsoqz6bKynEf5uErCKArEXxPvKYYWDc5GmfE6S
 52hlSedvFXg+DMsJCSJ8ZoidCU4JOsjvKcNvVtW9pVu5XQXsbKZchlCsmqDmN3tke71b
 dYKy1lmIPKfWsWnH482VI1Dn1PzVw3Ck0NPi01U9nIkL96fCzyuLdc9Paeg2XCOhh435
 KZ6SAzn4SgZxlwhdNEUzLPvYh48rd2CVrdyJfpcdqXJySBVH8GK2Si+2m002xzcRQqp9
 W6D8XbBKHK+M52AeUv4oXXCjmHJiSVBLIE+pdwrODBCtGi4sp28TsjtArLD+7t5b4qJ9
 2kIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ls5wtJ6Hfc+JvUhlGR4xji5YGsJ7LEo3VaBr3I5PfU=;
 b=Nt1ydsAdRzdOBXzGVIJhOYaunnzzRtZYZLeAI0XGG5SdIlAjIXDYuZQRNrsYPKqdJ5
 2+qbIMVSz80nQOnFfg/Udw+1nWkWOIgurtNZVq1mh+dcCywPbxLeCDnXR/TydEGsA7ge
 YZJNolx9gxGaoIQRxBXWLSOC40bSlcLf5Aii9rYjJgjTtQcuR0fKEeiIppOs+96CIMhJ
 JI0stJ7dU+22k0T0HU9WROBQea9jH/yeuCMNjrguQiN22oizRnfKtN5RbqyWMj5mC/uj
 mxqJ3654t/xaiAIgQql01WDEjVUuEKUYAR2Vg1VX0KIYe9Ld1c53gXOfW+EFy7LRo+J6
 E5cw==
X-Gm-Message-State: AO0yUKWFzsm9IESjz6mhVngi6xmnoi7Yolk7yeKow7wiQFhJqI8RVWvw
 vxzrbKlayGbr4dE5cBVqs7evzg==
X-Google-Smtp-Source: AK7set/X5KevUerlVy7HuQadHyk1nRFk3U/EKr6KdRWVgUB4dwlQ/WlSDZaUoJD+MefWqOsdrT+q9Q==
X-Received: by 2002:a17:906:184a:b0:87f:e07d:ce5f with SMTP id
 w10-20020a170906184a00b0087fe07dce5fmr2474217eje.9.1675259284443; 
 Wed, 01 Feb 2023 05:48:04 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a170906714200b00888161349desm5103078ejj.182.2023.02.01.05.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:48:03 -0800 (PST)
Message-ID: <38466a0f-686d-ab19-2669-e81ca6d6ec17@linaro.org>
Date: Wed, 1 Feb 2023 15:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
 <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v1 2/3] drm/msm/disp/dpu1: add dspps into
 reservation if there is a ctm request
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org,
 quic_vpolimer@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/02/2023 13:16, Marijn Suijten wrote:
> On 2023-01-30 07:21:31, Kalyan Thota wrote:
>> Add dspp blocks into the topology for reservation, if there is a ctm
>> request for that composition.
> 
> DSPP
> 
>> Changes in v1:
>> - Minor nits (Dmitry)
> 
> This should go below the triple dashes, so that it /does not/ become
> part of the patch/commit that is applied to the tree (where review
> history is irrelevant as it can be searched for separately).

This is one of DRM peculiarities which we have to live with.

> 
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 9c6817b..3bd46b4 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>>   static struct msm_display_topology dpu_encoder_get_topology(
>>   			struct dpu_encoder_virt *dpu_enc,
>>   			struct dpu_kms *dpu_kms,
>> -			struct drm_display_mode *mode)
>> +			struct drm_display_mode *mode,
>> +			struct drm_crtc_state *crtc_state)
>>   {
>>   	struct msm_display_topology topology = {0};
>>   	int i, intf_count = 0;
>> @@ -573,11 +574,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>>   	else
>>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>>   
>> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>> -		if (dpu_kms->catalog->dspp &&
>> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
>> -			topology.num_dspp = topology.num_lm;
>> -	}
>> +	if (dpu_kms->catalog->dspp &&
>> +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
> 
> Multiline-if-clause is typically indented with two tabs, not a half tab
> (4 spaces).

I tend to disagree here. Lately I have mostly seen it being indented to 
the opening parenthesis, so that nested statements also indent nicely.

> Nit: swap the && here?  dspp and dspp_count are related, so check ctm
> first or last but not in the middle - makes reading easier.

I think we can ignore dpu_kms->catalog->dspp completely. checking 
dspp_count should be enough for the purpose of the check (and note, the 
check for dspp/dspp_count is misleading and should be omitted).

> 
>> +		topology.num_dspp = topology.num_lm;
>>   
>>   	topology.num_enc = 0;
>>   	topology.num_intf = intf_count;
>> @@ -643,7 +642,7 @@ static int dpu_encoder_virt_atomic_check(
>>   		}
>>   	}
>>   
>> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>>   
>>   	/* Reserve dynamic resources now. */
>>   	if (!ret) {
>> -- 
>> 2.7.4
>>

-- 
With best wishes
Dmitry


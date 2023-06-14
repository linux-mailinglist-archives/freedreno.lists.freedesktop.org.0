Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D975572FDC5
	for <lists+freedreno@lfdr.de>; Wed, 14 Jun 2023 14:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE6410E44E;
	Wed, 14 Jun 2023 12:02:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C745510E450
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 12:02:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso8488987e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686744121; x=1689336121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=APFMvQ7ODanIJV/49mozRJR24EjLchmIY1aNYth0n0A=;
 b=Mam7RMG4QADLgh+kzPZaKHUmYaOuIkTw2qRG0m5AX6/NOUAt0E84N3AyxrAsGQNk2w
 ah+8ESm1qCPF+XuhadskNQaWncvHd3CY8rE+obVG7RYE6yBL+mwpE2ne6OxqDwhrHfT1
 thx62KLmMHlOJPizDx8aDFoiCXdd35SiihHJdBDmH9vIwbCIDN+dYd5gEE97RwiEZKTc
 66v3OCGZPH7nO1zD8ZwfXQre7zGioY2d14LnJj2Dn2VejcKe53x0Pdz1YFXNofaQlyKE
 tU7GnVqf5tYYiPVwT1d2F6LZMVu7FNsYKWEccwXxsSDDnvpGimkGw9n6SJxlSoabG4kL
 g4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686744121; x=1689336121;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=APFMvQ7ODanIJV/49mozRJR24EjLchmIY1aNYth0n0A=;
 b=PKZX9TE9cPZGdx3ahLskuUSjzA2SzQHZnuIuTP/j242QvwO9dpqWWywHauDYMJk02l
 gcfeOTxUpIMrrI4Ai5m+WtlTDxF28ilIpnC6VErq3Zj/0NM0/NIofy54tJGD+oGjnHrz
 qnshLosoHL5H9G04L4j79wehpFZ5v0+LCTI2Ym9UKQ/l7xm+qy0DLV+dYEoUkhZDYqT4
 wxTiWTxTJL6hTfzXGActPRhUj0yKoclpjt8U2RD4o3f2xXlPkY3kLhYrgz8n/hDljoru
 jnQ5GTNi4Vu11RTA7XLvbuMB3YAWIkaxwfJOUo9t6p1/F4afF2tcKAuh0OO8tU9fxXSc
 3Xvw==
X-Gm-Message-State: AC+VfDzCXus3HVwVu9JIOMRmER4AuTY63kaW5OsD8bN9p2Wx4cDq5OIA
 us45hpFF9LCdkR+ZmPZ93145OQ==
X-Google-Smtp-Source: ACHHUZ4rNTYSmY8dJMj9rW18QV3jmWIGNjGK3rX385cmsN6Bsiry3yG0eLvhyGVb2+zuGkVHDiUiCQ==
X-Received: by 2002:ac2:4d9b:0:b0:4f3:a61d:19d2 with SMTP id
 g27-20020ac24d9b000000b004f3a61d19d2mr7414911lfe.36.1686744120599; 
 Wed, 14 Jun 2023 05:02:00 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f2-20020ac251a2000000b004f62229b6c1sm2099072lfk.252.2023.06.14.05.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 05:01:59 -0700 (PDT)
Message-ID: <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
Date: Wed, 14 Jun 2023 15:01:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/06/2023 14:42, Marijn Suijten wrote:
> On 2023-06-13 18:57:11, Jessica Zhang wrote:
>> DPU 5.x+ supports a databus widen mode that allows more data to be sent
>> per pclk. Enable this feature flag on all relevant chipsets.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>   2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 36ba3f58dcdf..0be7bf0bfc41 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -103,7 +103,8 @@
>>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>>   	 BIT(DPU_INTF_TE) | \
>>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>> -	 BIT(DPU_DATA_HCTL_EN))
>> +	 BIT(DPU_DATA_HCTL_EN) | \
>> +	 BIT(DPU_INTF_DATABUS_WIDEN))
> 
> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3.  In the
> last patch for DSI you state and enable widebus for DSI 6G 2.5+ only,
> meaning DPU and DSI are now desynced, and the output is completely
> corrupted.
> 
> Is the bound in dsi_host wrong, or do DPU and DSI need to communicate
> when widebus will be enabled, based on DPU && DSI supporting it?

I'd prefer to follow the second approach, as we did for DP. DPU asks the 
actual video output driver if widebus is to be enabled.

> 
> - Marijn
> 
>>   #define INTF_SC7280_MASK (INTF_SC7180_MASK | BIT(DPU_INTF_DATA_COMPRESS))
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index b860784ade72..b9939e00f5e0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -182,6 +182,7 @@ enum {
>>    *                                  than video timing
>>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>>    * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>> + * @DPU_INTF_DATABUS_WIDEN          INTF block has DATABUS_WIDEN register
>>    * @DPU_INTF_MAX
>>    */
>>   enum {
>> @@ -190,6 +191,7 @@ enum {
>>   	DPU_DATA_HCTL_EN,
>>   	DPU_INTF_STATUS_SUPPORTED,
>>   	DPU_INTF_DATA_COMPRESS,
>> +	DPU_INTF_DATABUS_WIDEN,
>>   	DPU_INTF_MAX
>>   };
>>   
>>
>> -- 
>> 2.40.1
>>

-- 
With best wishes
Dmitry


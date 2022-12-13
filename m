Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B164B885
	for <lists+freedreno@lfdr.de>; Tue, 13 Dec 2022 16:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4310E335;
	Tue, 13 Dec 2022 15:35:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C15510E334
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 15:35:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z26so5502759lfu.8
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y8vVbjqanYrGCXOfeKuV4b4So0udrFNnXHVcrF7wyxU=;
 b=rejw52LTgB29C7W/cCkFInXwaYdOjKdIK/Dyp68WRtGnifK/FvgmyyWIiajyX8D5eE
 itpYE1WGMWzthGAI0xKSktWLWeGCAIalpFgVRA+N/tzQ+XKbbbPRRhbjwCGAgNh4d5mi
 ZznfVnd0NAG8gQO7Tn1KgDb42WwK1OWauMTT1kMzpcMOkIZ/2lgERnbD3UyCtqOvmf/M
 8UbSK7Q1T7EIYfcMv0kkRnAKMk9Srj60NyyMM2QeyyAPxdN5MNNmbsLcCJRgia8CIENL
 FSDTeOUHMXIqEjgfEG59YRFJ0HsMrnZKgV/wXW+fHxUFzU32J4dY/jF4ohlfvunp7YM7
 GXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8vVbjqanYrGCXOfeKuV4b4So0udrFNnXHVcrF7wyxU=;
 b=0Gx5PgDAkZwPZJcu/BZ0g9fIt/Ar1KH245r8t9l26fflykEY26rbyc5z8z9qTsNNVO
 SJ0Wswh5z8RVsdZQcoBaY0JoFIgtqcY7lNyyuUVS8cfbcpbqtM/Q34X5l0WkutjRs8t5
 bmGnbaiEpGqxHqkiwAyDQ+nOJh0pEtcST+HvOX37HFURioq3gFN9rVqrKns+Z1SM0/0h
 lE8dYoOXwY3dNr/xiSiQL0mdrtBYrfJ+JxSrdXAzykFR1m3n668S9TT11zNyzPE6d7p5
 6Lbnu55Ow17OCc0F9v/KyU1SVWO4iHDZdgFQw7pMTw/vJQlrhg8fZwsHXizjySS713Tx
 OiIw==
X-Gm-Message-State: ANoB5plg6BhKT7ktb+8AnUeSwl4bKftIG0HJeoGcPsJ0NpRYc+6fqi8c
 s2hEACntcx5io474ryQL9Bc6Cw==
X-Google-Smtp-Source: AA0mqf5WlSauCJELuZCcs4LWl3+VRfp8Lq0O7eAOrC7PK3kPa1vZKkiqpgeCSdbQu75jdV5vdi2Nug==
X-Received: by 2002:a19:ad49:0:b0:4b5:c489:8cf8 with SMTP id
 s9-20020a19ad49000000b004b5c4898cf8mr3108286lfd.61.1670945698746; 
 Tue, 13 Dec 2022 07:34:58 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056512348700b004a2511b8224sm413426lfr.103.2022.12.13.07.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 07:34:58 -0800 (PST)
Message-ID: <7df05698-0aef-7c9c-4577-3d400c631da8@linaro.org>
Date: Tue, 13 Dec 2022 16:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-5-konrad.dybcio@linaro.org>
 <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/a6xx: Add support for A650
 speed binning
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 13.12.2022 16:23, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 12, 2022 at 4:24 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> Add support for matching QFPROM fuse values to get the correct speed bin
>> on A650 (SM8250) GPUs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 2c1630f0c04c..f139ec57c32d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1887,6 +1887,20 @@ static u32 a640_get_speed_bin(u32 fuse)
>>         return UINT_MAX;
>>  }
>>
>> +static u32 a650_get_speed_bin(u32 fuse)
>> +{
>> +       if (fuse == 0)
>> +               return 0;
>> +       else if (fuse == 1)
>> +               return 1;
>> +       else if (fuse == 2)
>> +               return 2;
>> +       else if (fuse == 3)
>> +               return 3;
>> +
>> +       return UINT_MAX;
> 
> Unlike some of the other functions, you don't need any complexity. Just do:
> 
> if (fuse <= 3)
>   return fuse;
> 
> return UINT_MAX;
I'd prefer to keep it open-coded, it's just 8150 and 8250 that have
these simple fuse values, other SoCs have random numbers (check A618/
619 above, for example).. Plus the returned values might as well be
made-up, as it's just for opp matching.


> 
> 
> I'd also suggest that perhaps "UINT_MAX" isn't exactly the right
> return value for when we have an unrecognized fuse. The return type
> for the function is "u32" which is a fixed size type. UINT_MAX,
> however, is a type that is automatically sized by the compiler. Though
> it's unlikely, theoretically a compiler could be configured such that
> "unsigned int" was something other than 32 bits. Ideally either the
> return type would be changed to "unsigned int" or you'd return
> 0xffffffff as the sentinel value.
That's out of the scope of this patch, as it concerns all the
speedbin-supported GPUs. The returned value feeds 1<<ret, which
should be capped a bit lower than UINT_MAX, anyway. But I can
look into that in a separate patchset.

Konrad
> 
> -Doug

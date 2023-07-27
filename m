Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F4B76577E
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 17:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0DA910E5AE;
	Thu, 27 Jul 2023 15:26:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3026E10E11C
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 15:26:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51ff0e3d8c1so1428451a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690471601; x=1691076401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=od4dDMOYFKmSK2nDsYcadLvFPYR/WS8PvJDqoO5zV3o=;
 b=MjDu5xGKr8AQ65AeTIuSEWC6NCB3lxLSX5axU+i4kloNTAnlLGR914i9H5wf5tu/el
 M1QZZpCRCVHCL6YtaXR1sVlG1JmTWg6DQ4H0CIv/c1c5Ff8wwjno7XOaXueWTdYQ9Qpv
 0EjV/mSCpaJ20i1uAICJZ9hDE2Ua1oleb2GA5vTCHv/G91+AIWAHiEvfTzO4S4WhHxfz
 DEIxlsPjuRWjdlSez2ZE4FBx+Q9hjgPZG8kkqksN2SI78ZQSnrVKnZYD1fhGEGkA4f2p
 +tXZsei/jr81irL3vLL7k4taj2xyL5aCob3fzUqXiF5YseK8BdoUgWyDzOKYZHLauDHN
 pC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690471601; x=1691076401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=od4dDMOYFKmSK2nDsYcadLvFPYR/WS8PvJDqoO5zV3o=;
 b=ezKWsX2qDJlRqPzcvDJ12HXcVSXRUEcsmiKG7N8JPbXKHurma+T/UZklX9E8sozkHb
 C7rx8am30J2F69LmNc3YTXnz6KQ2YtZbCO+besI2xc1C3i/S/MWGt6/1vEwYhsUuu6US
 5e9YXvWRcOCQHZY017KK4u6OPlr7rf7UC6fIboldit1GOUZVcMDrrulJ/F/KlsVzzDyI
 k9JWfROpUyvpPVlgaCMgk6/dvKeg9eVbY9l65ZwB6Z6n79riWVo+qzkN6/XwSwcStz4w
 0yk8G6O9wxxeLD83iVDw3nGCzbumpNnjRJCBfjNmsrKna434sPENNuMtYfg76ucmTNpF
 hQkQ==
X-Gm-Message-State: ABy/qLatm1zBoZwgXc3aRB1SXQoZ30U1iSMWU/wJBYWp4KeAIWgietj9
 1UZggKSXa92SVgNFj/xqjDhieg==
X-Google-Smtp-Source: APBJJlEGFYyBK6bCKx12cpjZBXzsD3OOLv2xWyhS9LwN4W/6FLop61ZQg6MU6dYQMuw8tUVaF+LjQg==
X-Received: by 2002:aa7:c25a:0:b0:522:1b93:4cf3 with SMTP id
 y26-20020aa7c25a000000b005221b934cf3mr1919071edo.27.1690471601584; 
 Thu, 27 Jul 2023 08:26:41 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a056402044400b00521d2f7459fsm766911edw.49.2023.07.27.08.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 08:26:41 -0700 (PDT)
Message-ID: <ddb70b1e-57bb-a72f-018a-75da62cedb3a@linaro.org>
Date: Thu, 27 Jul 2023 18:26:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-6-dmitry.baryshkov@linaro.org>
 <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
 <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
 <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 5/6] drm/msm/dpu: use MDSS data for
 programming SSPP
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/07/2023 18:24, Abhinav Kumar wrote:
> 
> 
> On 7/27/2023 1:39 AM, Dmitry Baryshkov wrote:
>> On Thu, 27 Jul 2023 at 02:20, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
>>>> Switch to using data from MDSS driver to program the SSPP fetch and 
>>>> UBWC
>>>> configuration.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
>>>>    6 files changed, 36 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> index cf70a9bd1034..bfd82c2921af 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> @@ -8,6 +8,8 @@
>>>>    #include "dpu_hw_sspp.h"
>>>>    #include "dpu_kms.h"
>>>>
>>>> +#include "msm_mdss.h"
>>>> +
>>>>    #include <drm/drm_file.h>
>>>>
>>>>    #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>>>> @@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct 
>>>> dpu_sw_pipe *pipe,
>>>>                DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>>>>                        DPU_FETCH_CONFIG_RESET_VALUE |
>>>>                        ctx->ubwc->highest_bank_bit << 18);
>>>
>>> Does this needs to be protected with if ctx->ubwc check?
>>
>> Yes... And it should have been already.
>>
>>>
>>>> -             switch (ctx->ubwc->ubwc_version) {
>>>> -             case DPU_HW_UBWC_VER_10:
>>>> +             switch (ctx->ubwc->ubwc_enc_version) {
>>>> +             case UBWC_1_0:
>>>
>>> The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
>>> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
>>> catalog for the encoder version in the first place? Because looking at
>>> the registers UBWC_x_x is the correct value.
>>>
>>> If we cannot find the reason why, it should be noted in the commit text
>>> that the values we are using did change.
>>
>> Huh? This is just an enum. It isn't a part of uABI, nor it is written
>> to the hardware.
>>
> 
> The reason is that, this switch case is moving from comparing one set of 
> values to totally different ones. So atleast that should be noted.
> 
> First thing that struck me was this point because the enums UBWC_x_x and 
> DPU_HW_UBWC_VER_xx dont match.
> 

Do you have any proposed text in mind?

-- 
With best wishes
Dmitry


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27F624BB3
	for <lists+freedreno@lfdr.de>; Thu, 10 Nov 2022 21:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCDB10E864;
	Thu, 10 Nov 2022 20:21:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8822C10E863
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 20:21:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a15so2230001ljb.7
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 12:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RE1ZPfOOMkFTJRsPaLh2a/8p9Ky7brLI2mjtWUnhvIU=;
 b=ZLbRJjSDhoU17vkT0JEuuvPOmTbk4IoXMGZIvXZ8p8FHI55PUrqBVTmkTfbYJ6+7Rz
 2pXIRKfXZtYrUgDDp1mxDGiyYxOQRt6Dov61UIrPUYGHB2WwEUAO+i8NSYkDFzOQu7hz
 aTLCom2m2CxW5qSWrP30eIz/U6tvb07lw/WUlQXV1/Gy7iSXKiHhZoSp3U5RuqZx2Odv
 zK8v5+SEKj1Qrl5QHN7H0jJ/Sx2g0u7ZWyP2Y1gpAb8AmsD7/CwCNWVj6/tykv8WbH3B
 12zzuXeWM6PR+YVJf/KkAmBkEk7Xyc9OLUCndyvvbwc+Iq+PO/6Vj6GvHK1owWOF68D3
 AiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RE1ZPfOOMkFTJRsPaLh2a/8p9Ky7brLI2mjtWUnhvIU=;
 b=SajcpwT9CuOtqvZBKo/8fz5pHiBLwyc6w8VhLx+pfSQJMdUDRnPSzYrDSglIS66p5/
 RFShijleg+NBUtQh4WZtaB4VheM8cf0dwwoJF5d0PpcgNKvFMXx4HY3jBD0vRN0LjMbJ
 Pfbay1xSrJv0QHXEpJzjo/e0jFiGmO2IUw0owOfK+77yZGgoIGTIpltnR+tSQ0mFqvoA
 2sIQrx8sJPbY+XmmMgB+nfYAMxrISmEjvDlalzICCHQ7JfusHelB9xDB+TPCBQk2Krqh
 WG4ox3OruvJrQSPlCtawDi4CmVIlxhX5a0k/lnTYLEJv5Ups4PFCjFrVFim1uLhXpdOS
 E/Hg==
X-Gm-Message-State: ACrzQf1HZ6k22Wy6Vwump1lAaxhN0PHezksC7dmkyCjctX98E6epkct4
 WNMjjqYcl97tpZOkESdhaXdXQQ==
X-Google-Smtp-Source: AMsMyM4sMRnEHSTwff8SGR2Q6I/T5vMDqoKpIMchh+5/G9OopKUdfo2OKHM9bAkUgMEiwowd3KUpsg==
X-Received: by 2002:a2e:9899:0:b0:277:8144:2eb6 with SMTP id
 b25-20020a2e9899000000b0027781442eb6mr8265779ljj.45.1668111668640; 
 Thu, 10 Nov 2022 12:21:08 -0800 (PST)
Received: from [192.168.1.112] (95.49.32.193.neoplus.adsl.tpnet.pl.
 [95.49.32.193]) by smtp.gmail.com with ESMTPSA id
 q21-20020a056512211500b004b3c505a71dsm10679lfr.92.2022.11.10.12.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 12:21:08 -0800 (PST)
Message-ID: <52fa0ebd-e431-7159-ef1e-a2cde7c7a4e2@linaro.org>
Date: Thu, 10 Nov 2022 21:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <b222a21c-a00f-8806-179c-f97bcb45c303@somainline.org>
 <5c791922-1371-c9e7-4bdc-e1909956633f@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <5c791922-1371-c9e7-4bdc-e1909956633f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP
 blackhole
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 10/11/2022 21:19, Dmitry Baryshkov wrote:
> On 04/11/2022 16:58, Konrad Dybcio wrote:
>>
>> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>>> these registers during snapshot.
>>
>> Must have been fun to debug..
>>
>>
>>>
>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 38aa38ab1568..4730f8268f2a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -92,6 +92,7 @@ enum {
>>>       DPU_MDP_UBWC_1_0,
>>>       DPU_MDP_UBWC_1_5,
>>>       DPU_MDP_AUDIO_SELECT,
>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>       DPU_MDP_MAX
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index f3660cd14f4f..95d8765c1c53 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>> msm_disp_state *disp_state, struct msm_k
>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>>> 0x3a8,
>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>
>> Are these values expected to stay the same on different new-gen SoCs? 
>> Maybe it would
>>
>> be worth making it dynamic.
> 
> I do not want to overcomplicate this. Let's make it dynamic once there 
> is need for that. For now I expect this will be static.
Let's roll with that.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>>
>>
>> Konrad
>>
>>> +    } else {
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +    }
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   }
> 

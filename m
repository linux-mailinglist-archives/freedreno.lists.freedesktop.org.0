Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139136D050A
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 14:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC36A10E2EB;
	Thu, 30 Mar 2023 12:42:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CBB10E303
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 12:42:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id y20so24364645lfj.2
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680180131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZMJJLrx8WpERmuOwE9D/mVr0vDV7iJCAwwMwlHp5vLk=;
 b=FGrnmQ1bP4vmkxp92zJIv3f12AnLOYfsfWTaBFCufnXxqk42xO5H+HtBBb4gVSD4KH
 IjbnyyktH/AywESUaBJVOeLZDXaeM6YFF0pJOLyXGy2mzEuqKK9X8x0nWza4gI+CVMYZ
 g0f/mOA4WtwnwROgIg8VxsnR1p/1R7FTPQ6vPGaUv6Jcg+A7rw/ysa/QuUktLoYq78PT
 oXQhry/zX3rj+Ld8wOM7l9phywe73W+f1h898Z6vMnax2cUEwuCQndcP/2Ve18jEw8nr
 u7ZzaBYvIkuxiR3S/xyIEfcK0aPNCzYWSBQaa28fbiUGkpXjweu5+Rwuh3Lrwt8x+msN
 2kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680180131;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZMJJLrx8WpERmuOwE9D/mVr0vDV7iJCAwwMwlHp5vLk=;
 b=vvMxgWft9ZHNWLClhFrTLJGNL6oTwjcnyooXQBch9HQDaoHVHlvNKjg//C7S/BC+65
 Ui7lXNzOn/xvjmvYVx19FK9xYnRiMzeg5TfIl+HhaMh24aiRfjYPozY6SEQGgIECNrjN
 Bz+GMd7AcD2BILQfNF/310xrJW5GakOkAW0lkXjoU6LOhY+/WxdlQfPDfKP8gwZY0qU/
 I1H5bHpBgWIAMpPZXM4ItxyKq6PUrgSTSADfSBLS7hk78DbdWwbDpPUD5N7hAP/iSyN9
 sx2lDnRfyRSTrMAXIsRye54lFBSby5gEoJQmWw3O9A7LJS7saSJ3JCefeI5S0n4HVmxY
 8Ynw==
X-Gm-Message-State: AAQBX9dmdegsWjw7MJfk+io+JK+6Utw9eyVNq/rdiSFH1NflCDcPoZ5E
 bRyaSZ/fs5Hait4Yrw32kKtolQ==
X-Google-Smtp-Source: AKy350bWtte7p/HWXqmuQ/gvAR5nGWte6AeqovBFSc2pFMBP2NPxf8wLZqNTsg5+bfCRMqigndVwZg==
X-Received: by 2002:a19:f007:0:b0:4dc:8215:5531 with SMTP id
 p7-20020a19f007000000b004dc82155531mr6563744lfc.6.1680180130903; 
 Thu, 30 Mar 2023 05:42:10 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a2e321a000000b002934febffe4sm5900189ljy.128.2023.03.30.05.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:42:10 -0700 (PDT)
Message-ID: <3bd39042-f608-f24b-b25b-71dace673e0a@linaro.org>
Date: Thu, 30 Mar 2023 14:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
 <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
 <60073c65-1df3-69f8-4755-798fe26a0905@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <60073c65-1df3-69f8-4755-798fe26a0905@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [v2,
 38/50] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 30.03.2023 14:38, Dmitry Baryshkov wrote:
> On 30/03/2023 15:33, Konrad Dybcio wrote:
>>
>>
>> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>>> Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Could you point me to where it's specified downstream? I can't find it.
> 
> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/77276ed6a0055a4a0f41d7b0395a8b0bbcafd091/msm/sde/sde_hw_catalog.c#L2341
> 
> Which says assign DSPP to LMs for as long as we have a spare DSPP
> 
>>
>> Also, deserves a Fixes.
> 
> This is a tough question. We have been using sm8150_lm for sm8[2345]50. So before "drm/msm/dpu: duplicate sm8150 catalog entries" there is no way to fix that.
If your concern is about stable backports, fixes tags denote that a bug was
fixed and do not imply a patch needs to be backported, it only works as a
hint for the stable scripts. "please backport this" is expressed through
Cc-ing stable.

Konrad
> 
>>
>> Konrad
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> index a3faaab2226c..3d95f2472e7a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>> @@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>>>       LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>>>           &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>>>       LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
>>> -        &sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
>>> +        &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
>>>       LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
>>> -        &sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>>> +        &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
>>>       LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
>>>           &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
>>>       LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> 

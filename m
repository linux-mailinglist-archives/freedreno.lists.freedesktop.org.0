Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1E6D10E2
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 23:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E49010F037;
	Thu, 30 Mar 2023 21:32:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5036B10F037
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 21:32:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id k37so26363889lfv.0
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680211949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aTqJwL7oBiO+i/ddIgWkEiFhacs+3OCWtKXm1Tp67Cs=;
 b=OVuKVEb7pgKQF3vr0EZSfol5Mig2ns7Yk/XprlTV1hA7JdOoQY9G+bTWfz06E6sbp3
 1Tlz81N4K6++tgWAQo1Ca1WD1NRidQBpa01VzgKDXWxjjF0UKLI1WZ8mV1RBaG5ybUSQ
 SgmZGPPbIcz5acSGalsZEsWxzVUbo/h7wkZCh+RC+LruyquKXLnhgNuPstIwU9wlhZzb
 g6ZNjqO+xKWjuPZmqIQ2/GJS4o0CjyW49TWoL9XDvrv/YIeZvWed0sM2IRjeDqErplSX
 eQo+8GaQXobpVk7AWl2UK6CjOIKnbEYp6w5STq2Vk6Av/Dfq5Z0bkHKthJgAjxyu7TaB
 a5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680211949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aTqJwL7oBiO+i/ddIgWkEiFhacs+3OCWtKXm1Tp67Cs=;
 b=yg+Kkid9pNc+hEg1MI/mIy9xvB44u1Ifi9o5R7FotktsGjwfwSdS82SfdHRvzn1UV7
 JJZP11cV7J8OmB6rLVdjwCGFFl74G79rLLvrTa2NZjSnvpcKdA06dgNMbo78RnFTUylp
 JoHelOVz4W867z0J9+7PYPmjkGkg1H6gxeSKEGXyiatADCIJ97b1s65nEBesurQ/R6B0
 BT9n8P488czFez8mFBkJrocc5Z1CMM7xX1r0Lf7wxUX3Ps3m6Sphg8rK0LuDK2j8AO1m
 wVr1Arr46T7kqD91c4NNcjwNyGRvkfWsb43CDq82qc34eHIO+N/QLka8d04vDg7ajaB7
 NQew==
X-Gm-Message-State: AAQBX9enWwutXwW8FsKaY40qGG2xfWlrth/ISmseeOljk6IcLkhebxfR
 m7xclgygcrvIHUBMWEoquHte0w==
X-Google-Smtp-Source: AKy350ZGflQvaIlYJPAclGpHbzprCG3zHk+Wm/YCGsHyvM4odrKaN0sSrPL+HGoNMk0vnKUo3BdjQA==
X-Received: by 2002:a19:2d1c:0:b0:4d8:86c1:4785 with SMTP id
 k28-20020a192d1c000000b004d886c14785mr2188004lfj.26.1680211949367; 
 Thu, 30 Mar 2023 14:32:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r25-20020ac25a59000000b004cb45148027sm94871lfn.203.2023.03.30.14.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 14:32:29 -0700 (PDT)
Message-ID: <63fd5b75-e4a4-0d15-db9e-461a8f4a1cd9@linaro.org>
Date: Fri, 31 Mar 2023 00:32:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-38-dmitry.baryshkov@linaro.org>
 <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6ca39767-09c7-3323-bde3-52824d81ca41@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [v2,
 37/50] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
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

On 30/03/2023 15:29, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Theoretically since sm8150 we should be using a single CTL for the
>> source split case, but since we do not support it for now, fallback to
>> DPU_CTL_SPLIT_DISPLAY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> Hmm.. so is it a software construct? E.g. "pass half of the data to
> each of the INTFs and tell them to cooperate"?

It is not a fully software construct, if I understand correctly. You 
have to program either a single CTL or two CTLs for a flush.

> 
> Apart from that, since it's temporary, I think it deserves a comment
> reminding us to fix it eventually™

Sure, this is, I think, a next item on my plate after getting all of 
wide planes and catalog in: to rework CTL support for sm8150+.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> index a3a79d908451..094876b1019b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>> @@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>>   	{
>>   	.name = "ctl_0", .id = CTL_0,
>>   	.base = 0x15000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>   	},
>>   	{
>>   	.name = "ctl_1", .id = CTL_1,
>>   	.base = 0x16000, .len = 0x204,
>> -	.features = CTL_SC7280_MASK,
>> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>   	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>>   	},
>>   	{

-- 
With best wishes
Dmitry


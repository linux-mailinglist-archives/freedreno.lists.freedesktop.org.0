Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D436944A9
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 12:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA67610E56D;
	Mon, 13 Feb 2023 11:38:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B67710E56D
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 11:38:37 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n10so4154033ejc.4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 03:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r8vF+glCGL/TIHZAeFd6umlQYUbpkh549EdL910Nq6g=;
 b=pbzrgTDa/e/4xlg4PGDTCGTOAIrar5NNyj1XRDqVj2OW2kFztgpd8dfuWPW2mMUB5/
 Kam3Hmw6s1u9RG7HZC8au2k//hLg4JZ+MdamafPtasioKUV8usFJ+bR+VDvQZSuTDc8c
 DTQCRhiuXbjC6otr2LbJS9OWT5S7jNCs+X2eCIzRzyhdOnPm5rzYZBroC5YSQGpCQzMR
 KQYXwL0XuYBbZiHOnjZkRocRjs5WQnddxMVHQaJtbPZUzz2lnE000ZBWOg04wz6tXkAb
 rTgkgL0CfKG2SfKyeioa/MzemDIdfpFlwBjHMCs5qdhfbukBEnQD8tHbuD8DkDTKEUgi
 YIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r8vF+glCGL/TIHZAeFd6umlQYUbpkh549EdL910Nq6g=;
 b=3DtYTP1qrNo6BfSy2ztwnX38AsZn80LuzF+E2NQJ7folmmh8OTvPhjNtmWma5ibAj3
 XftbCP9FAvKemBz61qPh+l4ejeXRbq7V01hD4fx2lk2yGpoBvNMEbNlXYs61S28zuMKr
 8Rz/ibXb5yKlBiiQZLBcg9QqxuTYnsK83o7fl33a1bgHXUi8ZrGRVTeOobD9KYLwfMoA
 kvnyh8qGT0xywihpcHrqa4UR/AttOeXrY8kgqjWSImP7fT+EeJntutLC/XL26X11/rBP
 dyDzLe8BSgiCJZcybmSM5aYwJRnAr6c/JqKs7kAmDaSg+RNlu2pBujVwrOYWuNWJLdlx
 qH6Q==
X-Gm-Message-State: AO0yUKVsMZFfi5GegQcz/0Wnj38359L0KXsTepO+HLJfH9GMfdp9zk8T
 vkgPmjrxKGS5/HXuCMmhZwEGhA==
X-Google-Smtp-Source: AK7set8vw+ntyrLewHqJOjyeT2fk0N1lSDwSYCQMzlHCi7qiYZ98Cc2LOazfM4b9+yhsYZF/cbKmtA==
X-Received: by 2002:a17:906:9b96:b0:8af:370a:c1f8 with SMTP id
 dd22-20020a1709069b9600b008af370ac1f8mr20437423ejc.23.1676288315728; 
 Mon, 13 Feb 2023 03:38:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a1709065e0800b0087fa83790d8sm6755316eju.13.2023.02.13.03.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 03:38:35 -0800 (PST)
Message-ID: <e6653ceb-bce1-9552-019d-278f455ba8a5@linaro.org>
Date: Mon, 13 Feb 2023 13:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-6-konrad.dybcio@linaro.org>
 <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 05/10] drm/msm/dpu: Allow variable
 SSPP/INTF_BLK size
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
Cc: freedreno@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 13:12, Marijn Suijten wrote:
> On 2023-02-11 13:26:51, Konrad Dybcio wrote:
>> These blocks are of variable length on different SoCs. Set the
>> correct values where I was able to retrieve it from downstream
>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>> intf) otherwise.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 242 +++++++++---------
>>   1 file changed, 121 insertions(+), 121 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 802050118345..d9ef1e133c1e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> [..]
>> @@ -1848,10 +1848,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>>   /*************************************************************
>>    * INTF sub blocks config
>>    *************************************************************/
>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
> 
> Dmitry and I discussed in #freedreno to instead add the INTF_BLK_DSI_TE
> macro that accounts for the INTF TE registers using this higher register
> area, as well as an extended signature to configure extra interrupts.

Yes, that's still the plan. It's slightly painful that we are touching 
this are simultaneously.

> 
> (Besides, I think the len is currently only used for snapshot dumping
> and no validation for out-of-blk reads/writes)

Yes. Because in most of the cases non-existing registers seem to be RAZ/WI.

> 
>>   	{\
>>   	.name = _name, .id = _id, \
>> -	.base = _base, .len = 0x280, \
>> +	.base = _base, .len = _len, \
>>   	.features = _features, \
>>   	.type = _type, \
>>   	.controller_id = _ctrl_id, \
> [..]
> 
> - Marijn

-- 
With best wishes
Dmitry


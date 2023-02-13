Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E154694A31
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 16:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A72210E5E4;
	Mon, 13 Feb 2023 15:05:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9615410E5E4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 15:05:17 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n10so5673776ejc.4
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 07:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oXOmuQpMwFH/B4axgmO48iMJUN2ivWFM2F65C3j3620=;
 b=qQpacBq7NBmt+Iw5lDyJvHs51VgJz/17PpxAB6Q3/U/iDG2w/aOM5OZCk0z3wVrt5k
 14ZiQERQKLmANV6XWMnG0I2M11rBb24uCxBefWVO74rulRwRjyfqUvU5HIPlMRALD772
 IQOwHzVUFmcfXJXeHwM0U0poBSKsHimlbysdHJVQed3ZGOzKLovYqdjXsYORlCex4Asz
 X552vxuQrf5oyam7Ib613WSdxL+awmEgBFSELQvCiaYO3a1VGbDhm9Nsjb7Ye1QZ5m/u
 T8R+ynmX2NTl91mpJfAtObU8OGClVA3ZNVjLlRrLHlZkfBhNaWAakB979ugxw5KVf/qn
 xp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oXOmuQpMwFH/B4axgmO48iMJUN2ivWFM2F65C3j3620=;
 b=pZMDn2HhXi2fbcK/cRT9P+YUFENl8zrkF7wUHJ4NsnXCWK4TXxX3Qs+Sh8rIzITKXl
 VCljUMaqMzmR0LlQoJ1bOh40HCg34k2TByrSU9e0+UfTWR1BlL1c1aK0OScCARh8hMfM
 NTY0LTyt1HgnPcdnU2c2O69qWA5iBKWgMstML61FiUetlFmrAyNvLFjwLXZhJjsaw+6d
 WgVYS+3DBmQrD3v+hRYNblFSELYVBxEruSWHISvJAFCINWxuDOgmehXxIwYfTx5LiKhK
 h26dxexDUfuUCobExqwi/VrgAdOfFPcY4yBFR0k/kzr226qkNX1hEqJXeDk6eCIMFMZq
 Mlxw==
X-Gm-Message-State: AO0yUKW0KPUgnngyQ4OWZV9Pw2+Fp5RK3re1WWrL1D7gX60ocp/I0o0B
 xWYtMyPv+GJGpdytzXwfPYR+Cg==
X-Google-Smtp-Source: AK7set8ak7Vpr70aH/JFGBOVh5vkZ0AWJD04GxE/bkytBdUPhoxoPZHDY7glyBQEfhhxTMVcwyuV5w==
X-Received: by 2002:a17:907:a804:b0:8a6:5720:9101 with SMTP id
 vo4-20020a170907a80400b008a657209101mr28374752ejc.4.1676300716075; 
 Mon, 13 Feb 2023 07:05:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bo13-20020a170906d04d00b008874c903ec5sm6914103ejb.43.2023.02.13.07.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 07:05:15 -0800 (PST)
Message-ID: <6ad96cff-b91b-a4c7-4573-7bb8de7194f8@linaro.org>
Date: Mon, 13 Feb 2023 17:05:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-6-konrad.dybcio@linaro.org>
 <20230213111220.ietr4aro6xu4emtu@SoMainline.org>
 <e6653ceb-bce1-9552-019d-278f455ba8a5@linaro.org>
 <20230213143148.qvyagudd3qm5jgwd@SoMainline.org>
 <e3c1a048-a9e1-53fa-5a19-cba62e8b1580@linaro.org>
 <20230213150226.du27ocydnyrkvuin@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213150226.du27ocydnyrkvuin@SoMainline.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/02/2023 17:02, Marijn Suijten wrote:
> On 2023-02-13 16:40:56, Dmitry Baryshkov wrote:
>> On 13/02/2023 16:31, Marijn Suijten wrote:
>>> On 2023-02-13 13:38:33, Dmitry Baryshkov wrote:
>>>> On 13/02/2023 13:12, Marijn Suijten wrote:
>>>>> On 2023-02-11 13:26:51, Konrad Dybcio wrote:
>>>>>> These blocks are of variable length on different SoCs. Set the
>>>>>> correct values where I was able to retrieve it from downstream
>>>>>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>>>>>> intf) otherwise.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>> ---
>>>>>>     .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 242 +++++++++---------
>>>>>>     1 file changed, 121 insertions(+), 121 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> index 802050118345..d9ef1e133c1e 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>> [..]
>>>>>> @@ -1848,10 +1848,10 @@ static struct dpu_dsc_cfg sm8150_dsc[] = {
>>>>>>     /*************************************************************
>>>>>>      * INTF sub blocks config
>>>>>>      *************************************************************/
>>>>>> -#define INTF_BLK(_name, _id, _base, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>>>>>> +#define INTF_BLK(_name, _id, _base, _len, _type, _ctrl_id, _progfetch, _features, _reg, _underrun_bit, _vsync_bit) \
>>>>>
>>>>> Dmitry and I discussed in #freedreno to instead add the INTF_BLK_DSI_TE
>>>>> macro that accounts for the INTF TE registers using this higher register
>>>>> area, as well as an extended signature to configure extra interrupts.
>>>>
>>>> Yes, that's still the plan. It's slightly painful that we are touching
>>>> this are simultaneously.
>>>
>>> Should we (Konrad) then drop this patch as there's no need to add these
>>> (mostly RAZ/WI) registers to the dump until my INTF TE series starts
>>> using them?  That'll make rebasing easier on everyone too.
>>
>> RAZ/WI is for not present registers (read-as-zero/write-ignore). I think
>> that the growing register space is getting populated with registers
>> (which we have been ignoring up to now).
> 
> They are, but not until my INTF TE series lands; hence again the request
> to drop this patch until that happens?

I see nothing wrong with including them into the snapshots.

Dropping this single patch will still result in the huge amount of 
rejects. So, let's get your INTF TE done, I'll rebase my work on top of it.

-- 
With best wishes
Dmitry


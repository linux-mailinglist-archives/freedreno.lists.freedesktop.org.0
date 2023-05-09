Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0786A6FC16A
	for <lists+freedreno@lfdr.de>; Tue,  9 May 2023 10:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACF310E353;
	Tue,  9 May 2023 08:12:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5DA10E351
 for <freedreno@lists.freedesktop.org>; Tue,  9 May 2023 08:12:17 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ac7462d9f1so61297391fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 09 May 2023 01:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683619935; x=1686211935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5XmVgWUkbGZmH29o+XZsTCuQqgOysUDCxIShsao+BgM=;
 b=htBUkBschRRomgR3PiEMWZoBNU9slAbP0wxrXrJjfIEspJ6Q+lQONSshDs8J6Rr4iS
 TBxQYxNao2FfSB3G/52eUf7IrwLx43h3VdpphWbAlkyh9Y/21IfxHoRlml65YIAm95HE
 z3qhfTNjaHXLtGAeWZAmN04nfEWBuM+N3RWEaqZkYhbuMuavEd+voV63g/U8xeKVXrD+
 x37o1A0k7U5jKr+3n3l0nuU3j5uICGA1ThsBBPL3xnskBviTvdddnJoglPY1a7zNrS1N
 YbrvOrEiqMztykgsKmtNagPTCBEumAIbwiTlP/+2ips/105gEcJRUcB9Hx4REqiJ/cr0
 vh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683619935; x=1686211935;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5XmVgWUkbGZmH29o+XZsTCuQqgOysUDCxIShsao+BgM=;
 b=Sq0zLdhK5ZL0iMHmc2YZ1KcAD8rQLr9y0hAMGNMjpCBjg24yKugu0Xf9Ef1PWFuDqy
 cURJNtDkiWqoPbSrqm4nMm6H9YLcr8NTxEfalbLFxsNfVo62LipRfxEj8Zek4jsf3UYX
 GZREXGtJgTubVbV0NNgGhznvm4JbvOkUKjMj7bA+Rg3WQ35Ppu4Qf1lQoyckubfXiTOk
 dcuZrDzSchR1bNDOUbw7qLMS2u3O9FQ9QjJKyZmAYLbXV65D3puFABdtQLGAxtvUCG1M
 zcbQj4RrOgQo5PpzaoSoo8KfjHZEDJJkqsv3I+12KLSHiLwg5snk7RYMQmSEhjYu/XvU
 H27Q==
X-Gm-Message-State: AC+VfDwBrxX89ZuTztfAio95v2DXVICOQGS7TN+l43U9nnZPLTEsOsTc
 FzHU7LUaBf2b02YP5YvYi5cafw==
X-Google-Smtp-Source: ACHHUZ7h8aaZAMor4jHygqzrp/yoUgufiF6uxaXuQ5T+wYdTfkV23g5TLxZA0j9mSHHfKJWz5zMgig==
X-Received: by 2002:a2e:90ca:0:b0:29a:8580:8140 with SMTP id
 o10-20020a2e90ca000000b0029a85808140mr655790ljg.3.1683619934926; 
 Tue, 09 May 2023 01:12:14 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a19ee0c000000b004eb42f5367bsm263799lfb.19.2023.05.09.01.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 01:12:14 -0700 (PDT)
Message-ID: <8a4716dc-440b-e061-3074-fca9689289e7@linaro.org>
Date: Tue, 9 May 2023 10:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
 <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/dsi: Fix compressed word count
 calculation
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 9.05.2023 01:27, Dmitry Baryshkov wrote:
> On 08/05/2023 23:09, Abhinav Kumar wrote:
>>
>>
>> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>>> Currently, word count is calculated using slice_count. This is incorrect
>>>> as downstream uses slice per packet, which is different from
>>>> slice_count.
>>>>
>>>> Slice count represents the number of soft slices per interface, and its
>>>> value will not always match that of slice per packet. For example, it is
>>>> possible to have cases where there are multiple soft slices per interface
>>>> but the panel specifies only one slice per packet.
>>>>
>>>> Thus, use the default value of one slice per packet and remove slice_count
>>>> from the word count calculation.
>>>>
>>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to compute word count")
>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>           if (!msm_host->dsc)
>>>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>>>           else
>>>> -            wc = msm_host->dsc->slice_chunk_size * msm_host->dsc->slice_count + 1;
>>>> +            /*
>>>> +             * When DSC is enabled, WC = slice_chunk_size * slice_per_packet + 1.
>>>> +             * Currently, the driver only supports default value of slice_per_packet = 1
>>>> +             *
>>>> +             * TODO: Expand drm_panel struct to hold slice_per_packet info
>>>> +             *       and adjust DSC math to account for slice_per_packet.
>>>
>>> slice_per_packet is not a part of the standard DSC, so I'm not sure how that can be implemented. And definitely we should not care about the drm_panel here. It should be either a part of drm_dsc_config, or mipi_dsi_device.
>>>
>>
>> This is not correct.
>>
>> It is part of the DSI standard (not DSC standard). Please refer to Figure 40 "One Line Containing One Packet with Data from One or More Compressed Slices" and Figure 41 "One Line Containing More than One Compressed Pixel Stream Packet".
> 
> I have reviewed section 8.8.24 and Annex D of the DSI standard.
> 
> It is not clear to me, if we can get away with always using slice_per_packet = 1. What is the DSI sink's difference between Fig. 40.(b) and Fig 41?
> 
> Are there are known panels that require slice_per_packet != 1? If so, we will have to implement support for such configurations.
At least two different ones on expensive Xperias (souxp00_a+amb650wh07 and
sofef03_m)

Konrad
> 
>> This has details about this. So I still stand by my point that this should be in the drm_panel.
> 
> Note, the driver doesn't use drm_panel directly. So slices_per_packet should go to mipi_dsi_device instead (which in turn can be filled from e.g. drm_panel or from any other source).
> 
>>
>>>> +             */
>>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>>
>>>
> 

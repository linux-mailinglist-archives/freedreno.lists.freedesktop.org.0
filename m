Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5576C879
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 10:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4EC10E522;
	Wed,  2 Aug 2023 08:39:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4047210E526
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 08:39:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-317b31203c7so918549f8f.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690965593; x=1691570393;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WRAP0HWhn6g/kOzKMWD911kOSk1jcneyHwYZl0WYjRQ=;
 b=zjxvc+i/DMwy1ldffwestytA9zQ9YS0gCIeUp8PCaYqnMRm0KdoXXjQaiLjlmVNd4R
 V9MlqPOtLLrS5A8JldTm24Y4SUL3Q/fbST66sPcPKUa7FlLcnbHIstHpy1qKRAfzEIcH
 lWzUqvT4+c3diBNyjapbUqGjGLy+6J+B4XAysz/sviUq2oKPjjVzspVzhN5fkrsPO7S/
 gsrNFKoV3BUklHuINdw0XifiiigWRFl+oINrXKVd1P9v3qESnDUt8MmAsmnBiOBMPhA8
 tTG1VSsi4f5KTXhU1Jd22P/IB1ra3DG+yYW/39m6Ue2zFdFV8+PUgo8hjAnBqUjLIOCV
 LNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690965593; x=1691570393;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WRAP0HWhn6g/kOzKMWD911kOSk1jcneyHwYZl0WYjRQ=;
 b=PRm4qb4FPYLJFysDd0KAIqAZzrzKJ8Yx8YFhonhRIen6BkmX8t/bvxy2SmjQnYD8T9
 eve/Bb4hzK9upm8F15dvXRrs4+nEahGq8eF+nmRnOoI94RwescgzmUe3dOWOmvNr1LlT
 f4HXRNl17LCF+yOSZEMoSkZvtSWprDBaFEKpG19Bo9CRE0YctOhsc1Gi93XmxLWpp5pJ
 ko9O37Cnv40VscS3oOOXVDBiMTveMN8Ghb34TLPcdgULUC9I7XnLzAdxqHvHhdu8jVxL
 m+F61UGqWzXpnqsMXnRoZ8dF+RRqfoOQTk91mECNmEMZUiREFpa0oimKx/gkUfQSJSNS
 LEiw==
X-Gm-Message-State: ABy/qLa8Ayux2YaHP7XY06Ne1dAzSulOWPgWAMkHUoY6Amtu9N2klJui
 73pRavpGMrkeFuTmOZ8QcXKBWw==
X-Google-Smtp-Source: APBJJlGt/JMMR519d7Jukm0qKi7EMlBz8mwUobaLaXQQYxBaB55wp9ApOuo9C23hQVRgAF3YcFVuYA==
X-Received: by 2002:a5d:4e0a:0:b0:317:5747:b955 with SMTP id
 p10-20020a5d4e0a000000b003175747b955mr4465403wrt.17.1690965593557; 
 Wed, 02 Aug 2023 01:39:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfce92000000b0031272fced4dsm18264016wrn.52.2023.08.02.01.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:39:52 -0700 (PDT)
Message-ID: <51d782c4-3539-c3d3-6844-d6b9a39c09eb@linaro.org>
Date: Wed, 2 Aug 2023 10:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230403221233.500485-1-marex@denx.de>
 <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
 <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
 <CAA8EJppbdiUz5m+9EAPnFb916DaS_VKWd30c7_EPWjuid8rtqQ@mail.gmail.com>
 <CAMi1Hd2G5PJmz4wpO1wbdqKd0FA8LBgvRDv2u5ZYAMb5s6Kt0A@mail.gmail.com>
 <d5fb8106-b8f3-0acf-1267-d4d6d0860e25@linaro.org>
 <d28b0090-bd1e-6737-d92b-348dc6c30750@linaro.org>
 <4396d197-f16f-92bd-727c-eb8c78016198@quicinc.com>
 <961b4747-c9f1-a31c-c33c-475b4803f832@denx.de>
 <64c3352f-c2aa-5260-c6ff-4a607ce219a2@quicinc.com>
 <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <f768950b-0406-1f03-86a5-50d5794bb060@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/2] drm/bridge: lt9611: Do not generate
 HFP/HBP/HSA and EOT packet
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
Reply-To: neil.armstrong@linaro.org
Cc: Robert Foss <rfoss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Marek,

On 13/07/2023 20:28, Marek Vasut wrote:

<snip>

>>>
>>> MIPI_DSI_MODE_VIDEO_NO_HFP means the HBP period is just skipped by DSIM.
>>>
>>> Maybe there is a need for new set of flags which differentiate between HBP skipped (i.e. NO HBP) and HBP LP11 ?
>>>
>>
>> No, the section of the MIPI DSI spec I posted below clearly states there are two options:
>>
>> 1) send blanking packets during those periods
>> 2) transition to LP11 during those periods
>>
>> There is no 3rd option in the spec of not doing both like what you are suggesting. So DSIM should also be only transitioning to LP11 during those periods if its not sending the blanking packets with those flags set.
>>
>> So, there is no need for any new set of flags to differentiate.
>>
>> The flags and their interpretation is correct in MSM driver. I cannot comment on what exactly DSIM does with those flags.
> 
> How do you explain the comment in include/drm/drm_mipi_dsi.h:
> 
> 128 /* disable hback-porch area */
> 129 #define MIPI_DSI_MODE_VIDEO_NO_HBP      BIT(6)

Can you specify how you determined those flags were needed on DSIM ? a vendor tree ? a datasheet ?

In the meantime, we should revert this patch because it regresses some Qcom
based platforms until we figure out what's missing to make DSIM based boards
happy.

I'll send a revert change afterwards.

Neil

> 
> Esp. the "disable" part. That to me reads as "don't send HBP packet".
> 
> Where do you see that quote above in the DSI spec (which chapter and which version do you read) ?
> 
>>>> It should be replacing those periods with LP11 too.
>>>>
>>>> The traffic mode being used on this bridge is MIPI_DSI_MODE_VIDEO_SYNC_PULSE which is "Non-Burst Mode with Sync Pulses".
>>>>
>>>> As per this traffic mode in the DSI spec,
>>>>
>>>> "Normally, periods shown as HSA (Horizontal Sync Active), HBP (Horizontal Back Porch) and HFP (Horizontal Front Porch) are filled by Blanking Packets, with lengths (including packet overhead) calculated to match the period specified by the peripheral’s data sheet. Alternatively, if there is sufficient time to transition from HS to LP mode and back again, a timed interval in LP mode may substitute for a Blanking Packet, thus saving power. During HSA, HBP and HFP periods, the bus should stay in the LP-11 state."
>>>>
>>>> So we can either send the blanking packets or transition to LP state and those 3 flags are controlling exactly that during those periods for MSM driver.
>>>>
>>>> If you stop sending the blanking packets, you need to replace that gap with LP.
>>>
>>> I don't think that's what MIPI_DSI_MODE_VIDEO_NO_HBP means, the way I understand MIPI_DSI_MODE_VIDEO_NO_HBP is that it skips the HBP completely. So if you want HBP, then do not set MIPI_DSI_MODE_VIDEO_NO_HBP . And if you want LP11 during HBP, that is I think up to the controller (or maybe another new flag?).
>>>
>>
>> No, there is no need of another new flag. There are only two options as per the spec.
>>
>> In fact, as per my checking with more folks, requiring LP11 during those periods is something very rare.
>>
>> Because usually horizontal period is usually a very short period, most of the time we do not use the LP11 option and send the blanking packets instead.
>>
>> So its something very unusual for DSIM.
>>
>> That being said, I still think my previous question is important.
>>
>> 1) What is the difference between the resolution you are trying Vs what Amit is trying?
>>
>> 2) Are you both using just standard HDMI monitors?
> 
> What is a "standard HDMI monitor" ?
> I use DELL U2713HM .
> 
> [...]


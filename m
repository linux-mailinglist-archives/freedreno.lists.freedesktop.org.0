Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABEF5179AF
	for <lists+freedreno@lfdr.de>; Tue,  3 May 2022 00:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0D510F00A;
	Mon,  2 May 2022 22:02:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286D910F00A
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 22:02:45 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s27so20020893ljd.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DRg345qlmHZAutVgm3n8hsU+OaMYpjvZXMdM8MOZnjo=;
 b=ga3FaG/X/ohjFMc4Jujlc2ehmmBpUcz2YJkY3fsJ2gyyb7p5hEbT98qbNLFwL8OYp4
 RE6Q1ZWxI2k5jUmRfvnLsWAn7XmAo9br8fsMyjpckUVbYialm6bA9iuxQWNywMB7IW4A
 z6GinRfsS7w52iylRW23sd/cvPHWm86Fsk7OSbkRmZVkiXJRHs2irI+h2hj+Fn34QgDl
 LK2WF+scf4icvuUIe7tYyegROsLIw4YfQA7k1u8vFEctfDHb6sORERCBpcVrVT/qS35d
 LY9E0FucDPXtrMsCmaPWF7c6QmcpFnOmAHi4174dVN5CXEcQDdPIrdchKzV8w4Ca7leK
 3qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DRg345qlmHZAutVgm3n8hsU+OaMYpjvZXMdM8MOZnjo=;
 b=Pe7p667ujZcVlywXnyvNTUW0+pqs/CrO2wN6CJalPulqzdE1mrTMynAI/GgSfph6dj
 qT3TngOCT6lHQh3eysM5z3UrkGVYC4XlsTh19w4RwJqXBDcWy8tK7i+ToP0tQMxRE/be
 ocBf5fL5ISIGM4eD+rJ9IGqiV77Xa7ZQ7lT85UYHD3c5HfH0G2RkwQ5KPS6/KFGm5/jx
 i/bjZzXsHl1YoliHIVUbdQTd8KwYseIkpQkOgPbacdzqWiGhJN731yEBjk3EpFrOLw4y
 rMiWPPxUcZq9nBT1ia43BfmmG5X1MTCIdQ7zd82ADkaRjRMW7BmqTvgH+ugnBxhs7qgw
 FyLw==
X-Gm-Message-State: AOAM532PkTRYouSs0KTXdnQkImdQd8ff2izohwIP+uuR9EXBqKIUYCcv
 wAGjKIwNUduzWTBfLXTkfGRXFw==
X-Google-Smtp-Source: ABdhPJy6WNB6x1qrzJ4sPQwweY1VOjh4o2BX1ltnVAoPkxi15Di0ZVsfPq77IUaAOO6EguhKxxYqzQ==
X-Received: by 2002:a2e:8317:0:b0:24f:1578:2872 with SMTP id
 a23-20020a2e8317000000b0024f15782872mr8548271ljh.129.1651528963403; 
 Mon, 02 May 2022 15:02:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g9-20020ac25389000000b0047255d21127sm803876lfh.86.2022.05.02.15.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 15:02:42 -0700 (PDT)
Message-ID: <f01f5ace-4ae9-2b65-2ce8-fb2cdc0a5af1@linaro.org>
Date: Tue, 3 May 2022 01:02:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
 <20220502214235.s5plebunh4ttjhge@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220502214235.s5plebunh4ttjhge@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: pll_7nm: remove unsupported
 dividers for DSI pixel clock
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2022 00:42, Marijn Suijten wrote:
> On 2022-05-02 13:47:51, Stephen Boyd wrote:
>> Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
>>> Remove dividers that are not recommended for DSI DPHY mode when setting
>>
>> Is "DPHY" intentional or just "PHY" should be here?
>>
>>> up the clock tree for the DSI pixel clock.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
>>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index 6e506feb111f..66ed1919a1db 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>>                  snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
>>>                  snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
>>>                  snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
>>> -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
>>> -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
>>>
>>>                  hw = devm_clk_hw_register_mux(dev, clk_name,
>>>                                          ((const char *[]){
>>> -                                       parent, parent2, parent3, parent4
>>> -                                       }), 4, 0, pll_7nm->phy->base +
>>> +                                       parent, parent2,
>>> +                                       }), 2, 0, pll_7nm->phy->base +
>>>                                          REG_DSI_7nm_PHY_CMN_CLK_CFG1,
>>> -                                       0, 2, 0, NULL);
>>> +                                       0, 1, 0, NULL);
>>
>> Can you followup with a patch to move to clk_parent_data instead of
>> strings?
> 
> Dmitry and I discussed this a while ago, and I actually have patches in
> progress converting this.  Dmitry, if you haven't started on the
> conversion yet, perhaps it's efficient if I respin my efforts and submit
> them soon?

Yes, please. I'm under the pile of other things. Your patches will be 
appreciated. You don't have to convert all PHYs at once.

-- 
With best wishes
Dmitry

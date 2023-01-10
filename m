Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB78F66377A
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 03:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B0810E526;
	Tue, 10 Jan 2023 02:47:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B926F10E48A
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jan 2023 02:47:05 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bt23so16102551lfb.5
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 18:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bCGReu6BhHpZPkahX++p/sbhZefSv34nwSDLtTcR7Y0=;
 b=AGo2HHDK1Y+RhNaESKLUM8LCEULI4l08oL8x86AxMngcpbq4H++7juvyX7r5VqvTp1
 7cfrzyIg10AAyYqoo0ZJK9is5GrR36VC/leSgwPK1eW/y/Wl7g+BNs02J6hx/NFwrAVT
 lO9/Zqc1gtVKvTsAAvhk83JuNZray0DuLalGgn9GIYlgBPJPLlwA1oAKFU8PCAPRnLyY
 U6KOVJSwxvG/PzwmGI7MC2+sxsXlZanYNy+qcrjkAieXPgQ2sj6A/ZDJTp1FhFhg6Apj
 Xd5ZQrH0TbfOCMJHgBGEvJFhxJuBs5El9mJAMUrwzRVcKf2kg0WA5g6AJer0Wa9pxtIf
 SoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bCGReu6BhHpZPkahX++p/sbhZefSv34nwSDLtTcR7Y0=;
 b=LY+JKi/oO2i79RT1Sg1bwTuhR1qb5xP8ZVKY0LweFmD5vLWZobBSng9vcmQZ+9XDUZ
 7dTMtN0ge+nWf7K5EIahk/8xoy+5J+BeRoR6cPF/zZBbxzcQgu1ny8tCDU161IyAAoPQ
 3FvB/kAHjNtmT7HodFMIVXpYXejJMJhgBAV3tlp7JzyASTM0qqAp9mOzQNH3UA6mRF9z
 dtz/yVzUue1tAPwD1SsdReMknS2kK+8x0tuJygn95xnB6CppGk8IMKvtNM6vNCWVxPc+
 7lwYJaX5b+wUCYpTjETEKdilZGO1/d9SWSxLNv/tYEowQ7OS5/6Y696zde4YHSMBEcCo
 mrYg==
X-Gm-Message-State: AFqh2kq7TQ1Z/a965Wqkcz9fqSLbYsL5lkpPBClnjd0RfbPUhlhwSN00
 8cf5ge9FWSsUE0K2K5hgpJB9kw==
X-Google-Smtp-Source: AMrXdXvjzuF4B5zWFibN6B7nq6bD4Lwhpo4wCEcGGBQneb3VdgotkJIwWa4mYwyw2loBPFVDjATZyA==
X-Received: by 2002:ac2:5d4e:0:b0:4b3:f50c:69a8 with SMTP id
 w14-20020ac25d4e000000b004b3f50c69a8mr19500974lfd.47.1673318824044; 
 Mon, 09 Jan 2023 18:47:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05651203ae00b004b4b5da5f80sm1913974lfp.219.2023.01.09.18.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 18:47:03 -0800 (PST)
Message-ID: <8b8ea954-1747-2174-1977-a6e0f23d7fc7@linaro.org>
Date: Tue, 10 Jan 2023 04:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
 <1663807768-23969-2-git-send-email-quic_abhinavk@quicinc.com>
 <29e5110a-1759-8d8c-6646-f7b487990c0b@linaro.org>
 <b638db8c-20c8-827d-fd08-5e3bdb8dd924@linaro.org>
 <2d30f45a-ccd0-052e-6f6c-1e119c44f81a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2d30f45a-ccd0-052e-6f6c-1e119c44f81a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dsi: implement opp table based
 check for dsi_mgr_bridge_mode_valid()
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
Cc: quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/01/2023 04:40, Abhinav Kumar wrote:
> 
> 
> On 1/9/2023 5:19 PM, Dmitry Baryshkov wrote:
>> On 27/10/2022 20:36, Dmitry Baryshkov wrote:
>>> On 22/09/2022 03:49, Abhinav Kumar wrote:
>>>> Currently there is no protection against a user trying to set
>>>> an unsupported mode on DSI. Implement a check based on the opp
>>>> table whether the byte clock for the mode can be supported by
>>>> validating whether an opp table entry exists.
>>>>
>>>> For devices which have not added opp table support yet, skip
>>>> this check otherwise it will break bootup on those devices.
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/15
>>>> Reported-by: Rob Clark <robdclark@gmail.com>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 23 +++++++++++++++++++++++
>>>>   1 file changed, 23 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> index 3a1417397283..87b518c42965 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>> @@ -450,6 +450,29 @@ static enum drm_mode_status 
>>>> dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>>>>       int id = dsi_mgr_bridge_get_id(bridge);
>>>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>>       struct mipi_dsi_host *host = msm_dsi->host;
>>>> +    struct platform_device *pdev = msm_dsi->pdev;
>>>> +    struct dev_pm_opp *opp;
>>>> +    struct opp_table *opp_tbl;
>>>> +    unsigned long byte_clk_rate;
>>>> +
>>>> +    byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), 
>>>> mode);
>>>> +
>>>> +    /*
>>>> +     * first check if there is an opp table available for the 
>>>> calculated
>>>> +     * byte clock and then check DSC related info. Some devices 
>>>> have not
>>>> +     * added support for OPP table. Skip the check for those.
>>>> +     */
>>>> +    opp_tbl = dev_pm_opp_get_opp_table(&pdev->dev);
>>>
>>> Can we store the table inside the msm_dsi during the init? Then we 
>>> won't have to get it again and again during each mode_valid call.
>>
>> I checked other drivers. I think we can skip the get_opp_table 
>> completely, can we not? Just handle ENODEV returned from 
>> dev_pm_opp_find_freq_ceil().
>>
> 
> Your point is valid but I had a doubt on that API.
> 
> As per the documentation of that API, it says
> 
> 639  * Return: matching *opp and refreshes *freq accordingly, else returns
> 640  * ERR_PTR in case of error and should be handled using IS_ERR. 
> Error return
> 641  * values can be:
> 642  * EINVAL:    for bad pointer
> 643  * ERANGE:    no match found for search
> 644  * ENODEV:    if device not found in list of registered devices
> 645  *
> 646  * The callers are required to call dev_pm_opp_put() for the 
> returned OPP after
> 647  * use.
> 648  */
> 649 struct dev_pm_opp *dev_pm_opp_find_freq_ceil(struct device *dev,
> 650                          unsigned long *freq)
> 651 {
> 
> So ideally yes, ENODEV means that table was not found but .... that API 
> uses _find_opp_table under the hood.
> 
> which says
> 
> 79  * Return: pointer to 'struct opp_table' if found, otherwise -ENODEV or
> 80  * -EINVAL based on type of error.
> 81  *
> 82  * The callers must call dev_pm_opp_put_opp_table() after the table 
> is used.
> 
> Now, how would we know if the failure was due to table not found OR 
> entry not found.
> 
> Table now found means that SOC has probably not started using OPP table 
> which is alright and not an error.
> 
> But EINVAL could mean an entry not found which means it exceeds the opp 
> table limits.

I think this would be -ERANGE as documented.

EINVAL means dev is null or something of the same kind.

> 
> So there was some ambiguity on this. So I broke it down into two calls.
> 
> If my concern is invalid, let me know.
> 
> But I do agree with you that we can cache the opp table once rather than 
> doing it in every mode_valid().
> 
>>>
>>>> +    if (opp_tbl) {
>>>> +        opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
>>>> +        if (IS_ERR(opp)) {
>>>> +            pr_err("opp table not found for freq %lu err: %ld\n",
>>>> +                    byte_clk_rate, PTR_ERR(opp));
>>>> +            return PTR_ERR(opp);
>>>> +        }
>>>> +        dev_pm_opp_put(opp);
>>>> +        dev_pm_opp_put_opp_table(opp_tbl);
>>>> +    }
>>>>       return msm_dsi_host_check_dsc(host, mode);
>>>>   }
>>>
>>

-- 
With best wishes
Dmitry


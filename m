Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81774DD28
	for <lists+freedreno@lfdr.de>; Mon, 10 Jul 2023 20:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705BA10E185;
	Mon, 10 Jul 2023 18:15:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E7B10E119
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jul 2023 18:15:19 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so76354681fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jul 2023 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689012917; x=1691604917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xLZ34OPni3Wb11pi8Qg03ECcQSNGfoxA5NTOQgO19hQ=;
 b=Dpe5ss5mB58PPKBTTW895kxDoVtmMqx988GMUWU1zuvtQ8fUMRdwge/GQdQxTrnXgp
 +t5NEIAdDH0oaGelCTjrAp4LG/mzoy3YHrEs+s3Om7KmT1CBPb0iRDBgPo0pvCehYWze
 XDIIy6HbuzsUHn80yc7zBLJaswJ/O4oNJFViWoIJybQJ/GaRTfzZ/Br7x4T0WVh1qfLr
 nd/QWxtSg/Js9NJhqEoeK87LxG4GC4Eo5iD24jbQA/UPSPxD6FySgOarILv1Frfxx15l
 0PS4ONBQEKVWAMWAR8DrnTn7aE5orVOc4QL1n3R/pP3vURLaSJsgilXy96ds4PRACD4B
 PY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689012917; x=1691604917;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xLZ34OPni3Wb11pi8Qg03ECcQSNGfoxA5NTOQgO19hQ=;
 b=UdhWAiG5UNTtRLCSVb0X/QzBjGdTvmFowAFPpT74spKIWHo5nxxmkFI9cHZDlZymvv
 yEKCpVQl6RnVLCHaUT+3HSSomjTcW5EOmxtA3Ct65Jh9lER35pY9IEWxw4tkvR8649x9
 hNXF72LCI3j9lfoufejHQDBPDUaYZK3QwRfMWVQ0TjiAPT1JRTnE+2eEArGbwtrF9gAI
 gqhtL2wSan+xpEjXGaYLRmdDLEn2QmDyqwuvFHwZ/bTBFkz/0a4FLANhGTfBYd3lOoYh
 GWM16vAmoUIM/O1ii3Oslaor6Zcp3HlZuYTqaalI23x4RJUxrMdIJ1+Zc9YBfjSTBmz2
 WuMw==
X-Gm-Message-State: ABy/qLb6kFvphp+06Q4lg4kuvNMM5Qw4TLL3lhrjL2UFU31SLLXmmOHt
 5FiiKJy0d3QYGIPTS1VAgnH70A==
X-Google-Smtp-Source: APBJJlE5fKuaEMgO2n/ZJOqQpr8b/TTCOx37vIHH5DimqJlxKxMgkSWql8+/7zXs+qnHQWkRAUSCqw==
X-Received: by 2002:a2e:9455:0:b0:2b7:29b:d5a5 with SMTP id
 o21-20020a2e9455000000b002b7029bd5a5mr10499077ljh.34.1689012917454; 
 Mon, 10 Jul 2023 11:15:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a2e964c000000b002b719138b7esm81047ljh.114.2023.07.10.11.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 11:15:17 -0700 (PDT)
Message-ID: <bd16c829-183c-9898-8890-e94c6039f4d9@linaro.org>
Date: Mon, 10 Jul 2023 21:15:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
 <b70e6e98-e5a8-71d7-891a-889c268a7e06@linaro.org>
 <c1a6f23d-17d9-6f4b-407a-142913e88a35@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c1a6f23d-17d9-6f4b-407a-142913e88a35@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v1 3/5] drm/msm/dp: delete EV_HPD_INIT_SETUP
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/07/2023 19:52, Kuogee Hsieh wrote:
> 
> On 7/7/2023 5:34 PM, Dmitry Baryshkov wrote:
>> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>>> EV_HPD_INIT_SETUP flag is used to trigger the initialization of external
>>> DP host controller. Since external DP host controller initialization had
>>> been incorporated into pm_runtime_resume(), this flag become obsolete.
>>> Lets get rid of it.
>>
>> And another question. Between patches #2 and #3 we have both 
>> INIT_SETUP event and the PM doing dp_display_host_init(). Will it work 
>> correctly?
> 
> yes,  i had added  if (!dp->core_initialized)  into dp_display_host_init().
> 
> should I merge this patch into patch #2?

You can remove a call to dp_display_host_init() in patch #2 and then 
drop EV_HOST_INIT / msm_dp_irq_postinstall() here.

> 
>>
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_display.c | 12 ------------
>>>   1 file changed, 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>> index 2c5706a..44580c2 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>> @@ -55,7 +55,6 @@ enum {
>>>   enum {
>>>       EV_NO_EVENT,
>>>       /* hpd events */
>>> -    EV_HPD_INIT_SETUP,
>>>       EV_HPD_PLUG_INT,
>>>       EV_IRQ_HPD_INT,
>>>       EV_HPD_UNPLUG_INT,
>>> @@ -1119,9 +1118,6 @@ static int hpd_event_thread(void *data)
>>>           spin_unlock_irqrestore(&dp_priv->event_lock, flag);
>>>             switch (todo->event_id) {
>>> -        case EV_HPD_INIT_SETUP:
>>> -            dp_display_host_init(dp_priv);
>>> -            break;
>>>           case EV_HPD_PLUG_INT:
>>>               dp_hpd_plug_handle(dp_priv, todo->data);
>>>               break;
>>> @@ -1483,15 +1479,7 @@ void __exit msm_dp_unregister(void)
>>>     void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>>>   {
>>> -    struct dp_display_private *dp;
>>> -
>>> -    if (!dp_display)
>>> -        return;
>>> -
>>> -    dp = container_of(dp_display, struct dp_display_private, 
>>> dp_display);
>>>   -    if (!dp_display->is_edp)
>>> -        dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>>>   }
>>>     bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>>

-- 
With best wishes
Dmitry


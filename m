Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526425539D8
	for <lists+freedreno@lfdr.de>; Tue, 21 Jun 2022 20:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1212811210C;
	Tue, 21 Jun 2022 18:56:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59AA11210C
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 18:56:57 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id j21so10808996lfe.1
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=WnoLWhxeYHm5yTgtcGD1IsezPefmqZIcjwjw5Wg8Y1s=;
 b=A0iPKWj/b60aY72nWLN+L+5qwzuBwgkTum1Nj3z85tVeILqikpZo97/piph2moEAyI
 ZAA5BM8ZMmcGV+3zxaWwi0lPt+yVJkZOmJ/qN0sH6z/ioOvf0Kezc0cJLj8f3NQ7m1pc
 eB1q+sX9/jXxB78m0DhfWhyW40vltUW/UiB3WK4EPIeKXPAj7ecznjMPow0YduS7gwP5
 f1b54Vs01hf9s3H/yG2oTu5b1GqmF2MH9VPm40JiN5fBJWpR8Uv5ustdhVHU5fRZ1Z5G
 DBH2agrb2JSwNH4CpO18Vhe702GF/BFl0r0bIJdQJTwrESpYDe9meRlfhODVit0zZ9Vb
 uyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=WnoLWhxeYHm5yTgtcGD1IsezPefmqZIcjwjw5Wg8Y1s=;
 b=4i51PxOaEQy10h9Qm7uJbpZeeVktjrlzYG1CePhUg56vou7bhP05V6YgV+5Ldu13iw
 gusBOb3AtyTRPV/mp89qRCw7YiGtk/4uv2pcMkPJBddYzNbG3VJRn3XvK15axWjpGInk
 V9t+cRUZ5r9iv1ppzhYhoRFaYDHaiQTuaCypq1Tc6JHoZdwM9cxLXe27P2RqUW5WCr6w
 laxieR5SzhawXRVvqpvyDRbSHKsjNQvXTnusMSBq8/oZicR4KO2z9vi2ODYcK7WnThiA
 spzt6aF7P0FgrqyiJRjstozksR2KEXKZ4SJu/8XWOoGvEw+WHmwholWeRJ6peuUSN4u7
 z6dg==
X-Gm-Message-State: AJIora8TbGP5nfWOpe9CmmrJUzwc0rTjgsyI7zC8z+uKHl/PCfrKYaev
 e2wFAcUMkFpiDvt6cm3auVGTfw==
X-Google-Smtp-Source: AGRyM1sftYHhG2H1/RbaWHAxQwPnIdXY1mfFVlAOlwLGeBmR2GQ87dQlV7VOlpFL1C5+w62FZN3G5A==
X-Received: by 2002:a05:6512:1513:b0:47f:6b4b:5e8b with SMTP id
 bq19-20020a056512151300b0047f6b4b5e8bmr7764466lfb.469.1655837816113; 
 Tue, 21 Jun 2022 11:56:56 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.230])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a2e8943000000b00253eee43dd7sm555624ljk.44.2022.06.21.11.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 11:56:55 -0700 (PDT)
Message-ID: <9ed319ee-07bd-253a-c7d8-a35d7d709da0@linaro.org>
Date: Tue, 21 Jun 2022 21:56:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <y> <1655808800-3996-1-git-send-email-quic_vpolimer@quicinc.com>
 <1655808800-3996-3-git-send-email-quic_vpolimer@quicinc.com>
 <ec989295-faf6-0288-cc5f-54821c654845@linaro.org>
In-Reply-To: <ec989295-faf6-0288-cc5f-54821c654845@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [v3 2/5] drm/bridge: use atomic enable/disable
 callbacks for panel bridge functions
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, robdclark@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 21/06/2022 21:54, Dmitry Baryshkov wrote:
> On 21/06/2022 13:53, Vinod Polimera wrote:
>> Use atomic variants for panel bridge callback functions such that
>> certain states like self-refresh can be accessed as part of
>> enable/disable sequence.
>>
>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Oh, wait. NACK. This will not compile. Please fix compilation with this 
patch.

> 
>> ---
>>   drivers/gpu/drm/bridge/panel.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/panel.c 
>> b/drivers/gpu/drm/bridge/panel.c
>> index 0ee563e..59a3496 100644
>> --- a/drivers/gpu/drm/bridge/panel.c
>> +++ b/drivers/gpu/drm/bridge/panel.c
>> @@ -108,28 +108,28 @@ static void panel_bridge_detach(struct 
>> drm_bridge *bridge)
>>           drm_connector_cleanup(connector);
>>   }
>> -static void panel_bridge_pre_enable(struct drm_bridge *bridge)
>> +static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge)
>>   {
>>       struct panel_bridge *panel_bridge = 
>> drm_bridge_to_panel_bridge(bridge);
>>       drm_panel_prepare(panel_bridge->panel);
>>   }
>> -static void panel_bridge_enable(struct drm_bridge *bridge)
>> +static void panel_bridge_atomic_enable(struct drm_bridge *bridge)
>>   {
>>       struct panel_bridge *panel_bridge = 
>> drm_bridge_to_panel_bridge(bridge);
>>       drm_panel_enable(panel_bridge->panel);
>>   }
>> -static void panel_bridge_disable(struct drm_bridge *bridge)
>> +static void panel_bridge_atomic_disable(struct drm_bridge *bridge)
>>   {
>>       struct panel_bridge *panel_bridge = 
>> drm_bridge_to_panel_bridge(bridge);
>>       drm_panel_disable(panel_bridge->panel);
>>   }
>> -static void panel_bridge_post_disable(struct drm_bridge *bridge)
>> +static void panel_bridge_atomic_post_disable(struct drm_bridge *bridge)
>>   {
>>       struct panel_bridge *panel_bridge = 
>> drm_bridge_to_panel_bridge(bridge);
>> @@ -158,10 +158,10 @@ static void panel_bridge_debugfs_init(struct 
>> drm_bridge *bridge,
>>   static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>>       .attach = panel_bridge_attach,
>>       .detach = panel_bridge_detach,
>> -    .pre_enable = panel_bridge_pre_enable,
>> -    .enable = panel_bridge_enable,
>> -    .disable = panel_bridge_disable,
>> -    .post_disable = panel_bridge_post_disable,
>> +    .atomic_pre_enable = panel_bridge_atomic_pre_enable,
>> +    .atomic_enable = panel_bridge_atomic_enable,
>> +    .atomic_disable = panel_bridge_atomic_disable,
>> +    .atomic_post_disable = panel_bridge_atomic_post_disable,
>>       .get_modes = panel_bridge_get_modes,
>>       .atomic_reset = drm_atomic_helper_bridge_reset,
>>       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 
> 


-- 
With best wishes
Dmitry

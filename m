Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646255B6321
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 23:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BB710E329;
	Mon, 12 Sep 2022 21:56:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC8910E327
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 21:56:06 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so17307360fac.13
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 14:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=cLLzL9vbrWOmXEMD5t4FcHNyuufYLeZfdASc1WjWjII=;
 b=Aajun28E2jbV3q6QZZCZGGP6KuCziXvmeYsaOeiaf7yhSJdtBHSpKt4Z0FmZaF2gD4
 6yOkUwVyvjt9Htp5jPmm9YbdsQPbPAW8OE8Q8VCL1S/Roh++pQvj4wStZQ+PuN8TaAoU
 2X1W+zltFgSFvaxDqn4JtYNPI+ICtl8k15k8IU8+OGzPS7gHgnE8i6UrxFXHwdNO6vxA
 16XK4CbbPFQO2aWWB10YysxHdVIphwVHa1M2Bk2ZaR8qwPmhTqcv/+vDII6CdJtqPey3
 cF98dDIstCia36oYbP1Ruo9AouGtrlvs1VL+W4h3KWWEN2IpNdOOUcnVcwugQSwT6x1/
 QidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=cLLzL9vbrWOmXEMD5t4FcHNyuufYLeZfdASc1WjWjII=;
 b=doWdI+DJ1lRD4ZN4FbDnU+yVhW7CkcvYk5+s8W6RxUn6/Eoz+C8+vtF5O9T5PGq6Lr
 BuWTduOuS7MspS9F29JMTiH1vZXjw9+d7gzXWxoX3nljBJUN/PMptNA9bqeg8PjIaIbx
 qSvEkSG4NOBvQxq/3f633Mdj+CJrV0epTFVtk01LLYWrmED1mdcw3XONJRT75ejPtMn2
 CQqRKk+rQQn3aWIyA8kfYt8Cp3Gh5D2mpolONEcRrFgjwV9fu10uu9NPFAwq8Qie0Dy1
 V6p9aWVVmhKJxKZnwLfn+xHroyS5OcN9TXcv94ckxsJ0QCBt+BjnkIEvRmdVKA8KND1w
 vroA==
X-Gm-Message-State: ACgBeo36GYQ1UieKS5FnrhBhgGZ2r0Lq7i2mf/jDLMR9Y44RO/fk8YSt
 pU8VvBh7YB/M490QLWmqSxcYjg==
X-Google-Smtp-Source: AA6agR7rNeCdm2/Yxkrqxs/SGMhUcYmEcNl/SkoT6344JEdtaxUrI+SevtXMnWUIAgrc5WE9MhE2sA==
X-Received: by 2002:a05:6808:148e:b0:343:77fc:b7d2 with SMTP id
 e14-20020a056808148e00b0034377fcb7d2mr185362oiw.128.1663019765587; 
 Mon, 12 Sep 2022 14:56:05 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 k6-20020a4ad106000000b00448a3ecdc9dsm4643175oor.22.2022.09.12.14.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 14:56:05 -0700 (PDT)
Message-ID: <69526798-93df-a4f9-c385-c9bf490cc709@kali.org>
Date: Mon, 12 Sep 2022 16:55:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-5-johan+linaro@kernel.org>
 <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <e60f0053-3801-bf33-5841-69f16215fa00@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dp: fix aux-bus EP lifetime
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 9/12/22 1:10 PM, Dmitry Baryshkov wrote:
> On 12/09/2022 18:40, Johan Hovold wrote:
>> Device-managed resources allocated post component bind must be tied to
>> the lifetime of the aggregate DRM device or they will not necessarily be
>> released when binding of the aggregate device is deferred.
>>
>> This can lead resource leaks or failure to bind the aggregate device
>> when binding is later retried and a second attempt to allocate the
>> resources is made.
>>
>> For the DP aux-bus, an attempt to populate the bus a second time will
>> simply fail ("DP AUX EP device already populated").
>>
>> Fix this by amending the DP aux interface and tying the lifetime of the
>> EP device to the DRM device rather than DP controller platform device.
>
> Doug, could you please take a look?
>
> For me this is another reminder/pressure point that we should populate 
> the AUX BUS from the probe(), before binding the components together.
>
>>
>> Fixes: c3bf8e21b38a ("drm/msm/dp: Add eDP support via aux_bus")
>> Cc: stable@vger.kernel.org      # 5.19
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>   drivers/gpu/drm/bridge/parade-ps8640.c   | 2 +-
>>   drivers/gpu/drm/display/drm_dp_aux_bus.c | 5 +++--
>>   drivers/gpu/drm/msm/dp/dp_display.c      | 3 ++-
>>   include/drm/display/drm_dp_aux_bus.h     | 6 +++---
>>   4 files changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c 
>> b/drivers/gpu/drm/bridge/parade-ps8640.c
>> index d7483c13c569..6127979370cb 100644
>> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>> @@ -719,7 +719,7 @@ static int ps8640_probe(struct i2c_client *client)
>>       if (ret)
>>           return ret;
>>   -    ret = devm_of_dp_aux_populate_bus(&ps_bridge->aux, 
>> ps8640_bridge_link_panel);
>> +    ret = devm_of_dp_aux_populate_bus(dev, &ps_bridge->aux, 
>> ps8640_bridge_link_panel);
>>         /*
>>        * If devm_of_dp_aux_populate_bus() returns -ENODEV then it's 
>> up to
>> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c 
>> b/drivers/gpu/drm/display/drm_dp_aux_bus.c
>> index f5741b45ca07..2706f2cf82f7 100644
>> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
>> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
>> @@ -322,6 +322,7 @@ static void of_dp_aux_depopulate_bus_void(void 
>> *data)
>>     /**
>>    * devm_of_dp_aux_populate_bus() - devm wrapper for 
>> of_dp_aux_populate_bus()
>> + * @dev: Device to tie the lifetime of the EP devices to
>>    * @aux: The AUX channel whose device we want to populate
>>    * @done_probing: Callback functions to call after EP device 
>> finishes probing.
>>    *                Will not be called if there are no EP devices and 
>> this
>> @@ -333,7 +334,7 @@ static void of_dp_aux_depopulate_bus_void(void 
>> *data)
>>    *         no children. The done_probing() function won't be called 
>> in that
>>    *         case.
>>    */
>> -int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>> +int devm_of_dp_aux_populate_bus(struct device *dev, struct 
>> drm_dp_aux *aux,
>>                   int (*done_probing)(struct drm_dp_aux *aux))
>>   {
>>       int ret;
>> @@ -342,7 +343,7 @@ int devm_of_dp_aux_populate_bus(struct drm_dp_aux 
>> *aux,
>>       if (ret)
>>           return ret;
>>   -    return devm_add_action_or_reset(aux->dev,
>> +    return devm_add_action_or_reset(dev,
>>                       of_dp_aux_depopulate_bus_void, aux);
>>   }
>>   EXPORT_SYMBOL_GPL(devm_of_dp_aux_populate_bus);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index ba557328710a..e1aa6355bbf6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1559,7 +1559,8 @@ static int dp_display_get_next_bridge(struct 
>> msm_dp *dp)
>>            * panel driver is probed asynchronously but is the best we
>>            * can do without a bigger driver reorganization.
>>            */
>> -        rc = devm_of_dp_aux_populate_ep_devices(dp_priv->aux);
>> +        rc = devm_of_dp_aux_populate_ep_devices(dp->drm_dev->dev,
>> +                            dp_priv->aux);
>>           of_node_put(aux_bus);
>>           if (rc)
>>               goto error;
>> diff --git a/include/drm/display/drm_dp_aux_bus.h 
>> b/include/drm/display/drm_dp_aux_bus.h
>> index 8a0a486383c5..a4063aa7fc40 100644
>> --- a/include/drm/display/drm_dp_aux_bus.h
>> +++ b/include/drm/display/drm_dp_aux_bus.h
>> @@ -47,7 +47,7 @@ static inline struct dp_aux_ep_driver 
>> *to_dp_aux_ep_drv(struct device_driver *dr
>>   int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>>                  int (*done_probing)(struct drm_dp_aux *aux));
>>   void of_dp_aux_depopulate_bus(struct drm_dp_aux *aux);
>> -int devm_of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>> +int devm_of_dp_aux_populate_bus(struct device *dev, struct 
>> drm_dp_aux *aux,
>>                   int (*done_probing)(struct drm_dp_aux *aux));
>>     /* Deprecated versions of the above functions. To be removed when 
>> no callers. */
>> @@ -61,11 +61,11 @@ static inline int 
>> of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
>>       return (ret != -ENODEV) ? ret : 0;
>>   }
>>   -static inline int devm_of_dp_aux_populate_ep_devices(struct 
>> drm_dp_aux *aux)
>> +static inline int devm_of_dp_aux_populate_ep_devices(struct device 
>> *dev, struct drm_dp_aux *aux)
>>   {
>>       int ret;
>>   -    ret = devm_of_dp_aux_populate_bus(aux, NULL);
>> +    ret = devm_of_dp_aux_populate_bus(dev, aux, NULL);
>>         /* New API returns -ENODEV for no child case; adapt to old 
>> assumption */
>>       return (ret != -ENODEV) ? ret : 0;
>
This breaks builds which have ti-sn65dsi86 included:

drivers/gpu/drm/bridge/ti-sn65dsi86.c:628:50: error: passing argument 1 
of 'devm_of_dp_aux_populate_ep_devices' from incompatible argument type.

As well,

drivers/gpu/drm/bridge/ti-sn65dsi86.c:628:15: error: too few arguments 
to function 'devm_of_dp_aux_populate_ep_devices'


--steev



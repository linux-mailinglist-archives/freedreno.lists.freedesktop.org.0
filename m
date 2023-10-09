Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338B57BE93F
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E268110E124;
	Mon,  9 Oct 2023 18:29:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE4910E124
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:29:00 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-505a62d24b9so5723806e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696876138; x=1697480938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pca6/x4m0+Ls+jwdoTs0aPNbLnd8ATtUmqsPWpFNjgg=;
 b=yLnfoJrY+NKPaOfvcQtJinUW87QUI7IeF3QyJHwVghVMuhlUXoHGwq6xN4KusRBWAJ
 vM24cWHxOSTtwX1L8yczOGvxv/nrLZan/yI6AkesH58v3r+KrRpcS85CYEq8KqW/8Xb/
 v4lIrDTsJrS6cSgTermwEhiGE8C8D0mxsmp6ZiXezLLIcvE7J0uffiDqdrQlze5PJfx/
 ZmTt+87DXw/e8H/mw8rN7oVV8der+amO+frrO3pUs+MAPb3EaOuQCUNP9iWTOoBf1jVf
 SI+ROKyILwDeuxEP3BZW1lc8PBnc2PfYHdMe7R2cjEtcGrXvIX4Agj3sozn2FkTj4RuL
 y/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696876138; x=1697480938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pca6/x4m0+Ls+jwdoTs0aPNbLnd8ATtUmqsPWpFNjgg=;
 b=S6Lzw0PB/z6SzUl+w19hGxUhNtN2/SAx8atW6AHeCxqGfp4scS0glsowcNusdMoMha
 yzLogilQy5ztqqv0msV/3KYKUx8i5JOZMdhBh1we3eUxAlRZpIEeDuqfHQXFgVQHjBtY
 9pv+9cRAOfjkUpmPJXN6bLoWzHOG8nhiXYdHNWI7Q2ru5mIEh51uhJgC5F6+mwbseeyu
 XddlFWwm9SQfS8t/60t0HosbTAPe87E2KNndHkAwD3g5p4M8nwlbsk8/wFqHo3QTtPdF
 JBn16F5H63YxJNLeacE8nnqPJZPoss0I0S3rbvxgdVCEP/TRMXVfgk4n+XntDMh3ZNFx
 0D1g==
X-Gm-Message-State: AOJu0YwWRw2epyV/FHgQ/Ew3KuZ8ZFNEe/lEWEugiKFsx2+/DZ7McZUC
 eaEXVDq215qweKd/oBHjsu/cUQ==
X-Google-Smtp-Source: AGHT+IFvDRk4WJZP79OUtTNrx7puI1f8FjcA2/SKmdgu2e7vDaUwv81PYt+rfgdm31CMUrR/xtfn3w==
X-Received: by 2002:a19:644c:0:b0:504:2ba5:99ad with SMTP id
 b12-20020a19644c000000b005042ba599admr12962715lfj.36.1696876138229; 
 Mon, 09 Oct 2023 11:28:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y11-20020ac255ab000000b005008248b69dsm1524431lfg.187.2023.10.09.11.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 11:28:57 -0700 (PDT)
Message-ID: <f01e08b3-94a4-4eb7-963f-78cb8f9b81fb@linaro.org>
Date: Mon, 9 Oct 2023 21:28:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 neil.armstrong@linaro.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230904015338.2941417-1-dmitry.baryshkov@linaro.org>
 <20230904015338.2941417-3-dmitry.baryshkov@linaro.org>
 <11a07867-8799-479f-b5b6-e3fd9bb31dbc@linaro.org>
 <aae055a1-6925-ce2f-1d17-7e119c78e9f7@ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <aae055a1-6925-ce2f-1d17-7e119c78e9f7@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/3] drm/bridge: migrate bridge_chains to
 per-encoder file
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
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06/10/2023 10:51, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/10/2023 10:35, Neil Armstrong wrote:
>> Hi,
>>
>> On 04/09/2023 03:53, Dmitry Baryshkov wrote:
>>> Instead of having a single file with all bridge chains, list bridges
>>> under a corresponding per-encoder debugfs directory.
>>>
>>> Example of the listing:
>>>
>>> $ cat /sys/kernel/debug/dri/0/encoder-0/bridges
>>> bridge[0]: dsi_mgr_bridge_funcs
>>>     type: [0] Unknown
>>>     ops: [0]
>>> bridge[1]: lt9611uxc_bridge_funcs
>>>     type: [11] HDMI-A
>>>     OF: 
>>> /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b:lontium,lt9611uxc
>>>     ops: [7] detect edid hpd
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/drm_bridge.c  | 44 -----------------------------------
>>>   drivers/gpu/drm/drm_debugfs.c | 39 ++++++++++++++++++++++++++++---
>>>   include/drm/drm_bridge.h      |  2 --
>>>   3 files changed, 36 insertions(+), 49 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>> index 39e68e45bb12..cee3188adf3d 100644
>>> --- a/drivers/gpu/drm/drm_bridge.c
>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>> @@ -1347,50 +1347,6 @@ struct drm_bridge *of_drm_find_bridge(struct 
>>> device_node *np)
>>>   EXPORT_SYMBOL(of_drm_find_bridge);
>>>   #endif
>>> -#ifdef CONFIG_DEBUG_FS
>>> -static int drm_bridge_chains_info(struct seq_file *m, void *data)
>>> -{
>>> -    struct drm_debugfs_entry *entry = m->private;
>>> -    struct drm_device *dev = entry->dev;
>>> -    struct drm_printer p = drm_seq_file_printer(m);
>>> -    struct drm_mode_config *config = &dev->mode_config;
>>> -    struct drm_encoder *encoder;
>>> -    unsigned int bridge_idx = 0;
>>> -
>>> -    list_for_each_entry(encoder, &config->encoder_list, head) {
>>> -        struct drm_bridge *bridge;
>>> -
>>> -        drm_printf(&p, "encoder[%u]\n", encoder->base.id);
>>> -
>>> -        drm_for_each_bridge_in_chain(encoder, bridge) {
>>> -            drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
>>> -                   bridge_idx, bridge->type, bridge->ops);
>>> -
>>> -#ifdef CONFIG_OF
>>> -            if (bridge->of_node)
>>> -                drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
>>> -#endif
>>> -
>>> -            drm_printf(&p, "\n");
>>> -
>>> -            bridge_idx++;
>>> -        }
>>> -    }
>>> -
>>> -    return 0;
>>> -}
>>> -
>>> -static const struct drm_debugfs_info drm_bridge_debugfs_list[] = {
>>> -    { "bridge_chains", drm_bridge_chains_info, 0 },
>>> -};
>>> -
>>> -void drm_bridge_debugfs_init(struct drm_minor *minor)
>>> -{
>>> -    drm_debugfs_add_files(minor->dev, drm_bridge_debugfs_list,
>>> -                  ARRAY_SIZE(drm_bridge_debugfs_list));
>>> -}
>>> -#endif
>>> -
>>>   MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
>>>   MODULE_DESCRIPTION("DRM bridge infrastructure");
>>>   MODULE_LICENSE("GPL and additional rights");
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>>> b/drivers/gpu/drm/drm_debugfs.c
>>> index cf7f33bdc963..70913067406d 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -273,10 +273,8 @@ int drm_debugfs_init(struct drm_minor *minor, 
>>> int minor_id,
>>>       drm_debugfs_add_files(minor->dev, drm_debugfs_list, 
>>> DRM_DEBUGFS_ENTRIES);
>>> -    if (drm_drv_uses_atomic_modeset(dev)) {
>>> +    if (drm_drv_uses_atomic_modeset(dev))
>>>           drm_atomic_debugfs_init(minor);
>>> -        drm_bridge_debugfs_init(minor);
>>> -    }
>>>       if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>           drm_framebuffer_debugfs_init(minor);
>>> @@ -603,6 +601,37 @@ void drm_debugfs_crtc_remove(struct drm_crtc *crtc)
>>>       crtc->debugfs_entry = NULL;
>>>   }
>>> +static int bridges_show(struct seq_file *m, void *data)
>>> +{
>>> +    struct drm_encoder *encoder = m->private;
>>> +    struct drm_bridge *bridge;
>>> +    unsigned int idx = 0;
>>> +
>>> +    drm_for_each_bridge_in_chain(encoder, bridge) {
>>> +        seq_printf(m, "bridge[%d]: %ps\n", idx++, bridge->funcs);
>>> +        seq_printf(m, "\ttype: [%d] %s\n",
>>> +               bridge->type,
>>> +               drm_get_connector_type_name(bridge->type));
>>> +#ifdef CONFIG_OF
>>> +        if (bridge->of_node)
>>> +            seq_printf(m, "\tOF: %pOFfc\n", bridge->of_node);
>>> +#endif
>>> +        seq_printf(m, "\tops: [0x%x]", bridge->ops);
>>> +        if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>>> +            seq_puts(m, " detect");
>>> +        if (bridge->ops & DRM_BRIDGE_OP_EDID)
>>> +            seq_puts(m, " edid");
>>> +        if (bridge->ops & DRM_BRIDGE_OP_HPD)
>>> +            seq_puts(m, " hpd");
>>> +        if (bridge->ops & DRM_BRIDGE_OP_MODES)
>>> +            seq_puts(m, " modes");
>>> +        seq_puts(m, "\n");
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +DEFINE_SHOW_ATTRIBUTE(bridges);
>>> +
>>>   void drm_debugfs_encoder_add(struct drm_encoder *encoder)
>>>   {
>>>       struct drm_minor *minor = encoder->dev->primary;
>>> @@ -618,6 +647,10 @@ void drm_debugfs_encoder_add(struct drm_encoder 
>>> *encoder)
>>>       encoder->debugfs_entry = root;
>>> +    /* bridges list */
>>> +    debugfs_create_file("bridges", 0444, root, encoder,
>>> +                &bridges_fops);
>>> +
>>>       if (encoder->funcs->debugfs_init)
>>>           encoder->funcs->debugfs_init(encoder, root);
>>>   }
>>> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
>>> index c339fc85fd07..902bc3f99c2a 100644
>>> --- a/include/drm/drm_bridge.h
>>> +++ b/include/drm/drm_bridge.h
>>> @@ -950,6 +950,4 @@ static inline struct drm_bridge 
>>> *drmm_of_get_bridge(struct drm_device *drm,
>>>   }
>>>   #endif
>>> -void drm_bridge_debugfs_init(struct drm_minor *minor);
>>> -
>>>   #endif
>>
>> It would be nice to have a review from Tomi since he pushed the bridge 
>> chains debugfs.
>>
>> Apart that it looks fine:
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> This change does more than move the code to per-encoder debugfs file: it 
> changes the formatting, adding textual representations for the flags, 
> and drops the use of drm_printer.
> 
> I'd prefer to have such changes separately, but as it's a small patch I 
> guess it's fine-ish. But they should at least be mentioned in the patch 
> description.

Fair enough, I'll add this to the commit message. Thank you!

> 
> With that addressed:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
>   Tomi
> 

-- 
With best wishes
Dmitry


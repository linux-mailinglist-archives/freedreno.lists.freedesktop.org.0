Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C279F61359D
	for <lists+freedreno@lfdr.de>; Mon, 31 Oct 2022 13:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EADF10E1E4;
	Mon, 31 Oct 2022 12:16:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DAF10E1DC
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667218585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
 b=OsQDL3RL61I/1SB74QO6sHEhmHbzzzz1XJdbp7Fg+iziA5omgoH4GBFcoKvX6HeN1tRvY/
 P8XW/vd+Uy3Q0b+gX9Cvdj5epMz1SiaHKTG6aeWl9QeMH9IWHUSM3RUZ0/8xZ5mPyCnMnX
 el8ZS/nuk3bLBuJHeLCXm1A2M5TNMNA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-517-QiESsSHXMl69Xr68F1yuEA-1; Mon, 31 Oct 2022 08:16:16 -0400
X-MC-Unique: QiESsSHXMl69Xr68F1yuEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso2542183wmj.4
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlC4H0gmckJZ8E/tDGtmzwjQN3hfnWY+OkvhUHpUiTc=;
 b=blMotQ0Rq99TpQUEUIgMW3ZlFuo65oVtAZzpX0Jzwl59O/X/NsD/w/iqlYMcq4cxxw
 0oDHz5fayl6+DIoFkp7iF9tKsepnzy/b0xYBkZhg1OZCtxhfl8E1nPSGq6ts8hT2EaoQ
 wsa0luWfweLOqm6DogUd9/x6tB+pZ2mjTeUa9FvnyQMXBFNJciwpQYYB2FC39FY92FSO
 MWSutsVUn5HriKWwfFPD5N7XtgYGSCMeA+25xT8AH2liaewKfwloDxRXExbq0nCB2ekw
 Nw/xo0K1bddmvtEO+Vhx7SqO3hqsh6WA3GD5ebwxTNppoi12a3gEc82IJUf4H9+w4aii
 p6AQ==
X-Gm-Message-State: ACrzQf0BWF8zMmwo9yZrBUnZzJgBpaBcUAbSDdzXEMm6vV18okrGi3G3
 Sy6grQb4NCiZZYUX8KIxg2fp2e4mE4N6PEZAHumpO+4XXzGXSKMPNDlfZ9qWXtoyHsNHvFxqwjk
 /gW71bxupMFbl/n6ly1oUqSfHoGWd
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr10268842wms.8.1667218575313; 
 Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7vtgF5OcVzyyhJbAVQv0UtjhNq0IgAK2jPkGsnoYeZKQ/ZE7IsMKsB/emo+io4u+dLlmSgSQ==
X-Received: by 2002:a05:600c:1c0d:b0:3cf:5fd2:1fd1 with SMTP id
 j13-20020a05600c1c0d00b003cf5fd21fd1mr10268814wms.8.1667218575124; 
 Mon, 31 Oct 2022 05:16:15 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d2-20020a05600c34c200b003b3365b38f9sm7118010wmq.10.2022.10.31.05.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:16:14 -0700 (PDT)
Message-ID: <8423bcd3-84f6-b6c9-914a-c70166e20482@redhat.com>
Date: Mon, 31 Oct 2022 13:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/21] drm/imx/dcss: Don't set struct
 drm_driver.output_poll_changed
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
Cc: linux-hyperv@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 spice-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Don't set struct drm_driver.output_poll_changed. It's used to restore
> the fbdev console. But as DCSS uses generic fbdev emulation, the
> console is being restored by the DRM client helpers already. See the
> functions drm_kms_helper_hotplug_event() and
> drm_kms_helper_connector_hotplug_event() in drm_probe_helper.c.
> 
> v2:
> 	* fix commit description (Christian)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


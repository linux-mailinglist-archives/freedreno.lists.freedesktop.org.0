Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06CF619484
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 11:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390D110E72E;
	Fri,  4 Nov 2022 10:37:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD210E0A0
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 10:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667558241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
 b=R2yQImMcAfIj5GEELIWTBsuK8hgSQmFxwHONeKVvbLNsoPnUuIooQaMHVa/KhRLCIH7r5a
 SCaPWvfexiteqzwdGc6NcedILUoKqMLUZ0NXk2nAw9stXpgMK2U85P+Z3QKQx3TEQy8gHF
 8m7WD5rw4DsgVTBWqQrCcuIJkg3C6Eo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-Anc3Z7eCOEqXdQE_kHGDhw-1; Fri, 04 Nov 2022 06:37:20 -0400
X-MC-Unique: Anc3Z7eCOEqXdQE_kHGDhw-1
Received: by mail-wm1-f70.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso516006wms.4
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 03:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FvcSXdbTIY6j0RtoeMW2Oyvbsf0knEKyh2vmjeJsi+Y=;
 b=rPCuVhGR+GzP8yHLhORpWhXC9ypTFWS1eBPVKNJi5i0TTjeKGH7AU8SU7/i0sALfND
 FEd0pOHH/pLB6Z5CUiaS/2cpcRijw4P1FY6SxqiYiwnqxlR9M7mBMJJcJ9ju7umZojSC
 +39qXJ+62lxGX2M54bt1vdwcWIXdCtWhheVQkT6/HYY1APyMl0BW+GQ2ZBDbLvzWgLRp
 c/cqN3sieb856WTTXDy2QElQJ9SV5Q/D92CHDjwXCHqbf96kY0S0kFF3HgDoXG7DoaM2
 S4FxBXIte0iCINqg5iGnP8FJ+0r8zW6X9gsgL7nvk0GCQkqalM8AILLaq36L5RTQ9EQH
 OFWg==
X-Gm-Message-State: ACrzQf3L/sdCDM/kJbtF+/nKhQzd9jA9aWAUWyclYaTUug5l/MC5nztm
 Za6bTldoIjAzWZKvAGcTY1jX2l+8r0b/y/d/GKOmIR/UPtv6gLAasIsT2vFtTBlqhv6JV9Cjxgi
 UiDsp4O3WqU99E0+0wjQHJ+8SBdRk
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id
 ay42-20020a05600c1e2a00b003c3d7701756mr23539580wmb.134.1667558239641; 
 Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LKXhwK5qh8ieFEkCSZgi7mblk9sJOfnr0awtpFbS+pIQGNE9IUSRaCOrs9CG3VpGFJY/xjQ==
X-Received: by 2002:a05:600c:1e2a:b0:3c3:d770:1756 with SMTP id
 ay42-20020a05600c1e2a00b003c3d7701756mr23539569wmb.134.1667558239379; 
 Fri, 04 Nov 2022 03:37:19 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b0022e36c1113fsm3031008wrt.13.2022.11.04.03.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 03:37:18 -0700 (PDT)
Message-ID: <ab8358a9-8450-0d49-627f-26afe7ba4f9d@redhat.com>
Date: Fri, 4 Nov 2022 11:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221103151446.2638-1-tzimmermann@suse.de>
 <20221103151446.2638-21-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221103151446.2638-21-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 20/23] drm/fb-helper: Set flag in struct
 drm_fb_helper for leaking physical addresses
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/3/22 16:14, Thomas Zimmermann wrote:
> Uncouple the parameter drm_leak_fbdev_smem from the implementation by
> setting a flag in struct drm_fb_helper. This will help to move the
> generic fbdev emulation into its own source file, while keeping the
> parameter in drm_fb_helper.c. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


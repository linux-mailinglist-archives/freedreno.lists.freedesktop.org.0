Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5479615ED7
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 10:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A400410E45B;
	Wed,  2 Nov 2022 09:05:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6410E459
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 09:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667379906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
 b=WvDAXhrxk3GfKKBlUDB6Tzma1uxqlntRK6qLRDswyPGiYR+zTAHeZXUpHkCXzM6AYrCCO/
 8Rhjgexrdpeu/Rp19UnprEcKJfM990He1EdFC5wXawSsl6wC/AcA19tBTUuPC6CX/2x2Bs
 z2ifoN+fLi9FkktGjdfFYUN1DbM309o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-aZYUYerGPMSV0da1yKFhYw-1; Wed, 02 Nov 2022 05:05:05 -0400
X-MC-Unique: aZYUYerGPMSV0da1yKFhYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso244459wml.7
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 02:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LpYqcUNkPgIA1fAPwB+EiO+Z9dq0ENSiM+RajxMrldI=;
 b=S+Dfiy0g94AIF2m/8jqJL6xij9+MVfTjQYP/m45xcnv98c5JJcItD3u+Aoi7G9knas
 OUSWm2x7yI9Oakx/drTPM8aMxe7IJwu0PbeK2b3/EcRVFO9BVh4tUL+QWK0KnXCio+X8
 lLiV4Z/gygJZzGDpAZABWDgmSOpVoEwZG/UVuqaOmTBwKTTd6p2vakGNb/xIfFfzRQjC
 c6LgXQ+lCJVAK1iyt1lvpcj4h+cNVh0NI9vlNbVTFY7F5IESPDLaFVM5uzkoWDyIVC/d
 dVd5B/WQUfi7pLrdjDz/kjY1I1RLSxaovHLQv59OhlX0JT4asGeoympk1bqNv/RXQTne
 m6og==
X-Gm-Message-State: ACrzQf0DazfpHX8nZuSMAnM4U9Dcv82mrs7v7knQIM8c+XJRt7fuXwYa
 5VKtKrDWdVtAR2Fraqd0wddbc8y5ieRBjYslk6gEZ2xg0amRXa6SqvW7fT+aYENP/dS+WybEL3M
 ISPrzS834lTJiASP81xItODnfgEqM
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr14464176wri.138.1667379904747; 
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ug/7BR+PMLuqwC0wiYVRKEgerXkzKho5yFNKIDT0bC26SnYKpkqpAn1quqQ9FNF9E1JGkLg==
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr14464139wri.138.1667379904487; 
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00228d52b935asm12402687wrq.71.2022.11.02.02.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:05:04 -0700 (PDT)
Message-ID: <a96d57d8-486d-5a48-a00a-39df6275cbb5@redhat.com>
Date: Wed, 2 Nov 2022 10:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-17-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-17-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 16/21] drm/fb-helper: Call fb_sync in I/O
 functions
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
> Call struct fb_ops.fb_sync in drm_fbdev_{read,write}() to mimic the
> behavior of fbdev. Fbdev implementations of fb_read and fb_write in
> struct fb_ops invoke fb_sync to synchronize with outstanding operations
> before I/O. Doing the same in DRM implementations will allow us to use
> them throughout DRM drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


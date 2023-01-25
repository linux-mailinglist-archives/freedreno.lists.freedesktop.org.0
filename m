Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24267ADB4
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 10:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FC910E74E;
	Wed, 25 Jan 2023 09:25:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC11510E756
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674638710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
 b=KO/F8P4vq8StqgMN5WTrUy+yBRODcTmvXLkNdiWJbBvY+PrQxM152TJ52cTrRMGmJgp3hd
 Mq418D+5UWJW/g7TONCkcO1TCMq3/FrAUDBt9CPrkiXfrSZDdhtjHIFV6w17aWUi8qd2gu
 XGMkU581WKYiDI4LD9T4aRRWm3FgGkI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-mMPbrsx_O4K14ADJPHB3_Q-1; Wed, 25 Jan 2023 04:25:09 -0500
X-MC-Unique: mMPbrsx_O4K14ADJPHB3_Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 12-20020a05600c228c00b003db09699216so332387wmf.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 01:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJl0EBn4HtiAr3IA7OgQLEz430pat4/3/h3H46oRT3g=;
 b=Pmzs4HVybuAU3ReY/ABw/I14BHh3DIUC86uZhs55P/CelLEobcXlKybR7zwjBNH0Zf
 LawcoxgET8vuCIHDY+/BFXrBd4UFwfPVb/txJZttAKEdK6b6YdEozHz4S3Hp4TazPdoR
 HiYogmmCv960faTv7pA+yWCQoPNIvSlrY7vNHaPP0jQi6nDxiayliUPMr6DHRverUoKk
 +x65uKR+MggCVERNYceR/T1SF6wsP0aTaU2B0ron7W8j/U4799T2fbXZQzQZvl615EbB
 Fptw1fUNpwztkEAxBTj4rC1Wwy9gAQGkXQ6zns4YxwbEguweS6eJpPyoMZ1H+hCwNrtb
 RvGg==
X-Gm-Message-State: AFqh2kqUpjEMIaJpC3UylrSzr++itgT5y0ggEOSSHlb6YPejTJITJg+u
 y3VvHe16+z9kKGnD6Vr4VK3Ws2Kj9zrQAEE6SuKmZTPq7AgZaL05279yBiTfr0UUMTO/jRWRGBk
 GNF6lND4evbJiv4dSLteI7EIMHjZ0
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id
 l13-20020adfa38d000000b002bf9527ce62mr13001330wrb.60.1674638707871; 
 Wed, 25 Jan 2023 01:25:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvA3fpsEqb88MB1qU578so/hL+p+6J8snUbZz7AHyqAc1so8GvG1XEiL3HmPZITj9u0u/0ozg==
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id
 l13-20020adfa38d000000b002bf9527ce62mr13001312wrb.60.1674638707672; 
 Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q8-20020adff788000000b002bfbda53b98sm534384wrp.35.2023.01.25.01.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:25:07 -0800 (PST)
Message-ID: <c0377e71-12b8-a545-dc48-704c223f344c@redhat.com>
Date: Wed, 25 Jan 2023 10:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 04/10] drm/fbdev-generic: Initialize
 fb-helper structure in generic setup
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 1/24/23 14:40, Thomas Zimmermann wrote:
> Initialize the fb-helper structure immediately after its allocation
> in drm_fbdev_generic_setup(). That will make it easier to fill it with
> driver-specific values, such as the preferred BPP.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -456,12 +454,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>  	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>  	if (!fb_helper)
>  		return;

Maybe add a new line here?

> +	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
>  

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


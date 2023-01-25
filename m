Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150867AE41
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 10:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBBA10E0DB;
	Wed, 25 Jan 2023 09:41:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F157B10E74E
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 09:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674639668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
 b=Km6gExUB7q+SFkVkSURn+CyhaPLT6yTla50HLsl8iKD8VxS7MMwmWmSBiLC/G/JcsUSCk9
 KhK1bt2RopU1vxsA4uVAThRv2tIhysEDWxeCgBQl2ZSZcfMGlMv3Ya0Q4HwOdkuLd0+7Nf
 4wOFNqd+uqHuSWDWTj7GcD8F4aL7lg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-qtru9Cy1PRKV7IbmIYAUdA-1; Wed, 25 Jan 2023 04:41:07 -0500
X-MC-Unique: qtru9Cy1PRKV7IbmIYAUdA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e29-20020adf9bdd000000b002bb0d0ea681so3084424wrc.20
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 01:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZiXmPj1TLICEH85h0g9ObpieXhmW8hbY1dyGTe1WVko=;
 b=vGfL+fj4Xr9rNYhKKbaV5Js58+NzvwAqR3snBJj3c5EWNJwbEaAo0klqRrkH0Y8H5m
 W1TvSZ2Psogs5Tp+zHrtktv2LodxY74SACBVhjW9pZ6pLHeYMTxcP+97T2X5Cu1jyc2U
 g7zGDCA3nExDiz/zZDOVEpvbYTTOqO8MIgaUUsTYR3LAd4DPrLg4BRofUEDT/ZXCn6X+
 gI2NCas9+RrjXD0j3N1GBb78gmbxAmcpFrtRGF/8cQHcWVvJM4ckEdIukAeDKjqIpMmw
 DqbF1UArda2aGFiAfkR1BtQKwIu44oQFAkCxVrGnC4U73k7qf4Hp4+JYuF2c9M9aBezM
 jXJg==
X-Gm-Message-State: AFqh2koalcbrRaIEEP8HCg3sEbMHHntB2foOcf3/WxV8RZ7qliCIHoyB
 CbPV4eX6m69/UXi5F9Q3Aq7Dlv+PuG3wg7qFLges9PGyegxMYd5mTI2MDPIRDpzBLKrrr43TRSQ
 veRQivRJ8hoSqNqVr0K+OV9hY27Qw
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id
 cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416463wrb.3.1674639665556; 
 Wed, 25 Jan 2023 01:41:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspvSYF5UcTCX9Syl/sB5Wttapk1TJmAOGMxlySA2rIPpJprAbwV2wYhJQSWjxg72A43lgFrQ==
X-Received: by 2002:a5d:5c0b:0:b0:2bd:15ef:fe7 with SMTP id
 cc11-20020a5d5c0b000000b002bd15ef0fe7mr27416452wrb.3.1674639665344; 
 Wed, 25 Jan 2023 01:41:05 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 a18-20020a056000101200b002be25db0b7bsm4010247wrx.10.2023.01.25.01.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:41:04 -0800 (PST)
Message-ID: <66114220-d226-e0e9-bf09-707388ce98f3@redhat.com>
Date: Wed, 25 Jan 2023 10:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-7-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 06/10] drm/fb-helper: Initialize
 fb-helper's preferred BPP in prepare function
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
> Initialize the fb-helper's preferred_bpp field early from within
> drm_fb_helper_prepare(); instead of the later client hot-plugging
> callback. This simplifies the generic fbdev setup function.
> 
> No real changes, but all drivers' fbdev code has to be adapted.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


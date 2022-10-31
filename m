Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8261360E
	for <lists+freedreno@lfdr.de>; Mon, 31 Oct 2022 13:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A23210E232;
	Mon, 31 Oct 2022 12:23:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D257B10E23A
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
 b=OXxETfR4g8DTtsYOgeAYKp+EQgjNGaqLLCMi4dhrYZ+lPfcfdS5h5O8mwAFhR877yun0Zf
 nn2XbQOGwj8SjrqEVIoXsAliYDbiWm27JjHNCKViA/plFCtoSisI7Dw8DPfoOt6SWLCrcj
 xhNghWqsLn4MotOmVecD81rNWnwv9F8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-2k8ZgPTFOLSqX-79Crlh9A-1; Mon, 31 Oct 2022 08:23:19 -0400
X-MC-Unique: 2k8ZgPTFOLSqX-79Crlh9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c4fd200b003c6ceb1339bso5592343wmq.1
 for <freedreno@lists.freedesktop.org>; Mon, 31 Oct 2022 05:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQCx1YM0kmrgAAcvKhWafunY3KuhCAquKBUmZJVCfV8=;
 b=ez1sbu37+qNJwrlmdd1FmmQAMmi28mTLewBmj6Gt7fygkWVVHBay86bh1b0mS3G68R
 xIeKJJFrQGQ47XCX4O3NGrhePrdj3tcPi4Rlq2Qvthmv/tu+dkmJfviPdVppvMxSJn65
 IMuSKvPNEIbbCyaOVqCTdh1UIH2lZezAIHgEGkErxNb/eB61Ko6Mg7PUIhAYBZe+Th/j
 RcADFpzVCUyUUUUiKFNE5N23WkaPDvDz47lOTLX/ydk4HKQxSw1Riun2Ej/UcEx8XHz4
 I+rcszb1O0kufGVRKz1s90Nro3vjsM5Rb6zz9L2wx8mEm6IIuYzCsyqtJm3qlDSXsGPX
 mM9Q==
X-Gm-Message-State: ACrzQf2IRufJ2L4UqUQaEQ8EpdKn7eawz7071yjzSVTqDURibl9zca1P
 5Upzszb9GWoSzl4W+MT0HoqzIXYjjIpXhU033b7D17paD3cladcZw1tU7WeNlfRZMLU52bxBCue
 k2r5e+0rABxdDv1JNcywoc77kECUr
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id
 h13-20020adfaa8d000000b00236588f071fmr7582876wrc.205.1667218998716; 
 Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7e34dAcxvP3Vi0CwbwP1YeMi235O6q6VyKCYvEf93eDT38FEWiyAv5s+MTc8QNv7Bgz3ny/w==
X-Received: by 2002:adf:aa8d:0:b0:236:588f:71f with SMTP id
 h13-20020adfaa8d000000b00236588f071fmr7582855wrc.205.1667218998538; 
 Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ci8-20020a5d5d88000000b0023662245d3csm7011927wrb.95.2022.10.31.05.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:23:18 -0700 (PDT)
Message-ID: <63a804b4-ab2c-f5b7-73b5-edefdeff038e@redhat.com>
Date: Mon, 31 Oct 2022 13:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-12-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-12-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 11/21] drm/fb-helper: Cleanup include
 statements in header file
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
> Only include what we have to.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Nice cleanup.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D467AEE3
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 10:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665A910E762;
	Wed, 25 Jan 2023 09:53:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF9210E762
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 09:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674640394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/d1Iir0okyO1PXRE824II8zkHLTH6xPW+FwgTmuVIo=;
 b=b3S49XCjEzKVxjomF4qSL8YowhHGW9kEcRjaLuhmMtD6tdZCya3r3EFxTmO3qCotCiGN3w
 XaGuRc5xqLEISfUqDHuvgbY6ynS8ldj/GLMyaqipCcuRvCI8/Lrh6ZKDrrc8Kdq5e823sI
 8HN6MhYwGMDWmktF5He9XhN9Iq1JIgw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-nNKbPPqNNm-T_Bt9myFY-w-1; Wed, 25 Jan 2023 04:50:56 -0500
X-MC-Unique: nNKbPPqNNm-T_Bt9myFY-w-1
Received: by mail-wm1-f72.google.com with SMTP id
 h2-20020a1ccc02000000b003db1ded176dso346176wmb.5
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 01:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K/d1Iir0okyO1PXRE824II8zkHLTH6xPW+FwgTmuVIo=;
 b=z4KFvRijXVvTwziWprflayj6cUuTK/tbW9p+2Wjh+QBaTnxuzA1pOdV3ZaAm1kZbHX
 FRaA9a0GO6VsDzh40gbVfoC5TA9nsHXkOlH5GRHDt6gptpL/toNPv45vqn7Us8liMrMO
 /yUmy5aREYk5yeus4L9V76Jndv2Qkzu65Pe3/sISf2hcvnxQVgL0/ctRo5dZwogUniaB
 AQbwANA0K3ezVbLu1j/qw3lBlEhB1qkW9pgDNItplccmBVLr4x7o0AWC0GN7uzH1Sd3h
 s/Qkr5iAxnkHOEakjNvpRQ3+m1QvQRjJ4RJ75MxYwysxnyGwRJBDfj74fSG6bj3yhoqZ
 fgUA==
X-Gm-Message-State: AFqh2kqSlQSPxOcAhvJXiukxmxzdwsRxq/FzgqwkyQAbJlfuPfEamClD
 +7G3KzE/uujNuMVQrCBhCRWGnNROvs0Ze5YQCoXoi28pvDkNPQoU/5jQFJlcSMbvSmPsUIVjfQh
 h6t1FY6SW8UTDJSczIqkcrKJsOmhD
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id
 d8-20020a05600c3ac800b003da270bba6bmr32346402wms.41.1674640255700; 
 Wed, 25 Jan 2023 01:50:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwfL0Z6VaIwodqmubvV+5fPQ6Vvv5kGgzDLr7Nlz5OAeVqgi6a3bBFtOpmTalnPP5+47xPuw==
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id
 d8-20020a05600c3ac800b003da270bba6bmr32346388wms.41.1674640255501; 
 Wed, 25 Jan 2023 01:50:55 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e18-20020a5d65d2000000b00294176c2c01sm3929576wrw.86.2023.01.25.01.50.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:50:54 -0800 (PST)
Message-ID: <498c2aa7-185f-d1cd-6e41-004880913870@redhat.com>
Date: Wed, 25 Jan 2023 10:50:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-9-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/10] drm/fbdev-generic: Minimize client
 unregistering
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
> For uninitialized framebuffers, only release the DRM client and
> free the fbdev memory. Do not attempt to clean up the framebuffer.
> 
> DRM fbdev clients have a two-step initialization: first create
> the DRM client; then create the framebuffer device on the first
> successful hotplug event. In cases where the client never creates
> the framebuffer, only the client state needs to be released. We
> can detect which case it is, full or client-only cleanup, be

s/be/by

> looking at the presence of fb_helper's info field.
> 
> v2:
> 	* remove test for (fbi != NULL) in drm_fbdev_cleanup() (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


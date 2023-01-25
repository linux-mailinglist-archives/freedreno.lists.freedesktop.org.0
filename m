Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE967AEDC
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 10:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D875810E762;
	Wed, 25 Jan 2023 09:52:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABEA10E760
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674640375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
 b=Me5xzdffngrvzZpGFVd46r/jO+Nmk5jIx/+DkECjn4Yod4D5ysHr9Xo3Q4DnVvVjcISnqp
 W7wVuQqZYU6Pez2WB94h/npBjrcV1c6Ry8zw1S+w/HdT6fs/RK7jLT+37EGpjeDlpyPF9C
 tnjD8egfnBqu7+Aesc0SyTprCFL8LyI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-zmovLfYJMCu_78jKUBLDDw-1; Wed, 25 Jan 2023 04:52:51 -0500
X-MC-Unique: zmovLfYJMCu_78jKUBLDDw-1
Received: by mail-wr1-f72.google.com with SMTP id
 b15-20020adfc74f000000b002be276d2052so3022841wrh.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 01:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6cPchqoXvC7fz4HOb1ChIaitTq8x3iNoLBlJaQ4TwQ=;
 b=jIjz8epXi1hYsNhPifBLRtJ6HXgzAM2f3CTKs8kXaOxNNkXgp4gx3EOJLUBC8uaT1L
 eajJ07VLn7+0FHF4dVP2yfh9GtbW6fsQR5BH6F/KWyYaakQSG0NYq08xlp2FkhXayI3b
 YpiPJuapP+RoT8ZZTvVG4Ay+mNRZU40CrgnFqdIVKj9MJkjg6qbLd37HMdAwyVJeAE6E
 +w2gHWRTDkkybfcDWuuJjqHgwGaJwYgAwhNvzELr89yY1v2m+++MC4nMaY7KVbKhLRX3
 WaB2MAf+odPki8p7f4c5D2tyHoateQ1F2r2xgRq5RTpE0mVN1yUXM2mGxlBptbCkf4/r
 QrAw==
X-Gm-Message-State: AFqh2kofyChYOOqGAMZLc73ZIsOIzBqT5SEIyRaQQCtgghabTMNFkXM9
 29Esi9oPCwxXghY2ftcZ6aUULW2p/0WY14tJibTDTwthXVoq4JUCkWafsCGnCIYB9/W+fBa3xKg
 4aW/FOM41kY0yeiNz5OZwj/OErKU0
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id
 y16-20020adfdf10000000b002bbe8911829mr26349569wrl.4.1674640370485; 
 Wed, 25 Jan 2023 01:52:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuvmq2QmH2lib1EOjSoV1HyQPmQn7B/0nRysa3FFY81sXz4YqkvR1qkRuVsXj3rXTMZ7umf1Q==
X-Received: by 2002:adf:df10:0:b0:2bb:e891:1829 with SMTP id
 y16-20020adfdf10000000b002bbe8911829mr26349557wrl.4.1674640370241; 
 Wed, 25 Jan 2023 01:52:50 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020adff78e000000b002be07cbefb2sm4747862wrp.18.2023.01.25.01.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:52:49 -0800 (PST)
Message-ID: <8e5bb4ed-11fb-272d-4d70-f25252a0c5c5@redhat.com>
Date: Wed, 25 Jan 2023 10:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-10-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-10-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 09/10] drm/fbdev-generic: Inline clean-up
 helpers into drm_fbdev_fb_destroy()
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
> The fbdev framebuffer cleanup in drm_fbdev_fb_destroy() calls
> drm_fbdev_release() and drm_fbdev_cleanup(). Inline both into the
> caller. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E14BDEA01
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 15:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFE210E7DE;
	Wed, 15 Oct 2025 13:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YK/ErJOe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9BF10E752
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
 b=YK/ErJOe4ySVCbEZDx7t4Rrs+YpkmUaM7i5Nz8Y2h+86ClpnfCycAlli2dCvg0nT/gT/JJ
 JBDBMlxp2hivbyqDWvU/75CgrhsccnHK+b3Xj3G3Jc+4XlwhYzO99y2bT356rpLEV9g9et
 FVX3f1NwA3XVu1jQxknmOcCO4r1UFG8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-A-OwJzfVOg6uzTkxREnNQw-1; Wed, 15 Oct 2025 03:53:20 -0400
X-MC-Unique: A-OwJzfVOg6uzTkxREnNQw-1
X-Mimecast-MFC-AGG-ID: A-OwJzfVOg6uzTkxREnNQw_1760514800
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47105bfcf15so1432705e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514799; x=1761119599;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+HZgDzRdpaVTxvZqJl2rTn2R8LelhY8vbHUCgBN35M=;
 b=u/mxjL/CR/H1EZYyKKgiAymZwjzAra4XXg0zcmPFVL4Su5ES64LBYap55cRaeDaqPL
 +vvzlmyT/VKmdCkaYG34KvdP1f1ie1fEYYRyjAcG5zJRRVsoIfRcNAdlWW+8A2WGQnQm
 wBWjNPsc6dYpLcLo7UT/7W3CndpMoKzrwVic4+JVZD7MDjnyBYjnMRDN4rQBYDmeUWIU
 pnu6VlWZGwn5zGUJ7iO5AqzBd7yzOgh3k5V5C0jtAQikDfxrdScs1f/UZ1niDNbadOm1
 RmCz5VKM3zst7LGthe7YvexT49eXkQCU8pHs0pyO/b/AosLFXv64MsDzCEoaW1Zx1fx0
 Dv7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzWo2da/mcUIRN7/SrSdVdYtMLfB3+2EoGq6EfE8qRFj+XJlT0Z+Uib6izPbreOzQUgMJ6EYlp0jw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7PNOoRdXVhjkYTBCcLQ2hRaN6q0akYl55u32k/18HrljKVRBT
 vwI67Twth0en6AMwRxvq5mYss9vgHSu0mljQdE+PpDqF67sKCO99oxfV4QwelmggjfdK7EL+et2
 rH/1IsuRvCH5/Hgta3IuyWOkVdmbJpx+tpJkXNXoUGJXOB05u5LM8UL23SUsb64Fv5+bxLw==
X-Gm-Gg: ASbGncvjEmVCztnSCWQIT8GMZDGybKqhWnHylbMWf96z6iZzqn0LHLpudiqsU41HJbJ
 Hg5S0bbPZqfqXsYJK2Q7gJ20mI8Z/AWBZOhC9qB6YI3j8KXUaH5SStumJ7l1iTLHtgmzP/Ml27S
 gSOfU5L0808++8V97m1wQM4UOlzOhIFWKwvOxBKKwD2e3Mc6slNjtLNvdsdQMMrQr9VlLCh66zo
 1nRs11MWNAagY0e61UsvD3lBBesD9v5TiOfLmxN408vosW6Hn8QUpEs6hyzRQ1747DGvNEo1xsQ
 46sXxTkDup/KQVqhSxNIygAuwTtI6ZrWIBq4gzBSQ9rDNQBT9JtrhY3kcq2MyB7VQjZ7dBj2k9g
 cXCBf
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46fa9b11746mr202661455e9.36.1760514799495; 
 Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZf7d9TK63edfjPsh4LrX74Y6wRlhtOgKLsjlyk6mKGtY9U4BbM1bQ2mcLbjosAJUslcGWjg==
X-Received: by 2002:a05:600c:1e28:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-46fa9b11746mr202661265e9.36.1760514799084; 
 Wed, 15 Oct 2025 00:53:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47101c21805sm14875785e9.10.2025.10.15.00.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:53:18 -0700 (PDT)
Message-ID: <c256b8d9-ec9e-4841-9136-1198ad2d590a@redhat.com>
Date: Wed, 15 Oct 2025 09:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/log: Add free callback
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GMZ7-BhmB0mYu-v3daty2IbfI9FOHyHF3NXecKhudyk_1760514800
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 13:05:13 +0000
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/10/2025 15:16, Thomas Zimmermann wrote:
> Free the client memory in the client free callback. Also move the
> debugging output into the free callback: drm_client_release() puts
> the reference on the DRM device, so pointers to the device should
> be considered dangling afterwards.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index 116e0ef9ae5d..470df4148e96 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
>   	}
>   }
>   
> -static void drm_log_client_unregister(struct drm_client_dev *client)
> +static void drm_log_client_free(struct drm_client_dev *client)
>   {
>   	struct drm_log *dlog = client_to_drm_log(client);
>   	struct drm_device *dev = client->dev;
>   
> +	kfree(dlog);
> +
> +	drm_dbg(dev, "Unregistered with drm log\n");
> +}
> +
> +static void drm_log_client_unregister(struct drm_client_dev *client)
> +{
> +	struct drm_log *dlog = client_to_drm_log(client);
> +
>   	unregister_console(&dlog->con);
>   
>   	mutex_lock(&dlog->lock);
>   	drm_log_free_scanout(client);
>   	mutex_unlock(&dlog->lock);
>   	drm_client_release(client);
> -	kfree(dlog);
> -	drm_dbg(dev, "Unregistered with drm log\n");
>   }
>   
>   static int drm_log_client_hotplug(struct drm_client_dev *client)
> @@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
>   
>   static const struct drm_client_funcs drm_log_client_funcs = {
>   	.owner		= THIS_MODULE,
> +	.free		= drm_log_client_free,
>   	.unregister	= drm_log_client_unregister,
>   	.hotplug	= drm_log_client_hotplug,
>   	.suspend	= drm_log_client_suspend,


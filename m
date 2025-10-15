Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56586BDEA00
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 15:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099AA10E7DD;
	Wed, 15 Oct 2025 13:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JOfLyAd5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71A710E735
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760516449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
 b=JOfLyAd5BIsXGsx9Oz7hu9boXLH2G0GAoB0pGg+5hMITbciLUmHJ/pwTqK7nKg5VLJ8CVz
 GN2unXteq7eMZjrO5FgTys+huHsyPcDK8tBtP21nKcN5v33oRKZnVBZKTTZlET/6ooe6Y0
 9HL6RXykMK5POxtcNcfVVI8x6vvLa1c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-R7_JK3IDOmqEMQyR-tFvZg-1; Wed, 15 Oct 2025 04:20:47 -0400
X-MC-Unique: R7_JK3IDOmqEMQyR-tFvZg-1
X-Mimecast-MFC-AGG-ID: R7_JK3IDOmqEMQyR-tFvZg_1760516447
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47106a388cfso838845e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760516446; x=1761121246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HU62gMpjIaFZFXMtNGaeiDMNZ4Zv7CCqH8t0PFzlFoY=;
 b=f+xoDXp6rFXHAdEV8J8V+13p/ApGXhspb2RZsNQ1a9bBXB8KyWB/raoWbNOj8n69zQ
 aECeixt2n8wLWO92YM8dXvcArGAz51qWfw4U7BwY0p6BB/BtAtsnFOHPab1iFVPVcP6p
 C59KMT4dP8VQ23Vh9Z/PzEi90xdR0iiQaACM65kNDx8CjSXla/2ndNdl35LJX4sNxa5A
 nbcpuiaK+rBOtRqLaowjmbA5NOr176J2dBa3l+i6940esuDcp5ZY8wWPTSVlfy6xef1t
 wPp0m5EJdAR2uhN98ghEOVEE7u8ZBzLbgyTBPZ3wy3sXb6ZembI3Iq5mrDBjIsSQ2Oh/
 oTdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxx0RBqOpVY9nkhafXdOWizH8hNwTzJXcFzPORWCknlruw9Aw864QAaTeK/RcWOPbCDQKejq+Lnyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX9zwzFYJoy9igahuY6Bch5b3bqiyNdHH5xLWfRHjP1f/WTqh4
 rwSDb5xNlwfVvqI8IFuuJpG+WoSAgMiPHhgKnoDqOT8BfT+R8E5zKLAC6DT5AjHQhTsd9xc9U4r
 T4PQU2wo05/n53GyptfI3iw0dUiUDceltcZ77qaCOED/hfkKaf+HqKHCWbdi+d4T3U2xSNg==
X-Gm-Gg: ASbGnctvUOe7fR8SXoT4aJmtub6egb7O0vYtJDfhMzWAUItCv2tBp44895lxFBd95A5
 hq4hrnOEBmht1U6S0lIY7Q0gn9qI4anjdb1zS569ah9acUrBrypT0G+1cgpHKtVJNDz6IQyYTiE
 9zmqI8W93nb49XHbTLf9qtuqxMeKvdH+dH3Nqibi72g6mcP25d+sBoMAzrH/zn2PLGyFVLor7ll
 S4zeonRoq7em0fKSQXfHur5eL12L1FTXu3rXBOCD/0DM9lNEShN9xVhWKrVVSp4IH4P3gpyxmQy
 l2EJV3T9FLqpCMWgi98qeOEWjB5bvzCLt8FqVNYlotB0Ce9TQf7iRUqCsESfTBVaVMcERBSAmN/
 Hibrg
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id
 5b1f17b1804b1-471007a7a96mr9522785e9.7.1760516446519; 
 Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKG0piBaN7As1r+PD/K5QtUV2Z28HHZlEUD35iBfCWvoyf69YaDGLCaS5NwDRxAhyjJ4bu3g==
X-Received: by 2002:a05:600d:41c4:b0:471:7a:791a with SMTP id
 5b1f17b1804b1-471007a7a96mr9522475e9.7.1760516446097; 
 Wed, 15 Oct 2025 01:20:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb482b9absm327503135e9.2.2025.10.15.01.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 01:20:45 -0700 (PDT)
Message-ID: <c85d528c-6787-4023-8883-3519b7498627@redhat.com>
Date: Wed, 15 Oct 2025 10:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/client: Do not free client memory by default
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20251009132006.45834-1-tzimmermann@suse.de>
 <20251009132006.45834-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251009132006.45834-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wC4U1GJEKtUQBHBM2VWUz1xzxPen8zpn9N8ko_iIkjA_1760516447
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
> Make no assumption on the allocation of the client's memory. For
> example, amdgpu stores a client within another data structures,
> where it cannot be freed by itself.
> 
> The correct place to free the client's memory is the client's free
> callback. All existing clients implement this.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_client_event.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
> index c83196ad8b59..f36fe0392ce6 100644
> --- a/drivers/gpu/drm/drm_client_event.c
> +++ b/drivers/gpu/drm/drm_client_event.c
> @@ -39,12 +39,13 @@ void drm_client_dev_unregister(struct drm_device *dev)
>   	mutex_lock(&dev->clientlist_mutex);
>   	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
>   		list_del(&client->list);
> -		if (client->funcs && client->funcs->unregister) {
> +		/*
> +		 * Unregistering consumes and frees the client.
> +		 */
> +		if (client->funcs && client->funcs->unregister)
>   			client->funcs->unregister(client);
> -		} else {
> +		else
>   			drm_client_release(client);
> -			kfree(client);
> -		}
>   	}
>   	mutex_unlock(&dev->clientlist_mutex);
>   }


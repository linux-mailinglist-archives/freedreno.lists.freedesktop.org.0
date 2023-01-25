Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BC67AD3E
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 10:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CA610E75D;
	Wed, 25 Jan 2023 09:06:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1B810E75B
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 09:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674637562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
 b=bb0cqsZz0zKgtjULylOvCA5zhjbhsiy7kCWvEcUDU7FIWespAcyAhvJgC8zanwc9H8Bokr
 f4b0p1VBuRFRAPXXm46sJuZTijcuJFCPcU3MzxWDQ4PsXEhYUuhwhPTkh29+LbjunbxIhA
 Sd56FNpXh7VUBBvmu21Gj7MRC8VoZ+A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-16keAkXxNqWDl5PkugK4eA-1; Wed, 25 Jan 2023 04:06:00 -0500
X-MC-Unique: 16keAkXxNqWDl5PkugK4eA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t20-20020adfba54000000b002be0eb97f4fso2997518wrg.8
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 01:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ibAilFrTZpaXjvkv+J4hBVKGt8aImsFqCRRw10Pzcew=;
 b=xe0qZGh/FVbhk9fsTsihF13wSZjfmqYB9xDRhMRiWLXK0p1oO3g4NWmX8kgyuFz/E4
 UlvPgf1wDg845S8Y7Q8O3B2N2PA2FLG6pr1hea8E0FfiWVQTmPk3X8OqBQ/4R7kki4N/
 fmhWbVSKQTBZCyNyR3HwS4eHWPTm2gfP/mEO99b7XR0DwlDVUlYPslH8CE7u14w3nBe/
 i51qXT4nhBE64Q7CvK8Zf9saEyllrvWRNyEwTD87GuaYsn2XBgr0VRovsMzhtdpYlYZL
 qo+qOyjdYGBY6xU5wke4VBBd7xTx8W7HChIp2qSUvOorxL0Gz3JCByV7Q+cY+8A78/hE
 Vo8w==
X-Gm-Message-State: AFqh2kqH2yYMiKudiv6ML63W7FXur7RhUZOBe188iF+yqX4OG3sDKWBb
 WlY2xgYm7juhlvgcRHqWIzASYb/0cqtNzmY9aajftOTNbhD8ThZfwFpghpRw7Y3VcHz2iJTouo6
 fhFeiIkAuCHBevQtXmycfs9RHZzBP
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id
 n20-20020adfc614000000b00248ab8a5144mr21094641wrg.63.1674637559804; 
 Wed, 25 Jan 2023 01:05:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMP+tIsLwCvIpxNk0o5l1ZP8xAGyOaXYfWMtnUqU1wHmPoAjbKjb1Za9A6b4DyRU3i/fPKxQ==
X-Received: by 2002:adf:c614:0:b0:248:ab8a:5144 with SMTP id
 n20-20020adfc614000000b00248ab8a5144mr21094625wrg.63.1674637559560; 
 Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d470f000000b002bc8130cca7sm3865503wrq.23.2023.01.25.01.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:05:59 -0800 (PST)
Message-ID: <a8beffd8-5977-aa51-97aa-feef314541e0@redhat.com>
Date: Wed, 25 Jan 2023 10:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 02/10] drm/client: Add hotplug_failed flag
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
> Signal failed hotplugging with a flag in struct drm_client_dev. If set,
> the client helpers will not further try to set up the fbdev display.
> 
> This used to be signalled with a combination of cleared pointers in
> struct drm_fb_helper, which prevents us from initializing these pointers
> early after allocation.
> 
> The change also harmonizes behavior among DRM clients. Additional DRM
> clients will now handle failed hotplugging like fbdev does.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


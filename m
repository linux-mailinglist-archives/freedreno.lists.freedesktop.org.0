Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C467ADEC
	for <lists+freedreno@lfdr.de>; Wed, 25 Jan 2023 10:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A7010E74E;
	Wed, 25 Jan 2023 09:31:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0813D10E0DB
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674639070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/WkTUKbzuIyITLmeh/5Sbr5wRBScMiQq+Y/7HiPtGw=;
 b=d+zH8qUgX6rL7h9v6iS7Rth5k846BgCuMAA/BpSgdP2T0Yvbdh8CzP5G8n2/Allc2cs2oT
 d3G+a+bSi9bvvtYg6YBjKmeRjNerclb5K6tjF1mzh1fetz+R0gK//+VnvO/6wmHDP/iYXd
 aNdN3G6T117/IOgJsqeZyAd8HiY+MYE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-tJmc4BdmP52YcwBtN-Sg8Q-1; Wed, 25 Jan 2023 04:31:08 -0500
X-MC-Unique: tJmc4BdmP52YcwBtN-Sg8Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 l8-20020adfc788000000b002bdfe72089cso3064142wrg.21
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jan 2023 01:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e/WkTUKbzuIyITLmeh/5Sbr5wRBScMiQq+Y/7HiPtGw=;
 b=ZYXyCLpERFj0Xwv8ObtPIueCFJu63vJmyp5ndcKRBnXDLM45ClqjNZHh3it/xWpDZZ
 E8NoAhMc8bIgKfgWy4kIU5phI8tfdntKekgdpfFt/p/N+4iWIhAG3o8FJpU8GBtrrn3z
 D9E9O7ORmVWFki0ux9R2voDApIoQB07NVWcBhKR4Ght9Op5GA1rFZU+7LQKMD03UsIgX
 domA3+iCCf1ER5mfV5ztA+mVbRcSGPlBPMCt9g2iesoHQyJE/MlvIfJ5pUHV1Prd85/g
 y2paO473yV1p7ygcWIAG1YcJacZ98f7fX1hn809x/vLh9A1HZ2bPiG5wBPHc6OKPGdkR
 1FMA==
X-Gm-Message-State: AFqh2kqM7KyzXzAc9O1nhtqbXCMS83i1Ln1Vi1SU2A64DcSVbGAzNYhA
 Bqz8Jb877C0XUnxF2sIk4clWvaYGEbIKm0ovYwva5sehBmlgL3zufQQXso99JQrSNV2sjEFf9PE
 D18nPXn3vkOEwSblMRqlRlV9iJ70T
X-Received: by 2002:a05:600c:c10:b0:3da:f5e6:a320 with SMTP id
 fm16-20020a05600c0c1000b003daf5e6a320mr35822720wmb.22.1674639066893; 
 Wed, 25 Jan 2023 01:31:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFX/Kp2mSluNmLe5a+pgmO0l5es7cQOLhWqEKWjvp22TqYJWLpxeu0OJ4sOlzZNMpRvS8iog==
X-Received: by 2002:a05:600c:c10:b0:3da:f5e6:a320 with SMTP id
 fm16-20020a05600c0c1000b003daf5e6a320mr35822702wmb.22.1674639066649; 
 Wed, 25 Jan 2023 01:31:06 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t20-20020adfa2d4000000b002bdcce37d31sm4573358wra.99.2023.01.25.01.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:31:06 -0800 (PST)
Message-ID: <6bb09a17-2f13-4920-b156-3be80e507f48@redhat.com>
Date: Wed, 25 Jan 2023 10:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230124134010.30263-1-tzimmermann@suse.de>
 <20230124134010.30263-6-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230124134010.30263-6-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 05/10] drm/fb-helper: Remove
 preferred_bpp parameter from fbdev internals
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
> Store the console's preferred BPP value in struct drm_fb_helper
> and remove the respective function parameters from the internal
> fbdev code.
> 
> The BPP value is only required as a fallback and will now always
> be available in the fb-helper instance.
> 
> No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

That's much better indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


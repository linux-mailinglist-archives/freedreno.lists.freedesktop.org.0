Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C748C637D6
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 11:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5266910E33F;
	Mon, 17 Nov 2025 10:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZWsoU4u7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0810E33F
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763374785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
 b=ZWsoU4u7QfTWdxqzAnrBEBGDdgI7E7j6/Z3NE8mxQorqjbKwliEsdCzgZntPZkYXuRr5WE
 qiCQypiljGGDNlkqOgq+tV+eVaRVHDrFLv4ol0t3J6hYksK/nlKNpOQJmpfUx8u6+obJZx
 rcGNU251xAljKBCsJqeO4hzgrDouUtg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-jUD509RRP8Sb2bh6jhTAwg-1; Mon, 17 Nov 2025 05:19:42 -0500
X-MC-Unique: jUD509RRP8Sb2bh6jhTAwg-1
X-Mimecast-MFC-AGG-ID: jUD509RRP8Sb2bh6jhTAwg_1763374781
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b2f79759bso2864675f8f.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 02:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763374781; x=1763979581;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
 b=GK10s6oeQO8uOShlpRXWnzptXpwLvKY+jojKyYXffm3syO8gSxVpZdV5RoZyBtzxBi
 YHhT2yr9NQaZ+Qfwh7UBmpvzjkaIXR/IulNWUQitgmvktota7a12e7nMJqil8dySzzFB
 z7qeorh8sAeS3nBCe49G3nxBnuVMvOycl+jFGQfIOlNyPe8mm6PebLOAgI0swQInLXKS
 eVNovOKZd1vVlnc0uhvkf3SOg/HAUBZpUiyb73T06opkWcc6G/MKBlMhubUvoB3EO60O
 M4jN6z8iHxuUlfduCepJlE69+qk8VLWyHR4Xg8kyCIexbfyo8iaBXzxhgnl3FdVent9s
 ZWHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxYdh/ji9nTMY2o48AUIkK7U27iKLl/Z05WA8RQhjxqT59TmKSNGdw9KUSMcvvSU3lg1dtnVLilX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTmLd5TAHac6gWS0iZEvWPAudENeMFa3iSNfCksOOkWhWDc1Kl
 6/qriMCNk2pyGvOQM443T/vYR0p+f9uy30bN4a01E8onn0JtIP6imDvh00MASqzknPsNPp8uY3C
 A6tMT6BfaV/5BUl2jjQJH/kSwqNQfIrJWF9nz3T8DzdsIKQB45t42kGVf0loZq1Fye5eD0g==
X-Gm-Gg: ASbGncsNtnWDKoZI0u8cvOoavpXdBhyENQ/bwAsDuQ+zdQTUQrL3oQGFLs3Bq5+okmq
 E4k1kVsM8eyHRvpDhXZjPKIlrNtSygn+U3ZVs6fTQYnzj14MAGPfUPH0XC5mhTk6fmjguihF9uD
 JP9nocDzRRvAZ3aBLtAd9UD6NCVoiK3csT4JEGA1uXim+hDvTJfCH9mxfveXjEmrUcWW2DMB1qO
 ks/r/Hp336I5EKbq+bMcijjb6mJKPwH81oTqVYkUd62UK5vA6wNzlAXZHbTWmb6XN4Fn9TYE+hj
 xj7L0FtHe1o8fcwNxZKOeHqd4EVRvWYsHYahjFa7iZ0SAss5JaeyEUBckdotrN7Wl2VUbdqhirN
 HBPMSxdrQfnSsq9qgyeGQUJ8s0U/yGU4RzgDPGa5P
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-42b593847f2mr10779169f8f.47.1763374780935; 
 Mon, 17 Nov 2025 02:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuLJzRkeZwRTSmYiDMNFB5b9Y04M5/X3K0AsCLwjmRlR2lS/HTXuIsn1n38y2t71o3SspdXw==
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-42b593847f2mr10779119f8f.47.1763374780429; 
 Mon, 17 Nov 2025 02:19:40 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b8d6sm26377484f8f.28.2025.11.17.02.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 02:19:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in
 single place
In-Reply-To: <20251027081245.80262-1-tzimmermann@suse.de>
References: <20251027081245.80262-1-tzimmermann@suse.de>
Date: Mon, 17 Nov 2025 11:19:38 +0100
Message-ID: <87ikf9kll1.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h7tVeva636eSjwfjwxlL-axizYd8__aauXwArhGTkQM_1763374781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Move the calls to drm_fb_helper_alloc_info() from drivers into a
> single place in fbdev helpers. Allocates struct fb_info for a new
> framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> create an fbdev screen buffer. Also release the instance on errors
> by calling drm_fb_helper_release_info().
>
> Simplifies the code and fixes the error cleanup for some of the
> drivers.
>
> Regular release of the struct fb_info instance still happens in
> drm_fb_helper_fini() as before.
>
> v2:
> - remove error rollback in driver implementations (kernel test robot)
> - initialize info in TTM implementation (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

It simplifies the drivers' code indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


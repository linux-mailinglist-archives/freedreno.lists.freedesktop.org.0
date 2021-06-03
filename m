Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56549399D0B
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 10:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8976F457;
	Thu,  3 Jun 2021 08:48:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1538C6F455
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 08:48:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o5so6193630edc.5
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vPAp0cDqkozZvEWRxxBHH5RxVtokOPhreu0KnKBlDT8=;
 b=Dfc5iwcBu7xHR6cCUm7AXpRC3Am+2tgSjO2cK3b+y81daO+VUcDnqv5aiqhlX2f8ET
 6onChdoAnMmIk5UTlu73QIpDDtNnf1X2MUG0IL1DmsIJFdqoA6heSynaLiB8Ryp9ysYy
 aHhDS1NSxmydVwhy0JCxhpd7kO6T0dhC7iCfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vPAp0cDqkozZvEWRxxBHH5RxVtokOPhreu0KnKBlDT8=;
 b=PEe/FcTu7wkI2qdHjNBsK9NMTsGhXD9Yx7nBLLOfJ1cb0yXRvZ/Vs+swALw1rIoqm6
 iWrSY9fNUU3NtVHatNlZERPvGdL1XeYz9ghXlcCLQjE85F4nQ7o6sznJOUegk7GRjBXn
 XJ0suoZNZKhWHneTO50M9Zt8yK9PosBZM2Y6zW7V3pnpIGnYv0lXYD/ExONFlsEYY5Zz
 Jivj/iNBtxAsDH3sCFJcfKcsrs6QT+60YFVMcVZl/K1hBhD5qa98Ly81csdDbP6OBDte
 JZhdkfCw2SH63FdpKCe6m3a4wG6VvdWH3Xp/OEcxS5tM69QJAKtpz50/icCYC2Gd3WjD
 QviQ==
X-Gm-Message-State: AOAM530bz9e1glCF3dW0aKqtWRNuk/MT69Uky5bfTh/Mn/kgpDSVndF4
 d/RJKbw+tbmF3D7NNfUsRgzXcg==
X-Google-Smtp-Source: ABdhPJwv4djZniG7P4/1rgxf9Fevn796Yj3QoQ3lNQh0vjHJ+sYM0uCv+TLIpzDfNoN6sGHi5HwO+Q==
X-Received: by 2002:aa7:dd57:: with SMTP id o23mr42071917edw.98.1622710116626; 
 Thu, 03 Jun 2021 01:48:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z17sm1232609ejc.69.2021.06.03.01.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 01:48:36 -0700 (PDT)
Date: Thu, 3 Jun 2021 10:48:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kees Cook <keescook@chromium.org>
Message-ID: <YLiXYa8OG9hlaEE5@phenom.ffwll.local>
Mail-Followup-To: Kees Cook <keescook@chromium.org>,
 Dave Airlie <airlied@redhat.com>, Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, kernel test robot <lkp@intel.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Emma Anholt <emma@anholt.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602215252.695994-2-keescook@chromium.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Subject: Re: [Freedreno] [PATCH 1/3] drm: Avoid circular dependencies for
 CONFIG_FB
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Linus Walleij <linus.walleij@linaro.org>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 02:52:50PM -0700, Kees Cook wrote:
> When cleaning up other drm config dependencies, it is too easy to create
> larger problems. Instead, mark CONFIG_FB as a "depends":
> 
> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> 
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Link: https://lore.kernel.org/lkml/CAK8P3a3jUQs6c5tESSNMbqfuymewj9FhqRizyHcfOXf8Rgy-nA@mail.gmail.com/
> Signed-off-by: Kees Cook <keescook@chromium.org>

I rebased this one for -next and applied all three patches to
drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..90891284ccec 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -83,7 +83,7 @@ config DRM_KMS_HELPER
>  config DRM_KMS_FB_HELPER
>  	bool
>  	depends on DRM_KMS_HELPER
> -	select FB
> +	depends on FB
>  	select FRAMEBUFFER_CONSOLE if !EXPERT
>  	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>  	select FB_SYS_FOPS
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

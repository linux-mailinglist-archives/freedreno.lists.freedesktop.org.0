Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76FD743962
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 12:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B0210E16A;
	Fri, 30 Jun 2023 10:33:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509E10E16A
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 10:33:21 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso2751852e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 03:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688121199; x=1690713199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BV6pMCNFBELZthFQNdbEPY0LFf8oujVmtU/HlHM5O6w=;
 b=La97SAtUMDaQJPXoGRraZ0zdFoKriXSnJyG5uqhKNWQLBvzsNLIa3sVbPGjI/Hyn6r
 CwAUr8zFLmuU1Hw6/1WHilfZMHUbRmEi3qC+ryRszPZL6yTQZGTK/Fzq93hyTrPBE3ld
 lvLHmDjSPBltv0e0WuW3AvCI1sVhEa6O7rxJXMNLcxJnQHKJ9hdlugyO7Ta3UAvdfsjR
 vXB49PmJZrbWS40WXb320dBMOKwsnfMToxiq20oHb9+hWxDzy1gJT0GxGHFPpm6iJkbV
 RdnaTWKi8hXixIY83GUyhOPj4PwhlGU5Rk3YCCUOP8WZj09ShQyDQ6kSgG8jPXJ5z+t+
 JreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688121199; x=1690713199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BV6pMCNFBELZthFQNdbEPY0LFf8oujVmtU/HlHM5O6w=;
 b=i/xlBFCE4bf0qmHBVmKnRUTMw5+vOVhFnQpHHE59juyI8RpTV0PmxlDIR0ibguUHXc
 cIFAnyaNvRY2982ckw+i88xomr7mBSwL9wSNBu0oSjMVeF9snpqWBeHAHb4y7nI2QTi6
 ZEBFgMgceumnjgqI+do1MZ8VknvR2lz45THuvhE4HSm9CyqX2O5CPWyzYN1DmO5JqFVm
 GER1KZaScnWhCygGsBane1B92jaoXei3JXr+WJqgmV4VBNCCYLZxz6BCXW0aMUMEElS7
 p+Oz6PrANFXI3MpHbQNw6RcU2JY+Hvb0Lva5DT+kjjBJxgksHDNMLF4pzriUBU5yden4
 tJKg==
X-Gm-Message-State: ABy/qLY4tJVaD8IM68j8Oh13Tf7/z7PCbJn3iyxSD6sY07IaYfgt/rTh
 r6UAIBfQ3jsXnEwgjK3uxsvirQ==
X-Google-Smtp-Source: APBJJlEQ56WLGrt67F0epM2MytRHTKau3I6Ew1h+D6xetubMMeQ1wj68PFO/tnppTDhXOMB2EaKmOA==
X-Received: by 2002:a05:6512:280d:b0:4fb:18f4:4cd4 with SMTP id
 cf13-20020a056512280d00b004fb18f44cd4mr2161674lfb.55.1688121199585; 
 Fri, 30 Jun 2023 03:33:19 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003fbb06af219sm6875419wmm.32.2023.06.30.03.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 03:33:18 -0700 (PDT)
Message-ID: <972b7cc7-77de-e332-ba41-b96c01dc7939@linaro.org>
Date: Fri, 30 Jun 2023 13:33:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
 <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230404-solid-fill-v4-1-f4ec0caa742d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH RFC v4 1/7] drm: Introduce solid fill DRM
 plane property
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
Cc: sebastian.wick@redhat.com, contact@emersion.fr, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, ville.syrjala@linux.intel.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/06/2023 03:25, Jessica Zhang wrote:
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
> 
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
> 
> struct drm_solid_fill_info {
> 	u8 version;
> 	u32 r, g, b;
> };
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/drm_atomic_state_helper.c |  9 +++++
>   drivers/gpu/drm/drm_atomic_uapi.c         | 55 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_blend.c               | 33 +++++++++++++++++++
>   include/drm/drm_blend.h                   |  1 +
>   include/drm/drm_plane.h                   | 43 ++++++++++++++++++++++++
>   5 files changed, 141 insertions(+)

Also, I think the point which we missed up to now. Could you please add 
both new properties to dri/N/state debugfs?

-- 
With best wishes
Dmitry


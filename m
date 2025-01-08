Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A6A06354
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2025 18:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8710E1DF;
	Wed,  8 Jan 2025 17:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WjiXP2vs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165BA10EC2E
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jan 2025 17:27:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so15233f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 09:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736357180; x=1736961980; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bI5BkTsr1Rej7kPzTQ7NrBrtLjPHANabm0Md7VMapXI=;
 b=WjiXP2vsOQo23gE+hvSUFDZLpIOBbclw9tqghJ56MPIDsHo0i3g4vwO29T5rZG047b
 RYbdcO7FQz2qjj3zKUrv8WEbDVsCWw8iAzJzDC7Tg9S7QiEaCHu3IKxACp4AD2Ke9YdY
 5UR2t27WGrhOmc13Tk6HPdC6iUgxiLBhrZPoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736357180; x=1736961980;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bI5BkTsr1Rej7kPzTQ7NrBrtLjPHANabm0Md7VMapXI=;
 b=ZhZOm7UE/N7lPagb5/YWG4uP68FoX3M472NVGaU3seZnzndc+raym/cvhpN3REuI3g
 WoidO1mfMPQMBroQtDOdpCsmtt4i2HrUZWkTaaC14hFKm1sYT5rsohitfzJCi1jUfp5z
 Dg9NV5wlMjvWm+PKditr/YSDHoqZB+/VQbEdJ6il0xLuY9vblXCkQJeTCS84XtktoeIQ
 W7kINDX20Vr+gzpac4sitmJ1eZ6WNFlRolXGK7H2UmgR81l4mKyyJxY+WwxkbbO+UTED
 HX9tErYUOqqpqMi4NWoBfnjXPWH3Lp7ck8L4OB76+lwmQUUXUb+dtv2t4+SVM4b/bl03
 l3bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCkNXz8PsYVT1AG0pK3pr5MbFOMHELXzaQxHAFblmyrzsdzlrZRfmln+dDUdYcEj2Gq4ILsyxy/Y8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJSqSRLEFw6Vizu8KZ8VQIcbkktQi/X3xg8DhmQrtjEuUvs7aD
 6QFuBlU6VjGHAvvu0owACZCGfH6pT3fCHbO8PjS69GBtYF2A+/G3ZGW0CoofqlA=
X-Gm-Gg: ASbGncv0TCLu2zJSpIP+ByEL86laPnzdwlXQis7GlOL1O3lL4N2pQSXjjKVK58uUJ++
 KgOuv0o0S26dHcQFnPanOK7yF8eGUUWzJzJ/98P0YH64dqV7fX3dQI/FcEm424uzCm15uayVyyP
 DKG+rQH92ZfLnmvK5nCEK32bIc6pEuqgqk9d3DAi98yukJPw1SNvvIT3A+gfgsCu+eciAX7umqY
 TnqkKg7f30KRDTdF7S5yaddcJeqJFuXi9ITbEa5Qb01hzQ0661oo0DIMj6ZyXyRz3z4
X-Google-Smtp-Source: AGHT+IHIG8gIkIZLnGTj2vm2ov4/i2vQzdBqNMlxt0wme6qkxMsRJFFigfl4B+bpgLZ7xuYAvDMDEg==
X-Received: by 2002:a05:6000:1446:b0:385:d7f9:f169 with SMTP id
 ffacd0b85a97d-38a872f6d09mr3033928f8f.12.1736357179644; 
 Wed, 08 Jan 2025 09:26:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8334aasm53404544f8f.41.2025.01.08.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 09:26:19 -0800 (PST)
Date: Wed, 8 Jan 2025 18:26:17 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 1/6] drm/atomic-helper: document
 drm_atomic_helper_check() restrictions
Message-ID: <Z361OTdcwtPvN17P@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-1-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Sun, Dec 22, 2024 at 07:00:41AM +0200, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check() calls drm_atomic_helper_check_modeset()
> insternally. Document that corresponding restrictions also apply to the
> drivers that call the former function (as it's easy to miss the
> documentation for the latter function).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5186d2114a503701e228e382cc45180b0c578d0c..f26887c3fe8b194137200f9f2426653274c50fda 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1059,6 +1059,15 @@ EXPORT_SYMBOL(drm_atomic_helper_check_planes);
>   * For example enable/disable of a cursor plane which have fixed zpos value
>   * would trigger all other enabled planes to be forced to the state change.
>   *
> + * IMPORTANT:
> + *
> + * As this function calls drm_atomic_helper_check_modeset() internally, its
> + * restrictions also apply:
> + * Drivers which set &drm_crtc_state.mode_changed (e.g. in their
> + * &drm_plane_helper_funcs.atomic_check hooks if a plane update can't be done
> + * without a full modeset) _must_ call drm_atomic_helper_check_modeset()
> + * function again after that change.
> + *
>   * RETURNS:
>   * Zero for success or -errno
>   */
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

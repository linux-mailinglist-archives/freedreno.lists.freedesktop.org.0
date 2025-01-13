Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B4A0B104
	for <lists+freedreno@lfdr.de>; Mon, 13 Jan 2025 09:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F49310E4DB;
	Mon, 13 Jan 2025 08:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hiVqacxi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4907410E4D6
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2025 08:26:14 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-54025432becso3693228e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Jan 2025 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736756713; x=1737361513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
 b=hiVqacxis646nluQSlcULkOd6N3WEai1ty5erEMJToixb8wsJ7WAfHeN6hYV7JxD5X
 5GLuhFwJAOfY5r4XQHDJh7nvzf1EXmzTJm4SzNxIkU19BtBdoLApxM+wB7w8NvIeJ5pH
 JT5QxgwX/FKDmuGA6F1d5ZOmpdbyy67hS/E0YCoNg2FwHRi6Rg9gDKRBsEWUJyHkMf4A
 Ch33Ea6ll7StVHNfhY4q1keqv+fwjC04vgmTCLwcmyX2B2Tfa1KQimwDnDExdGP5yV6Z
 +Y+r3jfYr5lwBPuWzYkK8PL7qWA/XSlNkaDjV2hsoMpBRbN86SrmbZJt+yZhrZuiK0E/
 zS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736756713; x=1737361513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
 b=vDKnqOxwCiKKPkAcmo4m8mnRvoJ9rxt2B3svDmVT2pAdk3Q0Wqz6jDAPCtBLv26SHH
 QCNgMpLnZ9cma/m4GEE1L9wF/ozasIl5Cop3RGuRMDVYICaqUSXAqlsuSI9BFMWNAhh5
 0iDih91wFzn4Wmo83GLYgRKIhU77vFdtMOPZKk1o/iD9u/7VDQR/KsMyz6y1yXzbMkU5
 znuFGbe/FS051P7LVggcJVmbiAfDkiOk1T3xnpMRSNr6ec2ihBU7QkLSkNbppvljbCth
 TJccDh5iuc66+ZcamavveL6+WDU9t4VwgqmNJb8FUk2ZkgIwInWakPeA0HZiGxO+I8FO
 SlmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCXSVyXiThvTqAifbshCuEs1ObCCTyZwMz44DZfno4QOJdmGAv2ginFVxWlsGgQgRibpD+UT3fGQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx21ghgjOpHq7N9gey02hEx5qCIKJi9mvQJ87kGD4VuOyBn5SiA
 AMU7ko6wBeU3SYIrNVJwP4Ro6UbnKzIyADRLFqEXGFmf6YlzCM4rwkP91BWc1fc=
X-Gm-Gg: ASbGncvEqr3j03h7+Cc+WAAAzeu6ykm7QvIKMlYtBeVvgkIx3PLY7BeDdoBnjXnY9Zx
 6PBRMrFNbTcIaAs30fIMFd3SxPbqJHwvKYVXYPwJd/pp40M4Or8oNciXFL4rr/lvD6V7DL8wU04
 IdeBp/Z3jHK83yY+AbXUzMo3yYiKs3YgZS6rtGIMwsOIv/Jf1fIygB0u1rKUYfdoM9doJQkv0Xt
 2jYSDSF0LnaGpv9+nHMB7s2Elnqn7UIvmWVbl+/09eUQgCpXHu4aJ7c6vBv1WO2OP10dM2pGGpK
 rEHj4nt8GgApNwEzvm6OujSA7jMdaTR+06At
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id
 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614; 
 Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>
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

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry

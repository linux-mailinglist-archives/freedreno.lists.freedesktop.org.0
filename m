Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42759A57665
	for <lists+freedreno@lfdr.de>; Sat,  8 Mar 2025 01:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D2C10EBBB;
	Sat,  8 Mar 2025 00:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qxfqLXGn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDC110EBBB
 for <freedreno@lists.freedesktop.org>; Sat,  8 Mar 2025 00:00:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso8938701fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Mar 2025 16:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741392029; x=1741996829; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AEwMiLzCyICEunJ5u9SkRaghHLUa2TZbSRFS1CMQbNs=;
 b=qxfqLXGn9y/WjSWkyNIBD4GGTZ4shSXhq6NUq99xu6C85uuURdghgpDvN6Q9VkCVWZ
 uu0v0yRM8xSCUcOWOr2/J2FL8uY7/t9+TqbJUoeGJGxnf9oREkXcIFCxgqwuL0ljWAOv
 0awkRvip1B7xcO2qmmYth7hay0Nkdzvjwsfdfu5qh8jNaUWRhpglIKN7YhKs03T+I2N+
 rmF1pnqzr1xrErkRK6OpXPoyzD4q5o9IpWL4p1vBZOA7yU6Qd4v9aScm7dXCgKmZD6EU
 NGoXGiA864nXpPb7GiYMlv4rUsSJSdQ2fkzO+HhSHJvm2UjSBSOoPNY2J8cHkLfp3kh1
 OFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741392029; x=1741996829;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEwMiLzCyICEunJ5u9SkRaghHLUa2TZbSRFS1CMQbNs=;
 b=FjKv/IayU2pWEZCvu10hrOiNy2fiDTXuZbCZYg3OPGXeb4iM0V+lwUKYxCmuLgSQHh
 0M6obIK6Og0jBNcZ4AGUk+GFvF9TIWCBPaFKThE07RcyFIShp4twTWh0Vm6jtrWHrnD1
 DTs4TpL0cXN9A+epSlasvfQqzsB3ajpehE8sZenjkFptX+QZOQ5Kopt2Fn1Dw8DH00uG
 vPJs03bs7BIHUBvSrDDPtII1ncgDEDg3jEA5oXMg0EHGhH4w8r3GexPEE54Y/itzKwc2
 2NHT6Z3RHbl9TJUx0B+8B6Mg9th5io9SydEEPB19Fr0Bh4L2cnj1ODcMvAgtqPor0+zG
 aLig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSpeSUfEgE4DWqq9ZqMSDjub4oTDrsN1AmDS/n8GHygbPPG1ZuabvzpVniUX2suAPV2TRpHcJUubM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6ry2lDb38JbeKn4QJRC4FUwhGORzsNe5DZkrxi40GyltVra7g
 GgdJIKlfn/B94WvymSCPQgT3DstpuaOFJSZYOC2svP+9h0FLvVqe7DaTYXVrkh8=
X-Gm-Gg: ASbGnctl/88RFbVaI5lezQBeyK1gS2wnm+tYl8Jci4PgXxXWQGYnJLALSKj7UpQJLfp
 RhWOcR1izhAW/+B1aXXykdaDrCDXpbCLEK75wthMhKN0bHU30BNDVWxRHI/IcshC0QTq7I467Os
 nbPVmNYdHNK3qD3AX1Pi/c4epN0djoBFomZ8BJu9o9TjqGNTHs+6o/U6Jk9qoIkMpXIXmeQriGx
 qFeTUNY1ixFsuwoNim3+PNwIdUP5RZ72KN0zMRXTXG3AVUxSvNllzrWd2NIG4HI0qqVrzLXToh1
 NM3QhGa+d3AIQmfQhN4LQhjDrviLz6S5uxrYHnDqt0azwqa4c+jFAZLHYvg9JcWPevFQVD03BTe
 tDkGq/zSPq1tclRjMMzo9XasH
X-Google-Smtp-Source: AGHT+IHp+tbCuGTMiQOtkAJeNqJU+GLHRyHQrcNbiQ0L6CepcDGTgtUgqeherQpSU3yjAqkm/DxJgw==
X-Received: by 2002:a2e:a78a:0:b0:30b:c3ce:ea38 with SMTP id
 38308e7fff4ca-30bf43b45bcmr21229201fa.0.1741392028923; 
 Fri, 07 Mar 2025 16:00:28 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be99c815fsm7131741fa.69.2025.03.07.16.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 16:00:27 -0800 (PST)
Date: Sat, 8 Mar 2025 02:00:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH RFC v3 4/7] drm/display: dp-aux-dev: use new DCPD access
 helpers
Message-ID: <ytsczbxfokt4yz26w5zl2rxtuagrirdpi6uyxnt4itcllrowuk@wqqcgkr7b52k>
References: <20250307-drm-rework-dpcd-access-v3-0-9044a3a868ee@linaro.org>
 <20250307-drm-rework-dpcd-access-v3-4-9044a3a868ee@linaro.org>
 <3284acdfa43fa62e7230355b4ed2e09ab75f326a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3284acdfa43fa62e7230355b4ed2e09ab75f326a.camel@redhat.com>
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

On Fri, Mar 07, 2025 at 05:53:38PM -0500, Lyude Paul wrote:
> I thought we had agreed that drm_dp_aux_dev.c was one of the few places where
> we wanted to keep using the old functions here?

Hmm, I thought I dropped it.

> 
> On Fri, 2025-03-07 at 06:34 +0200, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Switch drm_dp_aux_dev.c to use new set of DPCD read / write helpers.
> > 
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_aux_dev.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 

-- 
With best wishes
Dmitry

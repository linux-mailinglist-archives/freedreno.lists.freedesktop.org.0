Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4D3A36F1C
	for <lists+freedreno@lfdr.de>; Sat, 15 Feb 2025 16:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9784710E19D;
	Sat, 15 Feb 2025 15:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D3NqMrHW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DFF10E0AC
 for <freedreno@lists.freedesktop.org>; Sat, 15 Feb 2025 15:28:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54504bf07cdso3051968e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 15 Feb 2025 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739633279; x=1740238079; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AGf5rmg49p6MaNgIwMB/5odZQ50Ill9b6G6pRafnfic=;
 b=D3NqMrHWeUaFWpbjwWN2mxABuxBz+qM5u7NJyE27AP4Xf+4Tn8BahCg2JTYZHcNOvG
 bALk+3z60fdDle2E/C3mQ9CljjrmTgyzhVPSyElbHCgdDSzsQ4uapDoveRUkozo0XUFV
 fqPf5LoX3g1LgI7vu8RIX4mRnOIGLpqjqmOacTEFCNfrnasCjKbq5aWNdCAyqtcp9wg1
 +yu6CtIOYKeLDSa1R1X3SBC9vYk+faBN7h2OkbGOEwGVHeru9cLfY1jKm3DS+F4pFJ90
 rpVLGkiL9Ri1seO9kWf0AbXov1Ox9o/Cyn2jWgX6kfKg+le0jA732NX/aLJwPeLS5Zg/
 +fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739633279; x=1740238079;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGf5rmg49p6MaNgIwMB/5odZQ50Ill9b6G6pRafnfic=;
 b=b0Xp5FC8OX7XnOHJuYN0fLOodrg6EzItgZSH3SpLGyn5/EHtMqo+YHCL3NcaedGcW+
 RvLc3Czv8nplXctDrqQ0T4LDf8d7SzsyplQfy3sqAq0rREfKFoUaTEp4fjDbE+IIMix8
 7hiNrjsN8TZBi8WptLBweiw1acKuXoj9ovV9jy31ug1PJonVY8t+IeZYRDcSq7iVgqW7
 ox8qL4Df7HU/v1tWl0Z/00ufKIOjxu0f2YAb8bFnSUwrMxhc0aPfir2lnuoUp8B4NQUt
 ysFUZJeb7+3FSU0SWlZeWltHRmSk3z5VXyVeMERUgW0BgMqh58aezdN1ajFpJPO8Ib73
 f7qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI0hRjsFtKwylFqPUp1h3t94ZgzwyUj+Vdqw27hGdzM8oky8ICS9cOE0OlFMknBPb0HM2ZwSOP/ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgzl6LlS5iOWvOhCEoTC5HlAuvXxvlnkrrjnXtv3nRCy+j+Tuh
 1+/DB/Li8nv+9vIgH92O+Kji0fgtOPExW6ZqxlVEh8wQeo6RkjrzuYDMucqB2m0=
X-Gm-Gg: ASbGnctGuRNUsUgTCquqAdMtg47vc/rnffWftxhdDlLyKCulX11TynEZkjhF6kuyENP
 ZHdgx43r5ZeZKc4dJEuqc0gOIuXHAhIemCecNu0Wpebd1Jb+4g4WFW/L2jysxfbCrlgmbXf8gfN
 kDI0M+wGVrUPYYbN7pnISBI8IaiTlV7w5qBjEE1PZ85wfIm/9EIVQEbTjXojg54DCh9ax0Zi8s6
 TJDZCDzxooe7K6vjK2zuAe4qAU5Fl6xbnFF3k/oadTUgwHed8y+tpbacz2L3Yv9wsa/KqHv73O5
 /jjoqEs+iiYDJEvktAYFhBrsSKG6x7wYPuuEcs++2b5VE5iSOPyInVJLpDfbTO8PnmPygvU=
X-Google-Smtp-Source: AGHT+IGM2zzla/sAtpjhHsDca+TA2fL77Ecg4EGheoA5N95v+ACAAM7LoIlZRAUhg5mZDNj9h6xYJw==
X-Received: by 2002:a05:6512:401b:b0:545:fc8:e155 with SMTP id
 2adb3069b0e04-5452fe4dc30mr1064901e87.20.1739633278874; 
 Sat, 15 Feb 2025 07:27:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5453197f3f9sm162596e87.53.2025.02.15.07.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 07:27:57 -0800 (PST)
Date: Sat, 15 Feb 2025 17:27:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 07/14] drm/msm/dpu: Reserve resources for CWB
Message-ID: <55njf2p4cg24bihrp7n4laaize7onslfgke6bwqw4jfofsaxq2@epwug3zfs2ow>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-7-a44c293cf422@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-7-a44c293cf422@quicinc.com>
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

On Fri, Feb 14, 2025 at 04:14:30PM -0800, Jessica Zhang wrote:
> Add support for RM to reserve dedicated CWB PINGPONGs and CWB muxes
> 
> For concurrent writeback, even-indexed CWB muxes must be assigned to
> even-indexed LMs and odd-indexed CWB muxes for odd-indexed LMs. The same
> even/odd rule applies for dedicated CWB PINGPONGs.
> 
> Track the CWB muxes in the global state and add a CWB-specific helper to
> reserve the correct CWB muxes and dedicated PINGPONGs following the
> even/odd rule.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

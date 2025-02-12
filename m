Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D207A323B1
	for <lists+freedreno@lfdr.de>; Wed, 12 Feb 2025 11:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B8510E844;
	Wed, 12 Feb 2025 10:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ag4FATBo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DEE10E844
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 10:42:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-543e49a10f5so6928384e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739356951; x=1739961751; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ld1TfC5Cdjw/PoVC0iP097r1SbIYfGgfFoLiWX4Zz3g=;
 b=ag4FATBoVcaoe4O2Bt2PZaaWP8IHhgH4ulV4RGtWlviFG87Afp6ExoG62C0JVAeLlg
 MqxvOHNkHyuqku3B+fjnt/wjYIOLg//hHkQiGBZCF17xqFjHQ0O4mpwSGs52XAxTu5TL
 eGkIPPC6vGDDJBlRypKBNhCVZhMMiR1mP/KkjRRjNILw5fIl0+IqiWCoSCbmSq/NE2NJ
 ZPur190Wgerkj7ABjtl2O4ImRwgDWS8PWORQLKFo7XFGHjetK8d0/odICCeaXFwq4kJs
 9/BxdRnFpzrpM4nvITMVj3TPlvkgrx+VBogvmBHjz0kcq+slEjDaeW2JPzgiympPPYVv
 a5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739356951; x=1739961751;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ld1TfC5Cdjw/PoVC0iP097r1SbIYfGgfFoLiWX4Zz3g=;
 b=u3Lkvz1YvytjKuWtwzK+UPApKj6DnofUKumrGA+Tg8VuL8lPqWCGSczolZ0evQWbl7
 EG6hJ4htdOuxM7vLrMjFgphYFE5RkN/a3g1g5Hf3BkP1OfrdQInwYMOdXE1jk7tGvED1
 hn3JRdoE74Jap3oR62vQHqIGA4XSKiZ90LovSDL8gjlcNX4Up+8xt9lVsXc9XaleGPjv
 U8QrtyOJQJLP45VWBiIZSQrz9JI7jkoCyZDfgup21fsPjwVxBp2xrjSPIM4QU98zd2ss
 2XPyO4i6CFGSd4KXFHWpXJ2JzLLC4qlOoxsgK1Ej5yz1ejAc49orD+3SFTAt9Z4lp6om
 VAcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCmhC8ts4eyYKnb397eeAXSU1RavE0VqnSGXOwhJBfOZGCoOejKbVy2al4TNvrw3vhsgP/XGB/fzU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyr67Ul2DAxzzvK5HUl4Lj4U5MGTdUgdqn7ERj+WkQ8oreVmVsb
 giiAM18sVfHZe0Yclh1Oa3A7UVlymQsdGqhlJKr3ND9gYqNg5Fz7ezs8gvT0HFg=
X-Gm-Gg: ASbGncutHkeYZdZfiQ/YQasLG1wPJsmjS9e+7kreYBHDEYBcdedWAyS1quMxw3KJJjn
 Jm6bZ+WnlWsgJXhespw+gEshJZNIwCjHXh/g9kBWXUJClIsHHM5fD7C9ZnGrh6HSZachnMfvWON
 /1IVF4utc7Mr9aiEOBL2K1fDxeNKMY+smhuuQW+TnXbJ6EeSMsv07mGUHN2+Qt1YApGCX9xKcuK
 eHPtHMDSxaxvprlCsOWaQRBxvGAhe8EspfLhMc3OlLy8zPb801GBzoIeDeGZiOzT5mQc8TtGHaV
 FRExc1u7FXE30GIIx2TMsZd8FRCpRnUSEK7ZKDgbdRoZEu+R/rDHOII/tQ7nvRk+Gv7A6SU=
X-Google-Smtp-Source: AGHT+IF+1GUoRD9HhqBh1RL9sJOAG4t7Xk0SYLrZn9lbwf1SpooHUxeWe02/GIT06t3TK4EotARjyA==
X-Received: by 2002:a05:6512:39cf:b0:545:17d:f96b with SMTP id
 2adb3069b0e04-545180eb5f9mr737259e87.14.1739356950858; 
 Wed, 12 Feb 2025 02:42:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504e344a7sm1328754e87.5.2025.02.12.02.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 02:42:30 -0800 (PST)
Date: Wed, 12 Feb 2025 12:42:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
Message-ID: <brm43v5kzsum6hc6ahs3lqzgww55kczjzwzxsmx5a6alw3xxvh@3mdqqjvo2b5k>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
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

On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> We need to enable mst for qcs8300, dp0 controller will support 2 streams
> output. So not reuse sm8650 dp controller driver and will add a new driver
> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> to compatible with the qcs8300-dp.

Forgot to mention that in the quick response: please fix usage of
capital or lowercase letters in the commit message. If you are unusure,
'git log' will help you.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

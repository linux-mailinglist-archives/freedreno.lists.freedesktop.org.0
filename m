Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B75290BF89
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 01:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB7510E523;
	Mon, 17 Jun 2024 23:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gMvsksWm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7C410E51C
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jun 2024 23:10:08 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52c819f6146so6526417e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Jun 2024 16:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718665807; x=1719270607; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4wXBmWTJss/RzmPYrqxUbUPy1ew8NM+9YCA3AzpnMEg=;
 b=gMvsksWm7quWUf5i+P7x7lsVUkAoephIrf6jgLSFQg3Q+gN6RyUdKdLLVwwgwnHSLS
 H0U+z6SbGZVhtFHdFowcEcdBjTj1dz5ZreGQ/ZY2wkMHbxoun7uxVNnJ9gWSzFqaF4r1
 ebXr078FJeMqCmqBRKMQHPnUcPVRzFIhOQ1xwmTd+5M4n4qgJ2PnR+sJQQ1GR1ETaMwA
 qRWJC9RUf6IN+fGCRqWJRRTZ6/LUyNhMRSBE1nLZA2vZdZa+x2gvTI0FW/O5jI+5WzVS
 I5Ysgi2NLaYWPnyNRMKuBe/jgo5AruW8fotG74NHG0x1NannKW4JOV+I2WS/YOcBbGle
 iy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718665807; x=1719270607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wXBmWTJss/RzmPYrqxUbUPy1ew8NM+9YCA3AzpnMEg=;
 b=Yz4WiiAFnIuuXw/iC3uHSrG7JQqQMwcN9/WSde67tjKNHoA3k05+E3Fm5DnQWsxiAe
 Kq3UofYOjTNsbkE00LLbOP76PAa+7rOW94o4MdX/urVkO43BhOL5+yy6/bQB116TxaxT
 0BU0jfmnguLmKgdSTZG7tB9K8aKX75lxVe7553zbPA/N+Ed/uIlmBtHL4OwjgNg8CFPO
 5RJ8XFPzKzJj7RgihDmW4BWOBXlQP/W3nljNVOB/jobNbywvxfRnbtxCyE+W7wyUoK9n
 2zo0KLCNIxq8tcwy1r0A5kPsbx1vd52NyDrxJ+wYLCHc+FOM9xNPG6TXkcIE7SAJIEWR
 h2Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXke09JY/AMkTpNo0XBage8ssuK9Hiap6vg/GyN26CUOxtK4dBgEtbZmLK+53HupyEPfL9JtcNv4svjipxYabkeXa5obbRvSYLQ8N1o+Ual
X-Gm-Message-State: AOJu0YxhutYrej1Z3ONs0QEJvlky9AYvOFn1KU3/GFaWjjr3nfSlbw8z
 gya/xh89tM1VqhDC1CImdhAuQ8D4SSBiw4q6Tq74ABBnXmxtXv1ctRXdJqrc8JA=
X-Google-Smtp-Source: AGHT+IHUJRlG8SD2S6dAElgdpD/vdPMBsgptCF4B7ZC/wxomG8NUkgDzrQQzTs6Mt9ZY35JeVrbnIA==
X-Received: by 2002:a19:e051:0:b0:52c:896f:930d with SMTP id
 2adb3069b0e04-52ca6e9f182mr6936181e87.57.1718665806612; 
 Mon, 17 Jun 2024 16:10:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cba650945sm568522e87.225.2024.06.17.16.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 16:10:06 -0700 (PDT)
Date: Tue, 18 Jun 2024 02:10:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] drm/msm/adreno: Split catalog into separate files
Message-ID: <vpks6rzfkhzq3dgfee4l7ht2w6vdnlidppw3y34gxv64g3x66z@z5ojt6po77ir>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617225127.23476-3-robdclark@gmail.com>
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

On Mon, Jun 17, 2024 at 03:51:12PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split each gen's gpu table into it's own file.  Only code-motion, no
> functional change.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/Makefile               |   5 +
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |  52 ++
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  81 +++
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |  50 ++
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  | 148 +++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 338 +++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 625 +--------------------
>  7 files changed, 680 insertions(+), 619 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
>  create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5296F083
	for <lists+freedreno@lfdr.de>; Fri,  6 Sep 2024 11:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A737410E9EA;
	Fri,  6 Sep 2024 09:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mKbt3EH9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5834810E9EB
 for <freedreno@lists.freedesktop.org>; Fri,  6 Sep 2024 09:56:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5365a9574b6so455301e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 06 Sep 2024 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725616594; x=1726221394; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
 b=mKbt3EH9H/rANzq0Vcvy0vNLWpHxMlJzeBp/tqzHVr+ERQZXeZr6xBp+x0U0HGUmUm
 pbz+w6Lv7kuCWEyU/XeH7T3B6gntr8PPkMI6Ns9wc9Gjri56u1nxiVDphiG8MiIvkQEZ
 mMOR+tC8U9fQblmHmM4+1/FNxtCBXc7pkvRhfJupONLPwVxBnaKRYJdNaxZye1Kfxt33
 QiQVMSvg6oDn76iUqAX81WbG28X438cJftKIiyFv5RIvl7aN3CO2oXhM9LHfWCEw6GbR
 f/fSiA8kkVuuC0FA61NEB3NdJgdUqN1sBU6jMW0R139x1HDxIJNeEh6qlL/vUlDS5/6S
 HTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725616594; x=1726221394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9FCxUIgBt78ivuRYf8E0aPqYHoOPKfCvJFGhphZooY=;
 b=VEzKteRTus2nd01+LHXoChWw3t071uKT+3UDQetHLTwWZhZhBBl6zKlnfEDUKNKWsu
 px2hH9ddHr6pvvJOLDsofHBq+mT2X6vt//63ErQ7taBfGmliDypqIrI3DGcmRjLmFja4
 Zclb3H/7SPoUDTGALv9XioFqxpFaR8aKG4lYgNDhR1oIvC/589zeoeHQIPf4GUY4Ef30
 qMCe+6GMoYuDacagZ0KX/V64scB08Nn/s7DxG/ybDKCewvhSGGBIE3ZDtGvk7aRKeTjQ
 bvdZqyyEtEJZxzT+G//Cc7f6mVSycrRBYc0DdVKmw5NUcmMcP7ekhfbJq2iCTqjIjz8w
 H5Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeibp3Ym4QTyDu4p/JFko5Zk6vAMuq1etXtMTPNx7i8zLMxI1TiI94K8ZW83T1FzjEdnjSPpc8cBs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuXgYdUoM/NZyHvALpsd+RRwCX5wqUYLCAQKAEU5/IE4IoZk6t
 YkOHcy1GCEWSusOSIGBGDRs4ReDC95dWU7urWNNG8XvXGnqKVX0zHZndEcv1nOE=
X-Google-Smtp-Source: AGHT+IG4NjSKk9CJsxL7X661oGVWb4dJGK9kAqeeKA2OE5R1RdOgN5Xic7eEYM/SdgbXf1sQD+KCfA==
X-Received: by 2002:a05:6512:3ca2:b0:533:45c9:67fe with SMTP id
 2adb3069b0e04-5365880bbbemr1607806e87.48.1725616593689; 
 Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354084edc5sm2826881e87.279.2024.09.06.02.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:56:33 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:56:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
 robdclark@gmail.com, 
 sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
 marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
 jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <dgrmcsmqjqukta226byebvbdopcxqapq6kaf62nmttbbgcb4vk@ptkkp3672v5k>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-3-ruanjinjie@huawei.com>
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

On Fri, Sep 06, 2024 at 04:23:22PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

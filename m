Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E696F093
	for <lists+freedreno@lfdr.de>; Fri,  6 Sep 2024 11:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926F010E9EE;
	Fri,  6 Sep 2024 09:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h5mc32IJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4683110E9EF
 for <freedreno@lists.freedesktop.org>; Fri,  6 Sep 2024 09:57:04 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2f4f2868621so20465961fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 06 Sep 2024 02:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725616622; x=1726221422; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
 b=h5mc32IJR3BnBusUVA3E8dui7MRRO0B9KZow7AmxQFe2bSYVi39UjcashSWljG36Gq
 qwdymXdh54lZc20BdjW3XTD9YKe/U6KqN26xZnuuUe5/TGvbQAkEX1nROXIkMclAB7OP
 C9cPBsIRjfyzX5UlJC5+oLR+Ix6yxjCXUAVTlyPjqmH1wR8qKDD5NN5p8z0HPUlpTj/L
 bQVh7UrGZXwEgQCp4ePEplcnqhO7kZPVXyv62EI/rGaDxwmWBmunZyeWKa1oh3ZSgdTh
 4E5sTfJkWhuMfdMyYJY7aeUoxHuQMioUDZ+JC9IBJZvJRf8VUO22YWLuYb/2R0o5BoOq
 ldWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725616622; x=1726221422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPwY2WBbxgUH46+rd75ybc3ERwkcJqcYT3nj4Xuky44=;
 b=BVsUt6ypprQJCbYf7Wa9Gee33a5Pkf+hKt/NPCLCwsvlepE0rj/mz1+OeE8zW5Iux6
 aBocxkNer6WLjY3QX8zOMMag3ZHyceWMah0o8A190yoVQpCUcWJp4uLtiWlVl8FJchdL
 G1MTVwFC0yb615o2sKup7DLO5qWUGEz8cDAFeiiY7ah5ZKJ0lvUrJNKJx6QWP98BjSQB
 9+TS2vdlHZjUxYIwJZDIrs79j2SIcC0N8qAYrkf+hq59pEyj7PzZKZ1ioy2etTKDCZ4w
 jmAWppvCvh0Gu5N6v+fzE2TtLPWcPqXt96vqabWeVnjvIPN0qn3tZU1gMs/8k8stT9br
 U4Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ZyU86Ngn8sg+jzjnZAC3TuAeK+yLASQU9UrUTinAHt8sn4RY3Drca45sxTcLitCoCZElvHgk51I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKSONw+lyMp6E+aokpgPoMiZLLPhjT55acTV9pCGmRCOTH+R5q
 Ohgu1iBQYgxvDPyJD0vQjJSwHYu7S5rH8/IzzesSfjWodIsQHL4lykMOkoaYtEo=
X-Google-Smtp-Source: AGHT+IEGmDYtTqVwK0km1mxn812DoATvPxABZpDO9jHB/O4WvGUlolGz2aw3FT50+jxS8Yg8MuE9iA==
X-Received: by 2002:a05:6512:220f:b0:52c:daa4:2f5c with SMTP id
 2adb3069b0e04-536587fc818mr1075858e87.42.1725616622176; 
 Fri, 06 Sep 2024 02:57:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5356988b077sm616302e87.47.2024.09.06.02.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:57:01 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:57:00 +0300
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
Subject: Re: [PATCH 1/5] drm/atomic: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <mwzh6et6ipet323243mga4ip5eo6jp2bxvtlzjyc2gji5kjqef@57dri4dbwser>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-2-ruanjinjie@huawei.com>
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

On Fri, Sep 06, 2024 at 04:23:21PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-crtc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Commit subject is incorrect, otherwise LGTM

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BA913366
	for <lists+freedreno@lfdr.de>; Sat, 22 Jun 2024 13:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9E110E20E;
	Sat, 22 Jun 2024 11:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GU8LQcOi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4AF10E1B0
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 11:39:46 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52ce0140416so137196e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 04:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719056385; x=1719661185; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Kh1lIxhRvlZJlWBZQ3fVihNtTYBls5m4TXb40w4pSDE=;
 b=GU8LQcOiCxPt4UzlIM2st8U6PhYS1AppzfBabkeR0ZqctY5h0LyqWbqIfMEIF9LO08
 JuxnuaFAHpGpoHiWgOFqywQhKTdN5js51CLhx92xYySr/5ossqXtqjtlf3Qg8OsO+RmK
 0Oe/jwto1AAFMbeiBchEBovPuQ2WS6Ia4bX+yVvOJPKWlq3gLNN2KXGhvoRI9VIaGAzr
 IqaOMEDqOEq7/4v60hsJ9f7EeM8wbUxytoQ5jtUQMrvu7mWblTD0DBMwOGcEEK6thTwb
 wumj8DYt41XYXjLBfhtAk2aCQzp2O5ZJ0S4q2EC82lhUpoXUNq/m8MMtoBngdWLV1dVO
 o+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719056385; x=1719661185;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kh1lIxhRvlZJlWBZQ3fVihNtTYBls5m4TXb40w4pSDE=;
 b=HiJJh7NIZbKOio9UDKExY5TRYwKsmOz8/SK84IHRB9OMzv+1Vs8FsKHh5TINDHluI7
 8CNOnwZ+hivbwrYvpKcYVanAY0df78IWABHJYYiSfKrE9+9ELAeClXd/q+LM/00hvYTD
 Z5PfqOYbYamLpOvFiTQdt9LvvZQ2qStBJPaf1TGVrcatV14m7sV+5gYpbWN59bwH0/wE
 e+045Apc/dbaq4vwh5O2xcw/QNMd838xxjEhaZs/HboThMPZ7yeHmRu3aUjiQsuPw47M
 qVLxUjfkL/S49qjjdpfJ0rGpX8O5F+jliw23zjGc1D0BfO+Wlhi4ZaN9INfjg41kmK6+
 cbug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBdhoKojLTY+1WfhTFchbLV1arYE328ExRV30iweYlVcfqJeJ29lTQolwSLU/S4Wzj96UuiQ5rK9cubkkyPVdiVVAkVS+DXh14K/i7hGYy
X-Gm-Message-State: AOJu0Yxisb7O8XQrSDvTUODVT2hgZda+A/EhtnjCJa3TMf4wbE3z7wqC
 7PYPNqL9byEdYWpWPUGQV4maEcObkiMrKmwel+a18TI5UhNV0hPTAg5hWlASvOE=
X-Google-Smtp-Source: AGHT+IH8k8QOA58L7YU6kzdfuHzkc3ehVV5Iyo7noGGH483YxSGNq0lgFwx7Vjua/ahxSsJU6oNR2g==
X-Received: by 2002:ac2:4209:0:b0:52c:cb5a:a60d with SMTP id
 2adb3069b0e04-52ce06104d7mr249031e87.8.1719056384543; 
 Sat, 22 Jun 2024 04:39:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b4100sm474271e87.36.2024.06.22.04.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 04:39:44 -0700 (PDT)
Date: Sat, 22 Jun 2024 14:39:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
Message-ID: <jeiz7tfgmhbswfhyrt4xervypw4ltonfbimoa45rykuaimkyst@yevqeplcrrwq>
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
 <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
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

On Thu, May 09, 2024 at 12:14:19PM GMT, Abhinav Kumar wrote:
> 
> 
> On 5/9/2024 10:52 AM, Barnabás Czémán wrote:
> > CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
> > so better to skip CTL irq callback register/unregister
> > make dpu_ctl_cfg be able to define without intr_start.
> > 
> 
> Thanks for the patch.
> 
> Have msm8953 and msm8996 migrated to DPU or is there a series planned to
> migrate them?
> 
> The change itself is correct but without the catalogs for those chipsets
> merged, we will never hit this path.

I think I'm going to accept this patch. While we might not be supporting
these chipsets, it's easier to have this in.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> > Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > index 489be1c0c704..250d83af53a4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> > @@ -298,7 +298,7 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
> >   				       phys_enc);
> >   	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
> > -	if (dpu_encoder_phys_cmd_is_master(phys_enc))
> > +	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
> >   		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> >   					       phys_enc->irq[INTR_IDX_CTL_START],
> >   					       dpu_encoder_phys_cmd_ctl_start_irq,
> > @@ -311,7 +311,7 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
> >   					   phys_enc->hw_pp->idx - PINGPONG_0,
> >   					   phys_enc->vblank_refcount);
> > -	if (dpu_encoder_phys_cmd_is_master(phys_enc))
> > +	if (dpu_encoder_phys_cmd_is_master(phys_enc) && phys_enc->irq[INTR_IDX_CTL_START])
> >   		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> >   						 phys_enc->irq[INTR_IDX_CTL_START]);
> > 
> > ---
> > base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> > change-id: 20240509-ctl_irq-a90b2d7a0bf5
> > 
> > Best regards,

-- 
With best wishes
Dmitry

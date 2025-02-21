Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700E6A3F60E
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 14:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B81A10E214;
	Fri, 21 Feb 2025 13:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kgIf248A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6327010E34D
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 13:33:52 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-54838cd334cso918876e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 05:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740144830; x=1740749630; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ieh7CBVPmu3X5DHV02AR8XvoaNx/S0Yj7VuoRST8SJM=;
 b=kgIf248A8oagC6FRMSJoFOAl2ZhctXQCmd+yAvtgWp6U1ZWy0WhY34rktXmky/f2Of
 zeVBA2d0wp/61Kog0rM9Jno/NTfi7AMXg+gjBDNLU80kKNP5tFT8XwhqyIx1Lcdsrd60
 6k9u/BiCI6RcXyGFywx74B8qtC/mFmcp5saLoZZTeEcr6uyhZFF5mGxDPIHCCMk9bSO8
 TecgA3Aqwh6UtiDCAvwUD3QHBw9muIMdlHsIQyukKNoo8rp+N00tcZtaC5i5OoTIjmb6
 EkTm6ac3Krm0Es7m5gBNhPlB/j0uFqss9AzHdPK/4rrFkpnQz/56qj9MGfE199aC7SPI
 nlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740144830; x=1740749630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ieh7CBVPmu3X5DHV02AR8XvoaNx/S0Yj7VuoRST8SJM=;
 b=XbB04a/ZpgsMTdSVXTXbDTEOHAnN+2FJafNrr1ll6Y5j2u/wuqKOOf4y790xCDLc1Z
 NdIkE1jV7hgB7bsRfKevF6/K4oyceB/e5tHzW1K+r0LOwnA+WHJWde8ESWoPURINdS9p
 bTeAO6L2i7XjNW+LPnlzMTM7CS+hTLPtO4riw9hPdC7ln+NQigVvsH6u3i0+/vw0J1k1
 NrbDPlUNW64mK7ZZBNFZnoIfwnR5x9M6vIMvye1ZkXs+JKo+q8y1n/FeeTkjb3CN6z40
 1p3r656pLTZwnY29YpSQtkYvP2pvhfV80kZo+Fyb2koM+AVLWLuM6XySAMVXw9Cqgemq
 dPSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4s+R+cBYOGFT2Vl89B5eX0BxrM9NCEFFzmjuiK5ZGiXPkCB3ga/MgRPzuVwwZUAbrXCJWlBqDFPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLVQFT7afAjmAgPl60ghNPA5AgDEQFX/to3c0FOOH7fnzKelEi
 FCORj0J2kimZPmKM/ZnaTpaFilSS+bBJsNL/ZkkVo1rYDowsKkOWsS6m8ohcre8=
X-Gm-Gg: ASbGncuENpvc4k8IZiMGZQD0mJH1XzglqtgpcQXLwnGJhQGpr6JCRJMJju7R0usmBms
 qmcuuBImxhw8G2jLbrCy1okKgzIiQ0HHlRk2uDivFvgB5TksLo9qlkHgE2g02HFg1Iqr79RBjR2
 g29NbHMZ8QKngIvBE4Eo9HWQ/aSGBJQbqZA0X5l/7Ddi7YwMTrpxxAvzkNIDF+GNX2YzXGRcaJe
 mWhCRZcJ1CJxKgZ7J4nC+kSYi6XmRwXH6/vOvvgIoMYAaGiOpKJ8LUcc9pwQdcAdySHE3yYUPeu
 Ilqat2Mf4RmNpCqn+EEG2QehjcaxX/Pqz5E/oMKAACyfB8+ay0z36+fVh02hiJ9ilwCGSbr36wJ
 WRfFQSQ==
X-Google-Smtp-Source: AGHT+IHiz5c3L+HbXFi2J+BpEhRbGbpZKCFTjF5dKolaGhW+97N+o7e5V/9KYwQhome4h/soVI0ylQ==
X-Received: by 2002:a05:6512:3b0a:b0:545:ab8:2be4 with SMTP id
 2adb3069b0e04-54838ef5a15mr1252449e87.27.1740144830527; 
 Fri, 21 Feb 2025 05:33:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e4b08dasm2235004e87.87.2025.02.21.05.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 05:33:49 -0800 (PST)
Date: Fri, 21 Feb 2025 15:33:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 15/16] drm/msm/dpu: Implement new v12.0 DPU differences
Message-ID: <nls3qurambg6ioecf2y7zp74sekgmshlu4nskpelulvfad36lv@4tpangvp7m4a>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
 <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
 <4b2426d2-a7bb-4c19-9ebe-77f6a90caf5e@linaro.org>
 <CAA8EJpquBhQeac0E66NqeagkxP-qY0whmah2ND0xziUQdxc_7g@mail.gmail.com>
 <883fed07-1d21-4ab1-8c72-9a1750ec1606@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <883fed07-1d21-4ab1-8c72-9a1750ec1606@linaro.org>
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

On Fri, Feb 21, 2025 at 01:36:51PM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2025 18:24, Dmitry Baryshkov wrote:
> > On Wed, 19 Feb 2025 at 19:04, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 17/02/2025 20:18, Dmitry Baryshkov wrote:
> >>> On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> >>>> Implement new features and differences coming in v12.0 of DPU present on
> >>>> Qualcomm SM8750 SoC:
> >>>> 1. 10-bit color alpha.
> >>>> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
> >>>>    layer mixers.
> >>>> 2. Several differences in LM registers (also changed offsets) for LM
> >>>>    crossbar hardware changes.
> >>>
> >>> I'd really prefer for this patch to be split into a logical chunks
> >>> rather than "everything for 12.x"
> >> everything 12.x is still logical chunk. I can split more, but without
> >> guidance what is here logical chunk, will be tricky.
> >>
> >> For example 10-bit color alpha looks like separate feature. But
> >> remaining PIPE/LAYER active - not sure.
> >>
> >> I can split them but I would not call such split necessarily logical.
> > 
> > I'd say, the following items are logical chunks:
> > - ctl->ops.active_fetch_pipes in dpu_encoder_helper_reset_mixers() and
> > dpu_hw_ctl_reset_intf_cfg_v1() (with a proper Fixes tag?)
> 
> 
> Ack
> 
> > - 10-bit alpha, border color,
> 
> 
> Ack,
> 
> > - active_pipes
> > - blend stage in LM + set_active_lms
> 
> 
> Ack,  but you do understand that this is purely from new hardware, so
> new registers. Even the 10bit border color is actually for new
> registers. It makes no context outside of new hardware. same here.

Yes. However those changes are logically separate, they cover different
parts of new HW. So it makes it easier for anybody reviewing those
changes (now or later).

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

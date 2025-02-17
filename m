Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D11A38C32
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D210110E5B8;
	Mon, 17 Feb 2025 19:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WssupDFL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8560910E5B8
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:18:44 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-546210287c1so1401433e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819923; x=1740424723; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DK+fqhLw+0oSKSvkhmUshysfw/dArV7Gb0FGu6H8pRM=;
 b=WssupDFL0J68EGxTKhR9i6FdTixdAcIBgvLMJrEL+R0W9FPPA8bb/FqVwekQ8A26Bt
 5WYzurCw6JzT2TcnoP+V2AfTIJTX/Nti21vhWJx6SHUqzen5XDk2tmQDV+rrg2kbIfPg
 NYg3HPnKNosQQRH1H6Fhh8q/pPKGa40cDPpGMysP6qz57bFmMGVmTGIazq+bysy0GrXs
 /NXYx6BXZML8Hh/mty/aDqR6G5EhA/D69STDIEdIEbR31OhPCUN/2/s5fpjH8WD/EjhU
 DpajDrMD9jrwx+pJBRqeEzoRjxKCXzZnvRZV0jyoEu+yJcSS+wPwdpLslUNx11nVH4c1
 OivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819923; x=1740424723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DK+fqhLw+0oSKSvkhmUshysfw/dArV7Gb0FGu6H8pRM=;
 b=vCHuFprxi5T/jJ1L6o6370j8IJ8mjS8FuhCnlu+gUKCrmq58sXfEP3RoI0lGD/UQcP
 QMB5WHywHusSn9BMKCeAeGgmp/LxKV/VJbU9fa2U9zvO3UP5B5f6eSBxmekF1fKS3BGQ
 0lpF5DMyQ4ASS8GEn62yatAbrxSnyWHp2G9P3tT3NQVW/7L/rhP9o1eHaivRfaRy7wbz
 cH+zf/a3sgIqS3rzG9dIbEDfP7erODpXL7rsqTDWpG2yzy9rR5ZbZ3e7f95+wu0gJpcq
 ESr2kcyXODXvm1wcfqy3f0VBty/kGf3/5dD8dN7Jyj46EKTWD3sCODb7mnItIcUzHezX
 6HHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp28f6SUtVix0yJlrWMTTEU1oTI5K5gWfDiBfU/kV8nUHreOAXxsKFs47tNba3WZ1c3hHoVylFxEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjDP1ZAjc4aXzKZoZweaqWSIVBl4wvMOvj2/nGXX3X2b4ydLDc
 8OgunxA6N/FDcDU7OC6sd73D7mlOBrfOfxHmd39+SYRcHhQhiWjifyZnB4i/j5k=
X-Gm-Gg: ASbGncvk65A9+vGpblyxnSKjsdiu1CJOOt0gqmZjXx4Ex6pRuvJYvDjjttRQqYd8AUk
 XRmgAU/1KAzhv5JEdh6h5YIdqf1wqcqT0BGhe0841EduxMux9PXEVClGE2JSwUzplLp4fpRtOsy
 mU7p45UZfnvmO1HFyp9u/5Vw+MxXoXA272PAsb/EEUsTMMgNmcSHNk/5SjmAXoqRyeNQ0PqyGes
 ZtXzmVgcwg7KH1/8frQzedcDAQdRO3XpQ8wf2SAc4X80YYe6cpsgNNJig9klFGmU1YoBuLxf16W
 kSuNQMI1x/clrh5b79nXXB7/p80Yyf5zsvmTWlMi5ZcF7yqdreJ8zr4z+z8ewc/HkEsDR8w=
X-Google-Smtp-Source: AGHT+IH7pPe9WdA9acnmeu4tM6FBkJrCmOJkB/cGc23MUQGTJZAedW80zQq+KjfFc7YHQvnbMFONmg==
X-Received: by 2002:a19:2d11:0:b0:546:27f0:21a7 with SMTP id
 2adb3069b0e04-54627f02773mr695030e87.49.1739819922816; 
 Mon, 17 Feb 2025 11:18:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461d4f2aa5sm694294e87.0.2025.02.17.11.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:18:41 -0800 (PST)
Date: Mon, 17 Feb 2025 21:18:39 +0200
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
Message-ID: <qlotuliwnm5spneolztca7avmh2a46pz2xqlxzqbw5kwa53m6q@oyhnzz7fhay3>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-15-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:36PM +0100, Krzysztof Kozlowski wrote:
> Implement new features and differences coming in v12.0 of DPU present on
> Qualcomm SM8750 SoC:
> 1. 10-bit color alpha.
> 2. New CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers for pipes and
>    layer mixers.
> 2. Several differences in LM registers (also changed offsets) for LM
>    crossbar hardware changes.

I'd really prefer for this patch to be split into a logical chunks
rather than "everything for 12.x"

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  49 +++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  12 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  |  59 +++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  17 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 210 +++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  18 +++
>  6 files changed, 350 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry

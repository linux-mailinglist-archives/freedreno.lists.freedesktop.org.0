Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DDA48272
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 16:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B210EB26;
	Thu, 27 Feb 2025 15:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZIJRdqqN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4610EB26
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 15:07:47 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30a69c1a8d3so12099121fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740668866; x=1741273666; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PK0RBzU+X7MrHf7OnoKvPr4hQd6gs4EWXTwKEiRaqcY=;
 b=ZIJRdqqNjUPxKWRVN05Hp2qx1h/zjj+1jdKR1XgQZ+4US16HSwu5pn132Eo7PreB4R
 2AVFeN7At9vJTUIixd64xjkf+sn4k56jYwGtqk/evD7UcKJ2oG/4MZQVA+zMqOseJtIc
 Y/d29e30KY69qpy+0u+jVpNafhzMlb+QcnjtzO7C1ANwaXthfV1+pYvl3lwYNQHj4sZD
 dy+AyCmzI4herqdzh3d7vGwfOt917V9f6lTg72jFPSY5jVK0+UdTU8mHrPmPd8KCH/o+
 Bb1Jk2pxtR/KCLSWFLECYEg/6jag0kRBi4icMG/vhUAaluI0BGew+WNAFgLJjDSaiwbL
 aRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740668866; x=1741273666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PK0RBzU+X7MrHf7OnoKvPr4hQd6gs4EWXTwKEiRaqcY=;
 b=frko+unG5U2uGHAF0HS0w+QHQahssH+ioukwxqRSSEjr0OUq73ZouJ102NLtLqZ5GY
 L7BwzEP2LPWs/vN6rvVC1z02c58pTzgt9jVUoksb157D3K4utdnhEuUMlQ6BXBtQLsZI
 7bHNxLvaxW/znR3d4AKZpj1V6B5EDALbbZsiDhUfGnilsjpJHxBp6eHTU5QR9e7sskJ3
 twRrRSUknujmWdCgFrXy+YhlbuRuCQS9WOrLVkPlX6hZmG1bi4ezHKzB8HvZXsbX/Owg
 ItsLC5p3EfYvVoIgEZeGL9cdkvdng3tZEMTeq7XZ0AYEaEAXlWampo70w9Hj3nAqJ3P5
 AI1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5hbDaGteMpj09HHU07RamMCxD3Jh7NUlDwKKh3vxdMNLZXTkeNHKbmXRA5ecB4RwknloI1wYTHGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEks8socTqfPFxYCPu1kJtbm/J5srMRBStvdTHFXx1tqaMgTIy
 WlEmijr5HMpA5Wq2ANZZ/+oso7IAdRJrQVRkv/zCylskherdPgpTd6aZ+QRYxL4=
X-Gm-Gg: ASbGnctUR3/orZrAHEGNd9UkGEdKVMS9IMhlarS5F/teufDXgwrilW8mxZGsNcqH9ID
 JdZYlxToJHNRcjm+1n8lh4baM4BrUcd+/Snv5zAyConmJBboyV/j7wlHnMYZt2FqcIbLII8QpqZ
 eqyck597oYlzi4XghwBPHCAyiRFV3YyyFzaVpBg22ejybOBhUZpggdqArfUUz95y08UzEPbm4zf
 tz1iZV3uMIIa/HPvbooApt3btM+RuMdgNAfPUb7AUXv5Zr0vUk9UYHx/Xc4JMHkpU6eGCcc27rP
 9XCg1PytXBksvEYxRaltSf2yuqC6kn59rh1Cw0nsnMdcHKWPgVV+/fREiQLiI3Qzxk8iFdX09PA
 9EOIUbQ==
X-Google-Smtp-Source: AGHT+IGaQ//J8Vtjfl7pYmy+TQqYupxV6d/Q8c6JMZHrTt4arFwXtLg1U0DaRna2TQ4oULMoVcUSzQ==
X-Received: by 2002:a2e:7c0f:0:b0:308:f479:56b3 with SMTP id
 38308e7fff4ca-30a598981c2mr93380391fa.9.1740668865510; 
 Thu, 27 Feb 2025 07:07:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867c8f7dsm1855811fa.48.2025.02.27.07.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 07:07:44 -0800 (PST)
Date: Thu, 27 Feb 2025 17:07:42 +0200
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
Subject: Re: [PATCH v6 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
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

On Fri, Feb 14, 2025 at 04:14:26PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Up to now the driver has been using encoder to allocate hardware
> resources. Switch it to use CRTC id in preparation for the next step.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v6:
> - Drop duplicate cstate initialization code and unnecessary memset
> Changes in v5:
> - Reordered to prevent breaking CI and upon partial application
> 
> Changes in v4 (due to rebase):
> - moved *_get_assigned_resources() changes for DSPP and LM from
>   encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
>  5 files changed, 110 insertions(+), 126 deletions(-)

This commit breaks several tests in CI:
- sc7180-trogdor-kingoftown:
  - kms_cursor_crc@cursor-dpms
  - kms_pipe_crc_basic@disable-crc-after-crtc
- sc7180-trogdor-lazor-limozeen
  - kms_cursor_crc@cursor-dpms
  - kms_pipe_crc_basic@disable-crc-after-crtc

Corresponding pipeline is available at [1]

As I had to rebase your changes on top of msm-next, corresponding tree
is available at [2]. It might be possible that the regression is
introduced by my rebase.

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1374165

[2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-cwb

-- 
With best wishes
Dmitry

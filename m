Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7FF99EA25
	for <lists+freedreno@lfdr.de>; Tue, 15 Oct 2024 14:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C07710E0B1;
	Tue, 15 Oct 2024 12:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5hE3wMZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A539010E57D
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 12:44:02 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb51f39394so19789791fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Oct 2024 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728996241; x=1729601041; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3SQaNBGN1mxZVAMjEtaA/BhZGMt2iLPd/VivsuWhVfA=;
 b=S5hE3wMZSdtJpnV+/WtGp+DSOz5qcYE3UPB+/Vz+oxEXbIUcA7qu+pbws1yZwIu62r
 XAypkyIuU8pbpSv1DsTKUb+dww1ZvNGWo6pidYGM2Y2izI5zWHa5CTEeiEW68YI6f6e8
 p3lLrf6fCDBjfn4jQEd3yhDnlmvQB951uAwHBNPmV8GUh7wzHieBdMNWsgKNHaijsqOb
 6K6an5cQvQI+nAPtjF9nBkgRhIDuCRbt7XbLfagbs18S8mz/jm6p+JRMG5hcs+0SecLx
 rdZ0M+2GGlLYr8pZi+vbQXY/a0WwECCIHWAmqX3Ax5fXclT856nc6XDdRPTTp0MmdCbA
 qiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728996241; x=1729601041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SQaNBGN1mxZVAMjEtaA/BhZGMt2iLPd/VivsuWhVfA=;
 b=nkrpKPOgWITVotDUo8MRQzRRMu/dVEbX2kmKGcIXK+v4r3Uee5DzGfbUqqfkn7Ldvi
 5BQrnk2tDcPwru4eLW3GgYI8FgtBN8FGwR9uO0K9LdpFVhfvSjHOtb28HHp3Bd+DwiCL
 64MZbwotYFRAWCmjXy9aLG5ABB3HU7Z+bfxCgO05sjsnlmLu/UpuTeejD3vHqOe51LEu
 BTQSP2be9yt6h5BmV4m9gh/Ml+AAAu70Hz0YoIdsE659FYwWp7jGKIPhWk0l1SOUvbSe
 qtfGSfBEAb1oGdu6c9rWnolMsFe3nz2bdFpKjX8UiGry5RJKJ0aky7XdSy73bLCIn789
 p5SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/xHFb1Dlkp6ZqJ0focJsEGUfJAI+A41AjtSXa2FwazOb/VNSrh+ku5iLfUgddZUHSynfUsIx4Mkk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD11YZB4iM+LmCx6KPmKr3OWf5kmC8zvPZYQDVD+QzJjwlH0D9
 5FUueY2HX0zRodLFjAv2d+/GS5+4ug0jSTN12ImMdEF38sas+s44NRuurwatdF8=
X-Google-Smtp-Source: AGHT+IEtf1bxgczpfiNA8NzJb5A9RmLJNMO353LaV7Pw7z3bEbJ44JZ2pT+RaReMTzzfnefZ/EOInA==
X-Received: by 2002:a2e:b164:0:b0:2fb:5504:7966 with SMTP id
 38308e7fff4ca-2fb61bacc4fmr1979851fa.30.1728996240652; 
 Tue, 15 Oct 2024 05:44:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb5d126dd6sm1575741fa.52.2024.10.15.05.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 05:44:00 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:43:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: Don't always set merge_3d pending flush
Message-ID: <mkuayois4t463oqpxi47tl5npjdsafovivmx3pscnmxy3i4v3w@xt4omvobamim>
References: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-mode3d-fix-v1-1-c0258354fadc@quicinc.com>
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

On Wed, Oct 09, 2024 at 08:41:13PM -0700, Jessica Zhang wrote:
> Don't set the merge_3d pending flush bits if the mode_3d is
> BLEND_3D_NONE.
> 
> Always flushing merge_3d can cause timeout issues when there are
> multiple commits with concurrent writeback enabled.
> 
> This is because the video phys enc waits for the hw_ctl flush register
> to be completely cleared [1] in its wait_for_commit_done(), but the WB
> encoder always sets the merge_3d pending flush during each commit
> regardless of if the merge_3d is actually active.
> 
> This means that the hw_ctl flush register will never be 0 when there are
> multiple CWB commits and the video phys enc will hit vblank timeout
> errors after the first CWB commit.
> 
> [1] commit fe9df3f50c39 ("drm/msm/dpu: add real wait_for_commit_done()")
> 
> Fixes: 3e79527a33a8 ("drm/msm/dpu: enable merge_3d support on sm8150/sm8250")
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c  | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

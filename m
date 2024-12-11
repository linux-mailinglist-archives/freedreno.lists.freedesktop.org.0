Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C59ED828
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 22:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB81810E62E;
	Wed, 11 Dec 2024 21:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EWsoaNA8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F2210E62E
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 21:09:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso4260784e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733951371; x=1734556171; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/zbqQN16b2aOiF9wSF0WnEQtgHo51A0jGYXUA3xuNJA=;
 b=EWsoaNA8q15t6lAtJ8s4pKNFwOetDk/DDGJx51RKLPY3sMNLQzsgUD9L5HegLruXWd
 XTdZXoVCNwtkc1HZfiZlzwx7SPBUxpxwGKVbVU0beM2k+DxmFB74PbiUbO97n+mi1VDX
 sz+plxPckK832J+y2JLrEatlWmfpfWMWKbMye5DmcpXk/LJDTQTVeeoF5EBMKYGqH0t3
 P55rFOaopmsDm6dyVNmdZVAz0lIYEwG96KlKhRtgNu9vpVgdMHNIc1uJxHyLZ41U0V8P
 1P1zxW6iHyWEeKTjM32GVvQc2Rcwhpc+9VVPVN99sNrIdNX2RBiuE/IkICdbkwQUTDrx
 q4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733951371; x=1734556171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zbqQN16b2aOiF9wSF0WnEQtgHo51A0jGYXUA3xuNJA=;
 b=hzUg0KH4u4WBXfrrUqLWiK8aCN6foB0nbJRwgi94uq0bNPKS1KgM8E+g9Mt2b0CpL0
 8D1aKe+TFbWA29NlyO85vtqZtdKgzF51qBrVYQubFBb9qW5omn9JW7u9TwuGfClzpDUO
 zY5LH1SwbHxYjhTStUTBQ3lQQ0j1AqyXmoByEPFLuV+yazvs66uEn2tEuJXWGQcpYDdr
 gFKkCIxsT9HTEhuhvN4RPifV3uhUehFrTgWCfpYysF7AqkAAh3hzv0heLU0GD7bKqqAM
 VZh6b3yxHUjuLi0ZShvDK8WZk/2hTjmZho1CKIxmF1rwupakntI4vGhWZXdZ1y/3miGX
 Rfow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUGsOjKP3iZQHOSzbb4hKJgLnWyUMRg1QncJwVvz6Jc4CbgwXB9eCDrR4O+uIyhLxFUUaOCVNiJB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfRsyWufTDzk5nNJ75WlLizz150Nlr01YOY4Fq69+KgVgHlZ5c
 zHkgSlem3HCGEtSM6FgjshEso0dR2cM6qOAvUG2cUmdLPbhCw/rP91qKqwSt4+I=
X-Gm-Gg: ASbGncsiJnURtnMM5sxvayZXgOK0uXsGM2O6cus0r9Y577J6rOxn+DOqwVHxUSDWn9/
 2+sgr4Jxt5aafcnI5Z7MRbw/q2VT7yHgAHjgkLYH3cOlWoElisy/1lt8B6BGTaDPqfGD6Mz0QNi
 T6iUZst2UpyBwa2TcoY8YW0v9g5q7yJEL9DEFE/lty3/BaUcQ7AiuR0yrAEnsE+FNok05geiiTW
 7LJJw6Oun9SsanelHRQmOsik9tL8+NKldRFXZ3uzZ5oBi2Dmob5cm0tfnnsP0Mxa/o2C9njCsss
 b5XWjyx+4zXX2H3aUGp0bam/swRu169CNA==
X-Google-Smtp-Source: AGHT+IE2nngXJnaAUtwl9k5Kp0+1aSGdWZRqw4X43BjQNC/SURzvx+f5grBltDBz9C5ghuG1lIXKDg==
X-Received: by 2002:a05:6512:b11:b0:53e:3bb9:5e02 with SMTP id
 2adb3069b0e04-5402a60b1b0mr1317831e87.56.1733951371282; 
 Wed, 11 Dec 2024 13:09:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3aa94b60sm1561872e87.114.2024.12.11.13.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 13:09:29 -0800 (PST)
Date: Wed, 11 Dec 2024 23:09:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
Message-ID: <rggt2smcj547el3bovp5djilydxe5wygqasborwunejihbqygc@xanqsyxqgyke>
References: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211-check-state-before-dump-v2-1-62647a501e8c@quicinc.com>
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

On Wed, Dec 11, 2024 at 11:50:26AM -0800, Abhinav Kumar wrote:
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
> 
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in v2:
> - move pstate->stage out of the pipe->sspp check
> - add reported-by credits for Stephen
> - Link to v1: https://lore.kernel.org/r/20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

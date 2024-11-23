Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EE79D668A
	for <lists+freedreno@lfdr.de>; Sat, 23 Nov 2024 01:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6710E1E3;
	Sat, 23 Nov 2024 00:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j9kLMGpq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B9910E1E3
 for <freedreno@lists.freedesktop.org>; Sat, 23 Nov 2024 00:00:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53da2140769so3199931e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Nov 2024 16:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732320020; x=1732924820; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jsBEPts/nIbbNaoUTj1vxVlfNzP9ab+ytNZuDFKdOsk=;
 b=j9kLMGpqlxp+lYIVWhZIpzTrBf5zLYLAs1Yxya6e/hFuJVBMnTh+BRm2D/IZiSBWl8
 ZbDQzSCtuKMKEGi1pIMP+cITATPV8c6k7DMUnhOjvd76JF94dW97NmNlYQrkK/ufn9MF
 gxuihubbiLt06RbmxXbq5pNRS5dUCmCP0VL2DN/1I9ysfRxrppl2nKYW0v765nK9ANNS
 BfG4ECf+3F+fbYlCiN2xQDzkp+fcbP9+shJ1u1hlvNBJrpkvLicHQAsfW5fyi510kK1A
 16qZ2VfrPeiN6vah30nk9cNoDuKhXcgPFfGqiZfCi8kWSfD4nS+owXN6KoUNByGbDeaZ
 HxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732320020; x=1732924820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsBEPts/nIbbNaoUTj1vxVlfNzP9ab+ytNZuDFKdOsk=;
 b=iJQ9LUUESn/7+z/JmZ8s5t8p83WdgMa903CZ2YK5RsT0+ZObbQvlEzL8NVlMa0yTdH
 ajU7i6MFr3pfG/vvvVIvRSdyUShIDnR2hxitb5t3CQUmA4txPg5Rk2O57M7iyFVscoQ4
 5plQZb+P5Ve3y/Q9j40wT6oLcL5m/7UylXDX+2SrUguww3+24lSwm5PlW0+9v365OzoS
 937hI6oe9tn5+E14I9aW9fiXTme8ICtKv6iVWbeEtyCxB6aqt4uAWmE3qtwEii9J9SGE
 hMWlb6pMAdvnAKkcWFdgzQgXjYUCJCxvnS7sNNnqvh5lx9cjt0/0XSdz/hvZ0WjTIZ1v
 t8nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP8jpoIwfHtJjTts1L5B3il8lDvrg+SxGLMrXU3vwi4BEhO8mXCRx31bzBmthIrDxHisgtrX3NPME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrlgT3NfPhsjj5GtLYUd4KbSA2sMWsyQiG4mmRFOOVm+tikPG2
 RW6abNPnAMLc9l2NsMnvdA91LS2A9qfQrmo9h6ibM6QnQ42VQ9puh4RhSlSdN6g=
X-Gm-Gg: ASbGncsEQAhCSZ2J13jZ0Csonc2lvSX08Z9oHNVn99d/v9CgYrOxzrKt5PO6kcTzCT4
 aBL68NZAJOW48yOG8U8QQMyCF352z02agZ58FTNt34oG7d0oPl224ELJqw8iOMB0JXEy3fE76p/
 oqre9VvkdAGpEE1hQeXTnudYq4FWJt4/JqwUKIIGaizLimjj7CQWLqxsIRH9bBknUVcr6tszHdn
 efL4BlGj5N7oSaFCrQc8M6U3oEmM0L3S1or53dNxSStY6sE6zbG0UqkbS3GMwA1MrYlQsuEMuXZ
 Q9bm3/Jlst6LCMBIUAvtZbDaazGwDg==
X-Google-Smtp-Source: AGHT+IFzdu68PpAVcH2MaPOLobnSuhzBLFuGpwZtzC/B7jvw+8UWRjpP5qmwwColoKW5tz3fO1q7LQ==
X-Received: by 2002:a05:6512:118d:b0:53d:dc12:7cb4 with SMTP id
 2adb3069b0e04-53ddc127db7mr103246e87.29.1732320019290; 
 Fri, 22 Nov 2024 16:00:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2497cfdsm610900e87.248.2024.11.22.16.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 16:00:18 -0800 (PST)
Date: Sat, 23 Nov 2024 02:00:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Message-ID: <mue2tzzik4hiu3i4jjl457inbrveq7oifsy35fzwclfbqwn5xz@awtruuphsjzb>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
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

On Fri, Nov 22, 2024 at 03:09:10PM -0800, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

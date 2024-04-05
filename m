Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABF489A2CA
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 18:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100CB113C9C;
	Fri,  5 Apr 2024 16:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cq8fmYHv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250E2113CAA
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 16:44:14 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516d0162fa1so2506977e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 05 Apr 2024 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712335452; x=1712940252; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A8tZjaq3vsa5Ef5+rAl3Nt0a+YxPI811nD5LkgtpzOc=;
 b=cq8fmYHvP90kwF+sJ710wEnfoKwfd4W9FwiK6R8s93yoQ6HN2mOj/ZYx9vtjVIvKCJ
 CJDcwR6ViPaAHd7Bpfsvf8FtNoNPv93F22H/VBCPb75GDgzG2pZkgdF6rYvXKcznEEsL
 4E+6EcA8+hFRso44Rf1pq0gUu+S04ZfG3vTB+GArxID+EmwuJFjROQGKWU0NH10wCW/g
 ngui2cBGtEhSJYL2Lpob7WOCn+QOSQ2lnFxZpHPxnBv0R6DtpNtzQGojy+chyNvYwcIM
 khsvwwqc8VAG6nYssLwUf7Q7wZ8yRzRuDoBwf5M0j/09Qy1O5oS3aWZe+AfVYmloaDb1
 jzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335452; x=1712940252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8tZjaq3vsa5Ef5+rAl3Nt0a+YxPI811nD5LkgtpzOc=;
 b=MrZdzUpdoUQruD4UMe8/V6hfXxNiIjk9jC9NzW9DLHO2ciPbo8AR3bA6A2yyp7uAGU
 mGsX8oHRm5BxR8BU5UcnZjAEtbpD1NJJNrDxXbdCIzh2vAP1p99TNhD8d5rPWYgXTFdh
 wuye2lFkU81yYPOD4fIJKDcKy8o9zgx0FIAM+ai5a7tRY/lRRXt20tPD6BJ9avvUgbDg
 XDOxPugldwdYpiOnM4LUOtLVPK8XTkOmGizS02nuUvS0p7mjqVS0qzrv13e6bbvyYHmm
 69Qdafcu9QaUZVXlzC/CWaWCDqD2g+IQ6Obj+dIAv54hIT7QNXx1OuHl4apXP3KX771Y
 fTig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqZdyN+bw3w9zxUgvvkQ9XwD14RheHZXcnL5uV051bpoSF2bQ7/Ld0kQx/iGlfSHywTAFSJrgRm3GPpL6QAoy+lyqik09h59Mvh44oXLD/
X-Gm-Message-State: AOJu0YwyIGiOv3c/fpnZ9Z5UG4+zMfwTfAsYt8q55v0jkfWoVPzS22/m
 RFCebnPyyUGeTQKLBOeFbIC+6lRmVtQo2EuHiiM6A5mLhrJ95grIzPSYkLJd848=
X-Google-Smtp-Source: AGHT+IF8OL4JCr1Af7MxIbU7nV2WDQTCwzIesM0Hw7oetMCXwX7NKBeUDfbrw0/tz/kEhN40UAsDEQ==
X-Received: by 2002:ac2:4895:0:b0:515:c7c9:b150 with SMTP id
 x21-20020ac24895000000b00515c7c9b150mr1690611lfc.0.1712335451773; 
 Fri, 05 Apr 2024 09:44:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a19690a000000b00516d0933256sm239452lfc.131.2024.04.05.09.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 09:44:11 -0700 (PDT)
Date: Fri, 5 Apr 2024 19:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
Message-ID: <eondf5x3wz3nccxpnqxtb7gtvf3k5u3bz4qwhn3gbcy5pj73ku@fue4tej3xgnq>
References: <20240405092907.2334007-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405092907.2334007-1-jani.nikula@intel.com>
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

On Fri, Apr 05, 2024 at 12:29:07PM +0300, Jani Nikula wrote:
> Logging u32 pixel formats using %4.4s format string with a pointer to
> the u32 is somewhat questionable, as well as dependent on byte
> order. There's a kernel extension format specifier %p4cc to format 4cc
> codes. Use it across the board in msm for pixel format logging.
> 
> This should also fix the reported build warning:
> 
>   include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument is
>   null [-Wformat-overflow=]
> 
> Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
> Closes: https://lore.kernel.org/r/2ac758ce-a196-4e89-a397-488ba31014c4@arm.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Tip: 'git show --color-words -w' might be the easiest way to review.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  8 +++----
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 24 +++++++++----------
>  drivers/gpu/drm/msm/msm_fb.c                  | 10 ++++----
>  5 files changed, 24 insertions(+), 24 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

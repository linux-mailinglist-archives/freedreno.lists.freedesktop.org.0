Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD007A069CE
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 01:14:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A949810E445;
	Thu,  9 Jan 2025 00:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vB0L5w+D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4CB10E445
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 00:14:01 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3003943288bso2159531fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jan 2025 16:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736381580; x=1736986380; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bpDkH3lxJ4g2GFbV3coZXIbv+IWPbixM4fhCIhYbzhU=;
 b=vB0L5w+D7svDVog6orQDRBxUywhIN0vAzRI4AEOv4M7ed5FESdYI8NV1IPbv+vmaWV
 Xs1X2Qc7L1GB8x+luUI7TNKwlDAvjLGHKlukyMMG/9EwLD/NEc7KIchgDbU5NKgRSbE3
 mTQyJGsLsLGl/QTVXHwmDgd+apAqy7KAriuT5egbfzDR7D2vKTmgG9gy7LHtKyOqr3tp
 HChKZso8pj6rMf08a65lcnMvUi4HX1NxO2ebbupWDPd3Yyj38IzMR62LCma/2vTWfSUG
 Djl/KI350A9w7OExd9/km/CMmQNaUKogTRsYDMZqSmuLd02nmesYjrVCsrTjXZl4VBCh
 7epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736381580; x=1736986380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpDkH3lxJ4g2GFbV3coZXIbv+IWPbixM4fhCIhYbzhU=;
 b=MFBvk7yqvQbW514OEATD1hbljRv8krt58E9AFROe4RLPsOpfj0G8VqQhkItNX8xXdo
 CEkG7+jVti0Y8jeG6nFChAuEdkPoYM70IPIxP82nS4E/zfbEjtDR7Sz9fFE1sN/8b/V1
 EfThRfSHzWyqxZN0eeSJDEleyD5JIj02ATSKLt8f8JWSEHGpH20xoGazMG15AtJ6MqKQ
 TMxRjno285mL73wrefeGMQ4PD+IsHJAtljtyOBs6WZmOO9sVM6QEk+xh31bbnpdU+mOS
 rl0CQimkML4THe9ZQH4FOvjXZF4J/9U23U2KADBunmatcJ9GGPCptbDfSotlkxVgcWEG
 rZXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9CwxdKaL5ZDlE37YEAT+Gr38LlULMrXHvo4I7gipEbk5e7TOfH5IVQAN+QfKrefzSqgCKofZdv2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBIM/HmC8AsPHl8nsDXVcJtNmjVDElRT1wIPRDUfRJLDwj09ia
 s21BgFuD6Y3Xf1GUsFMtG3I9m3FotL5B+TV6H4D45TK3VU00AQQZbsv9DGY29fTAJ+ZtO44Y0Pq
 r
X-Gm-Gg: ASbGncuOKCeV4VNc29c0SCUIBkrFAzH+lCxkM0klAoE4Fhe/lg5PPtSt0zGyEhJSzad
 UqBg26j8WzuqBxw8L/znkye3B81uYHu4VJvdPCi1DQpNRtMXsl0X0P7oLzNX5vnjkmQaXBCCPRW
 p6IjQmY3oIGlhkQf9sTOtpN/PS7VvRinFVcAr6csc2SL1gMuLUSeEGVAQDmfVmD7fFBNIUaj3TY
 3RX5YFymYzq90EaZLYOlYWX7V9PFFHXP0qj2XNu0mGHwbCL7HhJCLnVbDmf+PnGDX7SmJFz9nhH
 /AxrsrZFzZtZcA+ELjtUeEYcDeKw4GaAbDHG
X-Google-Smtp-Source: AGHT+IF/y9uUzQydethAVpmH3oNgkVrcF2saaYHkqvOZukLpQEeojH3C6FDQnmUp2JA4G+6GtEX36w==
X-Received: by 2002:a05:6512:3ba3:b0:53e:2f9d:6a73 with SMTP id
 2adb3069b0e04-542844a8f6amr1336553e87.0.1736381184452; 
 Wed, 08 Jan 2025 16:06:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428beaaaa0sm29573e87.175.2025.01.08.16.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 16:06:23 -0800 (PST)
Date: Thu, 9 Jan 2025 02:06:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, quic_abhinavk@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: Drop extraneous return in
 dpu_crtc_reassign_planes()
Message-ID: <5m2t3srguv7vha4e7np2tmd6tm4ajlk2dzc2vruut6krern7vx@ylmjghtj2kbu>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
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

On Wed, Jan 08, 2025 at 02:40:48PM -0800, Jessica Zhang wrote:
> Drop extra return at the end of dpu_crtc_reassign_planes()
> 
> Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

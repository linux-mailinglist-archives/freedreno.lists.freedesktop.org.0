Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1F9F87D7
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 23:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F85610EE04;
	Thu, 19 Dec 2024 22:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Gr0GAhjO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A5310EE04
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 22:28:20 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53e3c47434eso1293456e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 14:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734647299; x=1735252099; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qq6TLQjKymtoXQuAu5gsaufR4Ph+rQRffBYS4657Z1s=;
 b=Gr0GAhjOWPOG3+jNgthfWWJZ2HsJceJjoC3D0YLhIh6P55kQkki2flL5xUTj3AdM8m
 97JS1Xu0rv+UYOPGL9he2pXWnfTuKmNVsZDGfzHbqML5Luhxj2G+Y9AmH9aB9BZsuifn
 RwnZRRajqDVz6TKYCrOzoYkAvc+J0OItOA9m51aUUttxf2RpA+8Iy928cpeh0w0h75kv
 myt3Oy/doLg61B2ikHfEn/xRXs8S6FY4Y8g9zZDxXtPV4iGJuYrHqLnyNULNDiZuTb9f
 1hVO3Piob4pKpC6qEI8B4QFl5SFn5A0wk5OdS7ovs2H0aC+KIBZpS2aDMobrkQZM1s5O
 liCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734647299; x=1735252099;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qq6TLQjKymtoXQuAu5gsaufR4Ph+rQRffBYS4657Z1s=;
 b=FdrkODF/inb4zl3w5okDlxGT41nRknx/eW4/AJU9dhfNUJeK9NpRGSq+Z0LNASk31P
 974+PCU6ImovK0E9F+ihdhfW/ixR8JFMTAm9Qwb4Y+FaRuUvF5SdZ56cQBhKxzRs5Hqh
 AA+tkxaU9tpFsvLBKH3qVe4JoB3cdfCNCOEqr+q/VDJ2jXl+NMpnePMOJaSMV1MqP4Ww
 /94wiLvHCIc4AwcPq4jiG9m5BgeYN9vJobnfE/sSCPfOSIIY6i6DZSyuchAh5vaqL2mM
 23NAdOZ91eLRYLreuVVD4g/pe4WwG5lp7zG4v578JN3xN72gSXxKuPDiKWJxW9EZdyCX
 sJ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUadZLQZKn37ES1uJbhXluHkIs/i57ukesBCTPcSYIqfNvombSWUeFMkpqGRdVxyvl0PsC+MZG3l5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1udL9MtJJAanHcSBYOi0HNx7gp5Pn0ybALl2VvjbpuzYrIGVQ
 ak7BP/6VDcamSzxI8+ttttvu61qTAUhhH//qf8kbQywtt0N0ExkgfBA/QWJTYCE=
X-Gm-Gg: ASbGncs+StSe0LTIDYvwmDniVMJg72OWnt6jM68lkguqvcmRIhxq91En/qiWcEoGYXV
 fs32DbyGbopKzMiJ2uYZkCy3YQ631AKAgL+uSP6kR4ligG1j/Rlsy276m06m5viiSPf0oEiNz+4
 C0h4CjSSkMU3x6H9rqcii/8AbcUGVCnPZX9++iVc/MWQHsF/0tcEfR2cHHjDPD0OGm0fTYmacrI
 FIpljUP24CGr7juNrG+ih77rEvcxgGYn6KKMh/8kM1v5SC1YOZ41lCpvpjzru5KMM3XOsHIFKno
 RasG/JSoancVISR/tpbvH96bCBwCZaQPXbwS
X-Google-Smtp-Source: AGHT+IEw43tUBJRchCl8MuOYQW8rqwep01JG2Y96KkYtjaNzl6mBKUMCux0sBcGmrJiKrqRwBmyENg==
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54229533e65mr94118e87.16.1734647299006; 
 Thu, 19 Dec 2024 14:28:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238217d0sm288222e87.212.2024.12.19.14.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:28:17 -0800 (PST)
Date: Fri, 20 Dec 2024 00:28:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/15] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Message-ID: <oqlzulxq2mtgxopmhirp5ftj7k5hmsga72xpbsj47dx2vlxazt@mv62qtxvfmbs>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-9-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:27PM +0800, Jun Nie wrote:
> Split PIPES_PER_STAGE definition per plane and mixer pair. Because
> there are more than 2 pipes in quad pipe case, while 2 pipes at most
> per mixer pair. A stage struct serve a mixer pair, so pipes per
> plane is split out as PIPES_PER_PLANE.

I can barely understand this. The patch itself LGTM.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 +++++++++---------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
>  4 files changed, 14 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry

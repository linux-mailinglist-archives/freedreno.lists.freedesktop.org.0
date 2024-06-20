Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E291132C
	for <lists+freedreno@lfdr.de>; Thu, 20 Jun 2024 22:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55410E861;
	Thu, 20 Jun 2024 20:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ThxxCYCK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6532C10E2E0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 20:29:43 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2ebdfe26217so11897861fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718915381; x=1719520181; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uhu391MowIkohLMR2Orb/FA0XCbrdTT+Z4gHfZRY9w4=;
 b=ThxxCYCKnU+0DcrVUILSBAsw35tg9J8Bj6Nr3GNjmE0aXiZbOF5B3jUJguOXZ9tHuG
 dZNG1sWulhzGCa+De144qnnPO+17UU6sIxKcufKNrm6lqPrIxugZAUzY0WaqyL4Xg/OF
 W3v3MGhpl5/n2ceXn045s6Tu5h5IEM3OiUbjVp54IfnWQMDzQyt7hLSWuVo3B3b5UDtZ
 t3oHZstd0zmSuNepYxgezL5aZOdaSKxAvnVbwfLPGlIcY93CnmErM/P+KfnpURh3B+Ak
 5nNb41eRuKWmffwnLNnWK5vWUbW8jo1s26VjACyuAPOIM49YgFnZMleXTajHklX/ptAO
 7gLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718915381; x=1719520181;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uhu391MowIkohLMR2Orb/FA0XCbrdTT+Z4gHfZRY9w4=;
 b=gUWLArWEAjOtgGP7V+mDcF0Umj+kYyLvnCcF+//7Akh/0K/RvghZKdbLN0H4LmEkXR
 q9XsZYbRLxz5DYvAL7kZC1FXwKzD+i2XT/faUXJ5Xk9hDjHDpYY3G4fS8D5zhmmygdRO
 VgHh9Hqvy4c7uMfGtleOExAZetYSsJw/CbYw5Z5Hh1krghGLEgSjp6sJEMblU6eOOCXy
 U+rw+0IcEom0XGnbnXlaeQcTVQJbZM8yfgayF2aXGHdHoOm/rYRvpv4rN8JpOy3PNOl6
 z6BhyWzz3K6PK5y/mtNwGEsu5xSEQQGSm7PbROL6/Z/s06Pwp6a7zIWpKbD4fabAK1tG
 HSRg==
X-Gm-Message-State: AOJu0YyNNEtggFf0cqTCrN1umU8uX/6Nn5kgWuJVRCfLkUnKcxPsJr/4
 bHPZhX7SMLNpmSezf56Xo3muI2yqiVWLdTiuLEc5QD/hxhdrj9P4svOifNObjz8=
X-Google-Smtp-Source: AGHT+IHhWAWQPYglGVh5M4MGrcnUTyn3QOb5ZXLF90xiDtTOHmqPUQLBGCOcZAhbEpoE8PLlZ1sMXw==
X-Received: by 2002:a2e:8817:0:b0:2eb:ec28:62f2 with SMTP id
 38308e7fff4ca-2ec3cec5f83mr37406201fa.28.1718915381341; 
 Thu, 20 Jun 2024 13:29:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d59a82dsm160121fa.0.2024.06.20.13.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 13:29:40 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:29:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, dan.carpenter@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Message-ID: <izksgfpdypauaa5jn2nd4an4rausjn7hjwpzu5rmkrix3bbrr7@df37xcxj5vtg>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
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

On Thu, Jun 20, 2024 at 01:17:30PM GMT, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> changes in v2:
> 	- instead of adding more validity checks just drop the one for clear_pending_flush
> 	- update the documentation for clear_pending_flush() ctl op
> 	- update the commit text reflecting these changes
> 
> changes in v3:
> 	- simplify the documentation of clear_pending_flush
> 
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/464fbd84-0d1c-43c3-a40b-31656ac06456@moroto.mountain/T/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h          | 3 ++-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 

Thank you!

Rob, do you plan to send another -fixes pull request? If no, I'll
include this into -next.

-- 
With best wishes
Dmitry

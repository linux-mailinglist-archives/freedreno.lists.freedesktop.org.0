Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A269989A2D4
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 18:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DFC10E8A9;
	Fri,  5 Apr 2024 16:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OCYzMNuR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9E110ED31
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 16:47:00 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516d3a470d5so1311654e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 05 Apr 2024 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712335618; x=1712940418; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zjZDXXK2zwXeuxbCY+k8mNYZHEoQ+bEUvt9cCenwnEg=;
 b=OCYzMNuRFfXPIKsBQVBjBhpW0LDkrvoDc3JQOxZr4PiT+gBYGXRsg9mo8gN6/vrBIE
 C0e5Fci843G6VQVdBBWkHizwBcXHbR/2cJxnEVBnjDlpMK8WHvNXkMYhOZuUMsOqXHMN
 GB593VDME7GPbPQ3VJ9FgAH1SHu16cHtnEI+Rjkt4DQ26vpXGUR0n6iswW6U8qcfGlkX
 Vj20NLUt4JhFd8eJ6F3j3KWaqFzayfUCl8x5Jd4LFIAT20ZjUWm2sYI3jrlKYXgCnjuN
 sbzvM7HZW/VyNUh7iI1K7XwBw63CyBXwoYcAM+WcJ7GU7HHf4ENwzQyKXTLsNOU4P8tP
 ZQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712335618; x=1712940418;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjZDXXK2zwXeuxbCY+k8mNYZHEoQ+bEUvt9cCenwnEg=;
 b=YQjf+xMXTfi0OruIiFAy/Qske2kSdYPrEadsTk4UZcAwKtM3DtOrt2spzKEdMCs9i0
 tH/UrY00xm7dKNu+dwRSDAp9S8wXNi5e2iu0JxMJznBFwA1yO+0Z/TNz3jxdFOtBI7O6
 1s9jZXbs/g3b8dnvCXVDiRRIvmyPDhZ38OVgp6RoUhwTEPrMWc3qdWaq3Bq2fRLveuJ0
 j1f/jUgjhFKCSDyiL561hhMNerBGY3xqvf3OyDFwsoYDnAvzSjdsRT4gRgPiQfwsNqKk
 PHXcDDnBP8z+uh1uOgZ/Qq/dbb94vxRpDEzVuo/8ZVLpYUQ37niMitFig9m2ceCamvFQ
 0Gsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCj6n5MXD7Vb5ef5dkSCpaWZYm0QfilImE2RKdPIKvBDyjYVJU//59smOF0DyPJRce/+6Fe1iQazGNghmta4wMR5xO1UM3EjN/UBIxIeJL
X-Gm-Message-State: AOJu0YxfzJj8UpGqY58ktIbiRd8dB8dZaImfeeIOTCnsuI3jV3nHp29P
 RePrKh8J1J2ySZZg/nR1RPraORj05hlMClgbholHieFxkkcJBxlHZpd5kh4ruY0=
X-Google-Smtp-Source: AGHT+IFufXZNeav0WseEY6nRjlxRZCZWJPm4KsDfy/VrMhHziMpaWAR1CqPIEOMNojFKUGoxkwK9tw==
X-Received: by 2002:a05:6512:224d:b0:515:ab92:6a82 with SMTP id
 i13-20020a056512224d00b00515ab926a82mr1791982lfu.17.1712335618108; 
 Fri, 05 Apr 2024 09:46:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 r14-20020ac25f8e000000b00515c8ff6f52sm231480lfe.229.2024.04.05.09.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 09:46:57 -0700 (PDT)
Date: Fri, 5 Apr 2024 19:46:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: ci: fix the xfails for apq8016
Message-ID: <oakh6gccuho2zq6aaaydq4hucz2ueuayo6qpq73uaw7ljt4gu7@haz3kdjjy7hp>
References: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401204859.24223-1-quic_abhinavk@quicinc.com>
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

On Mon, Apr 01, 2024 at 01:48:58PM -0700, Abhinav Kumar wrote:
> After IGT migrating to dynamic sub-tests, the pipe prefixes
> in the expected fails list are incorrect. Lets drop those
> to accurately match the expected fails.
> 
> In addition, update the xfails list to match the current passing
> list. This should have ideally failed in the CI run because some
> tests were marked as fail even though they passed but due to the
> mismatch in test names, the matching didn't correctly work and was
> resulting in those failures not being seen.
> 
> Here is the passing pipeline for apq8016 with this change:
> 
> https://gitlab.freedesktop.org/drm/msm/-/jobs/57050562
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

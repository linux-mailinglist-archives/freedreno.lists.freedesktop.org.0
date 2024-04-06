Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2D889A8B4
	for <lists+freedreno@lfdr.de>; Sat,  6 Apr 2024 05:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047A810EFF6;
	Sat,  6 Apr 2024 03:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pmru5Ze6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48F810EFF6
 for <freedreno@lists.freedesktop.org>; Sat,  6 Apr 2024 03:47:37 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so3307634e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 05 Apr 2024 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712375256; x=1712980056; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F/uU7IKHxTMAAbrC11KIil89Yya/JAHmkuNwgB4NZyE=;
 b=pmru5Ze6qjxohm9ezRwdKGvANkaPrcn2KpTs+Sqg94f8Ocj+5Zqys+5gqxKc7/LaDV
 t+PaSrfsSpiUjQdBORhgUpECHUCHIhTpyoq9bEDYZz9VIoTgMpxVecdzPkaRKP2DI6xw
 KxZaE5XJ3KuqBUM15sGbgZf/+CW05PT01jdoGIpzvSo+9+P0ToPtwMJNbW3cl/53AMA6
 HHjx3fodBUE5iBHPi1s65j4IDr7Lz2FqwrqR94JU1r2+4E+rHZIvPh51yaOKOqypqZj4
 M4yLvvIqqWoLssTtOffb2KCUx/I9CwksSBFMZJqP901FNQHzZhRKwEXB7+6JkSm6Orp/
 Fp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712375256; x=1712980056;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/uU7IKHxTMAAbrC11KIil89Yya/JAHmkuNwgB4NZyE=;
 b=rCZCkEl/NUTuo4IOdoA1FWS4FFobOg1dquQ7eBPpuIo5jAmkdU6ugCeAxvZnelt8Dg
 wWZrTIuf/e+UfInyEgCoWyz6tKElioMzI7jgrmimKxH9DBSHcYaorcNyLgeA3B45copi
 KWYYX1Y4CbNFHtxiCXBX9HI1aartmMyaBmmn48B5PxpYS2Q/tj99WxPdipdapDrpyVJt
 i1sYR0KNxF4+Vv3sX7//riC567aJES24E9K/UsS62ZOLboRBmvr5k/RoEIOC62LU0aFK
 r4aZUoDV3jEjZVHpA93MmI3CjCs1nutxmrACWNKsVfbJXFTqFV0UJFKEWmCEv2WWdhG5
 CxiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNWKZ61U4UKwyaiPA5ughYDHexKGc2KdTiglO5+KukPMX0mkvWmh0MMInZFrShCgrnZTVvfmp0ISnmHAChfc4I+dmKQj9Us8bbnuYMB8A2
X-Gm-Message-State: AOJu0YzFUaGE9rfto+7SaEoTtk9Q/xN/xKcxnqoidi73YrK8lvxX2itA
 IzCElkJ9hewu0ts3F9eqkHWfUzJtasJWTkjPwUy7dheETyaYg4l5eOUkdu0uo70=
X-Google-Smtp-Source: AGHT+IGnVgGJgW4W+EbWQbKLF8gQTo8Hs7EZYSTgxIwK/hl1vXLroiMKUu/oLwz+20+QBTD/hTSGKQ==
X-Received: by 2002:ac2:42c9:0:b0:516:82c1:7d65 with SMTP id
 n9-20020ac242c9000000b0051682c17d65mr2054746lfl.23.1712375255742; 
 Fri, 05 Apr 2024 20:47:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a195211000000b00516a234ca0dsm357975lfb.192.2024.04.05.20.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 20:47:35 -0700 (PDT)
Date: Sat, 6 Apr 2024 06:47:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: Remove now unused connector_type from desc
Message-ID: <iwsvkn6u3aindxqhkbyygoyy36chwuastxvmkoknb2vpgdq6mr@bnuuxveszbk3>
References: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-dp-connector-type-cleanup-v2-1-0f47d5462ab9@quicinc.com>
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

On Fri, Apr 05, 2024 at 08:14:11PM -0700, Bjorn Andersson wrote:
> Now that the connector_type is dynamically determined, the
> connector_type of the struct msm_dp_desc is unused. Clean it up.
> 
> Remaining duplicate entries are squashed.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> This cleans up after, and hence depends on,
> https://lore.kernel.org/all/20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org/
> ---
> Changes in v2:
> - Squashed now duplicate entries
> - Link to v1: https://lore.kernel.org/r/20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++------------------------
>  1 file changed, 17 insertions(+), 31 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

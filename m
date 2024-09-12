Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCC976033
	for <lists+freedreno@lfdr.de>; Thu, 12 Sep 2024 07:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD2910E0AD;
	Thu, 12 Sep 2024 05:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p6C11gpI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D093010E1E8
 for <freedreno@lists.freedesktop.org>; Thu, 12 Sep 2024 05:03:44 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53658f30749so604771e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Sep 2024 22:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726117423; x=1726722223; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=noD0uf88q3RdaLafoUYt98P8HM8wv8kHm5RyRAQfAOE=;
 b=p6C11gpIPHdQps05YKVJ5TtSHS+Aazpwf5jfOiw7Fn9+QNVFrFDQiKNLFyVzWvCbiU
 bfNAW20vP01f9CvmPeKm2nBEq6r4Dl4UysBO2o8PvZqA7zMgCOqXGo8S0TetutXCokWo
 j0jCtEvTs/MRggx6oVU1FWjGFeur5/pv8smrrpFuY5A18oz6NghGEt2oa4ZA7lZxlvCj
 AB03YFPNvi6PZWRmc7pPJ8c7+UIy+Rx0CtwWztzWmw4SAE0X48v6VyL2MSWJ43tHtohc
 5mm7LY8SxSxXg2NrDwwOa9B4oW6TesaC35BHESBdYDnrmRInWTnOMaIcKvTT6PoMZUg6
 TVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726117423; x=1726722223;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=noD0uf88q3RdaLafoUYt98P8HM8wv8kHm5RyRAQfAOE=;
 b=eu48kiOJP6q7GzWlRF9xKC/tgLU/fET7ioiRdwar+vBruLBg9ar8ME8FPZlYuS1FIx
 qCqwVY4vTa3eW2YTsLySN6i8pcuro5Bno0hRzG90PdQkncOmx38s6rf8oTPwvQ7WzIvj
 +kbF8HHZViKzj0z/pPIvnIp2iKm/Y1ZDw2b4jazh0Q0vUfnmxp4mleMd70DU617jk3WV
 7e14lucFn5/gcK+L2gRyZbyqwULeUfqLvDSwdNFoucZ+aU16w9R5y8nJnD14DGqJYkQE
 TRxtK+uTx1kAUCm8VjNLyNevo0M6DTjsOdL4hUHsZ0SH1gdnHmhZN49gaj0kqJFYxQHG
 he7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTOq5De65hHeoxyLNHwggAGC2joNxafjG+AzkmfElAOPanDykHExNiVgyHkT+OCOPZk/Kwtvc92kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfUMeLBBvDd2/rBxEzEMKQwrcvPnF0WY7xivZtpM8oUbUk2npb
 xDWVRcMRLwuhrwo+A9zbblxY8GWbfu4kz6cLr8x9amo5AW31D6P9yiGtwWTkr2s=
X-Google-Smtp-Source: AGHT+IEhvubGxjrEQVdVXNSpslGFKwSw4CRUWLIiO5R3/3qcm6MQuihMMnkeCR9XhehXo7BfZGCjhA==
X-Received: by 2002:a05:6512:a87:b0:52c:d626:77aa with SMTP id
 2adb3069b0e04-53678ff4d11mr738269e87.58.1726117421945; 
 Wed, 11 Sep 2024 22:03:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f868c5asm1775717e87.43.2024.09.11.22.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 22:03:41 -0700 (PDT)
Date: Thu, 12 Sep 2024 08:03:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, sean@poorly.run, konradybcio@kernel.org, 
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH v1] drm/msm/dpu: Fix some typos in comment
Message-ID: <pd76zf55h3kjpmgiydiu4br35bwlzsey2losublklv4o4ta7ko@z3gzy2eec5qh>
References: <20240912042425.4703-1-shenlichuan@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912042425.4703-1-shenlichuan@vivo.com>
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

On Thu, Sep 12, 2024 at 12:24:25PM GMT, Shen Lichuan wrote:
> Fixed some spelling errors, the details are as follows:
> 
> -in the code comments:
> 	collpase->collapse
> 	firwmare->firmware
> 	everwhere->everywhere
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Missing Fixes tag.

> ---
>  drivers/gpu/drm/msm/adreno/a5xx_power.c | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c    | 2 +-

Subject prefix is incorrect, none of these files belong to the DPU
subdriver.

>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

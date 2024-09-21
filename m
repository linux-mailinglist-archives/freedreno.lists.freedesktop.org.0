Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F0697DEEA
	for <lists+freedreno@lfdr.de>; Sat, 21 Sep 2024 22:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17AF10E199;
	Sat, 21 Sep 2024 20:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QroQhoty";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BED10E199
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 20:56:10 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso3680402e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 13:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726952168; x=1727556968; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qNJ//WLJC+rT6bdE83w3ztydutKipFcS5oG1bOhNX34=;
 b=QroQhotyrJxQntlkiV/Z5TbxpHN2mToSTnT21YS8R7dKDdfP8ep2ib5SundEUpPqVH
 tpUyLHGOBh3DDyNq+QL47QhgpzvoX54ybt/MbLPhhTo3BIUUfYHzEHEwlSkDzyZUoFDa
 Y+iKRTSd1CE5SBhpVLAjYPdOYvdOe4/Q1CAYPqBet75LupALCzlL/lBlztlMvhxvix4y
 yMdQeaCXjCbiWckOIPUNZw3Un3Yhzp+B7YwLwHy74s5CNmSm93cwasNbJeBEeY9g8scq
 IaxV1ANlNJQzzF3gYsTbhHUN9s/U9QLJyIpfY5F3Cu77wNndA1msMDMw/l/WFq7TvKI9
 09WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726952168; x=1727556968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNJ//WLJC+rT6bdE83w3ztydutKipFcS5oG1bOhNX34=;
 b=E0bfZTcGFYZbKyocko/KfQSzLjmFSnxW2l5TqyNJAVgA3N3R5a3S/dcl3fV2JCdFXN
 y8lF8cW64u+KntdDM3O5u5gKw3kP9rDZ+7DtwCqi++a5E5O8cCU4WK8NAH98jzW042X4
 XLlU+nSuC3HJJYz3VWQ6Wp6ouj9Z+xLo53mE1cK5jPZ8VOFLk80FrMkFQQtFZpgngzia
 gX5cKgKOjoRZF5xljqIiejgjefnNJINoSPj6gNMdC/JGDZFNrpd5/9qW2y1D7WeBRar5
 wn92YKWRZiTSzO61BG/qCvO/Z+JUBguofD2dMToyeo8H+1jvVES1R/k/bWArVQxUj0PM
 5aew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlnySPXFwyMVNeeqR0rurrnIl0HC90+fg628MorZQ/EV1LQN/rdf0KJRwOhkK6WqI/UhVCmkIKuGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAc5pNEKbyANhE49rMXtofoZwkSlpXwjbhiH4TAM1mhrSGOMD1
 1tQMmt95jw5rtFCg3rzHNyIRwPX7h2HJsJOc09vP0wYyAz4QfBZ8ml02Ha3/Pkk=
X-Google-Smtp-Source: AGHT+IESDgIIdZzD9EVFYuqv0g8rCf9M48QrMLDI+CZ/amjCPR8cCdnPNrSLBhZFmKmw90fs3mj+HQ==
X-Received: by 2002:a05:6512:4025:b0:536:14a1:d660 with SMTP id
 2adb3069b0e04-536acf6ace8mr3791045e87.6.1726952168086; 
 Sat, 21 Sep 2024 13:56:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704683csm2702411e87.23.2024.09.21.13.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:56:06 -0700 (PDT)
Date: Sat, 21 Sep 2024 23:56:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com, 
 simona@ffwll.ch, sean@poorly.run, konradybcio@kernel.org, 
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH v2] drm/msm: Fix some typos in comment
Message-ID: <uwmnsmeno3i5uzbbizq62ffsnuazhb6g7hcdkj4re4l2z54j27@jndvshalzuil>
References: <20240912070420.2891-1-shenlichuan@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912070420.2891-1-shenlichuan@vivo.com>
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

On Thu, Sep 12, 2024 at 03:04:20PM GMT, Shen Lichuan wrote:
> Fixed some spelling errors, the details are as follows:
> 
> -in the code comments:
> 	collpase->collapse
> 	firwmare->firmware
> 	everwhere->everywhere
> 
> Fixes: 2401a0084614 ("drm/msm: gpu: Add support for the GPMU")
> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> ---
> v1 -> v2: 
> * Changed subject prefix to "drm/msm: ".
> * Added Fixes tag.
> v1: https://lore.kernel.org/all/pd76zf55h3kjpmgiydiu4br35bwlzsey2losublklv4o4ta7ko@z3gzy2eec5qh/
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851DB89DEE1
	for <lists+freedreno@lfdr.de>; Tue,  9 Apr 2024 17:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C96610E6AA;
	Tue,  9 Apr 2024 15:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I1JQMkuP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEFE10E6AA
 for <freedreno@lists.freedesktop.org>; Tue,  9 Apr 2024 15:23:08 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516ab4b3251so6450847e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Apr 2024 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712676186; x=1713280986; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t2tCjiKMLu67Fkz+iezt/yHgHaFuwGLbY1Fvrb5eqfo=;
 b=I1JQMkuP7LEyONvrgQsV1pEZXy7FHk8LpkOGqq0j5SqnDZvxJVV3Acfy4oe2DlvbKg
 CLdbK2A+BEpbFpEYUMsZD2X5EPjRrW7YFfPXJX2RldPH2vLU/W+kCHMDZIgyTUum6FOe
 A+PJvidDobo2zBNqc7r29gQA8tn3NFEhVw/KJYApUpYqn5sGkwPuYu/sPnJ1p7HgWWl6
 X33ZIxkv0VU3WonPEaqvvwVydUrUYpDDBWLVmvXtaoM6YU3n8fHESBwoc9cTi7aD63UO
 qTnKRL0uuFmMIQClWqtEe+HhO1pgh1V3DR6ATjWveVt0i/CVTy4OBrBIhovgKcgPHlWR
 EaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712676186; x=1713280986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2tCjiKMLu67Fkz+iezt/yHgHaFuwGLbY1Fvrb5eqfo=;
 b=H04/IzCaW57s2PRK6gScB75dcoAQRt/Y1dH6NLLOQuoXU1FdS3S+fWqhytEtgl0AuH
 G9HXnP4zUNVkK9D7raq/LkDFR0G9YZcerDn4nFPvHj+Pqu/ITmoqvTndTyo274NTKAm9
 DNMflNTncOFuSBg+0gCxFXhlYE+g481NZknhwiitxm2TVQBpIe5HrcQDTV8xekWM88pm
 TbsJY4Ovu2C6zF/0l+VUGFeh15Vc07F0Wjp9Ez3DGArbWw8SGkuIzs4O2mv/RiTpOBUS
 k5xDvHlKL7o/U6sRPwWRv0AQQ06lUsBex8D+fbXX80evQ0QL5knMXglZ8yhxq8rdIXsl
 1vQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoPO0XXV8KoquP9jsEfjFH0SD9QwXw1i0JVQazVbYPfylsUuLYa9Ycy1+0HvfrhGqNrp3QK5fVd0idIAzTj+3uscVUyZz2O0H03jQWxdPI
X-Gm-Message-State: AOJu0YxQGlziUdlCdhZjYff2Jb599aCTcvEMVhI4HdiA1/nWpfy5cN9q
 mbbDm3FBk7v2O3ydqMukAoxL8uYrWNA6o5sJUgqUsRb4mZE3F3xT5GR/6bFipsk=
X-Google-Smtp-Source: AGHT+IGd1MRTD1fygLkZGj0gGNROnqZWAPn+yiWrzGgkFdwm6W4JiIoDmuUFWhKDLN7YxgE/yllZVA==
X-Received: by 2002:ac2:454b:0:b0:516:bf06:cab7 with SMTP id
 j11-20020ac2454b000000b00516bf06cab7mr8930457lfm.35.1712676186541; 
 Tue, 09 Apr 2024 08:23:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a056512325600b00516a302f32asm1593546lfr.132.2024.04.09.08.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:23:06 -0700 (PDT)
Date: Tue, 9 Apr 2024 18:23:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
Message-ID: <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
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

On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> 
> 
> On 4/6/24 04:56, Dmitry Baryshkov wrote:
> > On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> > > From: Neil Armstrong <neil.armstrong@linaro.org>
> > > 
> > > Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
> > > the highest. Falling back to it when things go wrong is largely
> > > suboptimal, as more often than not, the top frequencies are not
> > > supposed to work on other bins.
> > 
> > Isn't it better to just return an error here instead of trying to guess
> > which speedbin to use?
> 
> Not sure. I'd rather better compatibility for e.g. booting up a new
> laptop with just dt.

New speedbin can have lower max speed, so by attempting to run it at
higher freq you might be breaking it.

> 
> > 
> > If that's not the case, I think the commit should be expanded with
> > actually setting default_speedbin for the existing GPUs.
> 
> I think that should be addressed, although separately.

I'd prefer to have it as a part of this patch, but I'd not NAK it just
for this reason.

-- 
With best wishes
Dmitry

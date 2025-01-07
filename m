Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12377A03E46
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 12:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758FF10E423;
	Tue,  7 Jan 2025 11:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n9Ud07rz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269DE10E6BC
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 11:55:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53f22fd6887so14237463e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 03:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736250875; x=1736855675; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1BZ9YGNo2SXE7kqR3kflhucDH3azbi8G4Q6AF5m/Ioc=;
 b=n9Ud07rzAV7uSHP8qP3WO/7GcJ31lo75yzJ7gD+PQCT4R7hOEOFBsGcIZdSnWC5387
 w31IxJY5UJ4kiRmjKmz70lZ9NM/p5zT0bLkiOE+8WTCa7Sgdu4dUofoNk8foRI1oyfLY
 C3W6rz3IxMdnseCfK/3leH6fbdFl9c6QvUjv03lm8bdi9ebASLNMCuYsmQ9Lg2WwThGc
 f/8be14kTofIGYq9kehj2nU7BTllwipabiNSAFTUkPQ47oVO3oWHJ7yJYKW4KNmhR2jh
 gW6V+N4DhFwo2PH6L5qzWeDR04nPqvtRmsNlelzKzAB64Sgo+ejdcTL7Tj3fvePRXF+B
 kIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736250875; x=1736855675;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BZ9YGNo2SXE7kqR3kflhucDH3azbi8G4Q6AF5m/Ioc=;
 b=iogr8xjEfxv+eDn+DX6IwCFdRe7Rsr9MQ9cmWArSeNF4B2SXzXweao44x0k9ZPviSB
 pAHHzEJV68BYEg1TkQbhEo1CmMpcpTfVdmt3Z5d9Kw67amafzq8FJZH0m+J6RC33K1et
 6jPHGAaSakP+EbMfb0JLnd7piRVaTkswgFVf8e3KVIN2GQ06uD6lwxZRZWZdkKQ4stuY
 WyYFJv8bCeOWFad7wn8OH8KOaiEpvmxqbqDYr9z7z7dZjOXMfzXGCUfbd3ExT4JTDiJ8
 qt/Ww7/ffd3JpfoYVI56rRqYr3iauEvnNaQcjARFBl+Oj3auT/DmXwG0NDNyNv7buUtm
 gtLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIqkiW4vwPBq0a56tlePZvMOHPuxTRrw6JNDl4H5upFNo3oA6xowkzgiO7BQA4k031tXm9MrZD9MA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOswkP2vhbFPFePeSAQ0MKTRF0bVb5FnKE2ufgyt1WkwWfUD2Y
 /Jwm8PPY2YyUCB9AshDQPx7rCxitMEKlytv7LyUruRijKuyUtZJrlqfcSWbxP8Udpu6LN47R8ad
 T9cY=
X-Gm-Gg: ASbGnctNCOlnsR+VGCGLm7y7Nq69CCiJstd/yigf6HDwuO6VPlMhgpYW3P22a58WpWL
 C32hraLlad54tuRIW0m2DL3g/AQ1+LxPxk72D0BoPBLGuA2fZ3Ly3drB9/wsvzzE0EXJY/8u8su
 0v5J19RvSzLq5zcXSjy0qJuIxNMQVKbp8FibKzAo7Zfvy4X1kIWtrLKJyPRSN9LhinY/QztaNcL
 ECt3vsDAulw2z/yfgtnJDfJHiQo/D5CzVBQScXLsT0xfwvJ08iRhOpFTWfEXzh4Qpq2BzKlrabR
 Q5dQhLkQ0E8ZB/a7CsAReAnyDqgnP4sLI9/P
X-Google-Smtp-Source: AGHT+IF/JNesMMW9YpGdlDaPx32nw8jUIyI7gzybSiownU+qrpr62y2ro0G/5CclxAQbTzS55DGgEA==
X-Received: by 2002:a05:6512:318c:b0:542:2943:db06 with SMTP id
 2adb3069b0e04-54229547836mr17722319e87.33.1736250487515; 
 Tue, 07 Jan 2025 03:48:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832002sm5244113e87.264.2025.01.07.03.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:48:06 -0800 (PST)
Date: Tue, 7 Jan 2025 13:48:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Message-ID: <t2pun2bz73aq426jokjlyeweknln74ygf5xj44tnmsoxowvnku@qtxqjruhfkju>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>
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

On Mon, Jan 06, 2025 at 07:17:40PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
> > Enable CDM block on all the platforms where it is supposed to be
> > present. Notably, from the platforms being supported by the DPU driver
> > it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> > (DPU 6.9)
> > 
> 
> Thanks for enabling it, but can you also explain on which of these has
> validation already been done and on which ones you need Tested-by from the
> community?

Actually none :D It is purely based on your CDM support and existing
vendor DT trees. Maybe we should spend some time validating it.

> 
> Is it fair to assume that changes (3) and (4) were sent out separately and
> not squashed into (2) because they are pending validation?

No, it's because I don't have DT (and so I didn't have reference) for
SC8280XP or X Elite.

> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >        drm/msm/dpu: rename CDM block definition
> >        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
> >        drm/msm/dpu: enable CDM_0 for SC8280XP platform
> >        drm/msm/dpu: enable CDM_0 for X Elite platform
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
> >   26 files changed, 26 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> > change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> > 
> > Best regards,

-- 
With best wishes
Dmitry

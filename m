Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A1A03F9D
	for <lists+freedreno@lfdr.de>; Tue,  7 Jan 2025 13:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4310E321;
	Tue,  7 Jan 2025 12:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zCt/Tf+/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01D110E321
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 12:47:18 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-304d760f118so39245711fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736253977; x=1736858777; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MBYCXiNUmP+NS1TJr5/lQJkltRhghdhyfGgha2+EzJU=;
 b=zCt/Tf+/CpYwI7C5xQYQ0KapApPDE5tZkAcgas6xXRNB3YkB46veSCaummdUS79uwe
 M8cY+lxV7Q9pOlnaaja6YmLWJoVr+qhfnGq8YKwM7h3QyMTX9kYw806vwidAYq95cBNl
 bJQxFhS8X4O8IlmBRrASzOcyoInUWT4xx9XhPDnTTN1j/ErG/mSPN7kKILA7DH6UWX+a
 OMbFxvxbxrJmNl8evvqur8UjUujYeon5HUL0Z+/aNAvWsYa/jDI6lepccp0EqU4J/bRJ
 icpOwC2sftXX7hMWKV93Yll4emYwBkDDvWOCl0/FKK1JL1pfOdv/7IDvEzNFVZyNkm2D
 0EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736253977; x=1736858777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBYCXiNUmP+NS1TJr5/lQJkltRhghdhyfGgha2+EzJU=;
 b=mVVIY0inMH6OIt5d2YFNTL5+zeSV6QoRO5MRRq48wdYbiEBPIVD/mwSHJPhrWJ53xR
 L4xdzNC8GCcURdUJ/WWQB/q0LGJfUlvzoVFp0PNosTSiLVQz6I/1MRjFYNafIkDXvQdD
 OwaKUbA7lI7qK+7HS6Q7nbp4S7lTRWfmUykVmGSVZoWtxCoNxWQRhQg5lXBXrA/t/zBW
 pUn57DAtS5SOSB0Y9UX9yDovfzzYDnVCVyHa9y2XzZE5YdcV3srXAkcOeaI+SBfQyGOY
 JJ6CFw93dF7gdDN6gxVqVfDYSdFo6DYuadckoRglj0TuszPebSu9Ijkgl1lFymyVhiGj
 3NIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/x5c3ypCcVtmuGm6sV8C1c22Mur1p5N7aKF7zWe1VuSvu5HZADoHwBTV3lY+nfv/imM3xFPUFc5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQL1gH00IAdZBFYLtew+bPo4o433BIFVwEyw8X0UEndWdINpEv
 pxdYLWduodaI1Yp3Sx+VIwZmSJ3s1lHIdMImOGVIxXThh45xgrCO91r9FpHtvumSxOFLquX6osR
 B9uE=
X-Gm-Gg: ASbGncs1RubuteC3riiPtKT0NxEQZwBOzOyt3r74pi/48tTOmMUreEhocdDxqX6qgHM
 19feAriPZdN4x4qfQjUF0GzwZpbuvNnIHuHwA5Ch7BMo+gavlznWxthqSwwasxIgdBBGtyFJF+e
 4vnBADd2c5jXvKwNKqHk8bL5UlEjUYWt/ibZmkUIJu7qIkWwcaqA4RvSfW9EhjE0JW07SXu8CA/
 GxiIMOvD7neUoXQGMD/zQf7Vip1DCAuE8qYDdau/DW7XrFtGRHGqVTqTIQ9Ee1kKxN+BBcF2LHg
 bjYrL8fhY2RuTb0N/K48Ry9JeoZFjHYrbuwU
X-Google-Smtp-Source: AGHT+IHc6EgVBLn9/SQM53EGhpryw3Dq5lMmYc0JINGrSFhjD24qHjoSL/GI445hMcy9tZWQjpzLZA==
X-Received: by 2002:a05:651c:1a0c:b0:302:3534:1fba with SMTP id
 38308e7fff4ca-30468547e32mr208884401fa.17.1736250399600; 
 Tue, 07 Jan 2025 03:46:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082e01sm58637631fa.98.2025.01.07.03.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:46:38 -0800 (PST)
Date: Tue, 7 Jan 2025 13:46:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Message-ID: <6etymzv5vziexe6kcgzas6pr2qgxbgsw3weobydwst7np77col@jszgjhnvcsy7>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
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

On Tue, Jan 07, 2025 at 09:16:21AM +0100, neil.armstrong@linaro.org wrote:
> On 24/12/2024 05:25, Dmitry Baryshkov wrote:
> > Enable CDM block on all the platforms where it is supposed to be
> > present. Notably, from the platforms being supported by the DPU driver
> > it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> > (DPU 6.9)
> 
> 
> Can you specify how to validate this ?

Use YUV for Writeback or DP output.

> 
> Thanks,
> Neil
> 
> > 
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
> 

-- 
With best wishes
Dmitry

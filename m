Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BF966789
	for <lists+freedreno@lfdr.de>; Fri, 30 Aug 2024 19:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C5E10E923;
	Fri, 30 Aug 2024 17:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X2kRVr1I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398C510E923
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 17:02:09 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso24510851fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 10:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725037327; x=1725642127; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iy1KwRpNUGkj+C8RUHgjHvQd7fkZ5xQBFwgIdNo1D+c=;
 b=X2kRVr1ItOcnPUTz0TdfRaHuxaTMN7qYyZ+p684bs3A27w9ig/G3wuaMRKN8XTnBp6
 GgrTyDyTOV/AmlkawvwJSC+8yp7H6LGxkfzWh56J3PjkxsmvxqXUaLaXm7cj06vPtOAH
 zMDnsetNfnampDLN6KBXEi7JNP0AAn33f1fe3PJVpx1rYbxk5icsvP5bG6mBXn1Q3zwT
 Fop5S13qUgS3ona1wTL77bh4Vz9hLivXqt8y5fYIdz1V6kXUcOUwLmL6wQfyiQqeVmn1
 c+0/7UukL4l9Jzmohwlz+8yFoz7bdY40u8dfzxuNln5bpG4eEp32uhrLJoyX9BTwME41
 mEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725037327; x=1725642127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iy1KwRpNUGkj+C8RUHgjHvQd7fkZ5xQBFwgIdNo1D+c=;
 b=s0lQX9zMYlYZR9gIYuZseBUxy2DuNODM3sHk8JJZVPDZtxRs1WdHVPRzViccQBkej/
 PE+hCdNyZJ2Xcvy0a9zwqZ7w4/2LlgAkKsMELmNHt4THu1hbTwbtgNazKGJZZWzypmEc
 P9jw/As5rc034meOMyzXYHy8JdMgcvW5CpJV1VTVhbioAagnLd2evgBy1zxU8jSkrjM9
 NkXBLEHWlsTXLDxSg8rlSeaPfZoJaIgg6rZPZ4qmhuhPDc9VXAxM6PHjmNMCDMGuik/r
 xa3MRDe5rFkFRZB4mexiGQdjSpCGFaW7toCOeepwSLsfnjA5xJOO7MITxuNA99YYGprr
 +ImQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgUy7dmDUpVUMhyeNlbE1esdZ6Wwm5iTBkqEzJacR/yjds34Bf8j47nK5UsZWWeNNyueXKnd3TxOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD6IrDH48Nr7Qna6STUv1MlUCkAncdhbtKIuo2cDkyHfuuJ+Zc
 OQegFReUaYRithifYR8RWUGAAPJ1eyWLcFDBg+nsXMqaeIRpnkhhB3JDg1MYiPA=
X-Google-Smtp-Source: AGHT+IEPQ7h9WzerpnvpweqQa77Ds37RhEPya9x8ww4BvxZHsuGYMg+Xslva2ggdf/iA2e994Xil0Q==
X-Received: by 2002:a2e:4611:0:b0:2ef:22a6:d90d with SMTP id
 38308e7fff4ca-2f6108aef13mr51280371fa.47.1725037326455; 
 Fri, 30 Aug 2024 10:02:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f615171e9esm7432711fa.77.2024.08.30.10.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:02:06 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:02:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 09/21] drm/msm/dpu: add devcoredumps for cwb registers
Message-ID: <ur3mio35j4pgjuykbh4tyqroherz4oh6qnaw2jm4oq5ecj5yic@bhvdr7xtnelb>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-9-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-9-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:30PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Implement instance of snapshot function to dump new registers used
> for cwb
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

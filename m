Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04CA01F60
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 07:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB71B10E593;
	Mon,  6 Jan 2025 06:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HP5Mp4cV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4DE10E593
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 06:50:22 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso190174411fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 22:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736146161; x=1736750961; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Qu8WQXQCtZnShf6h8tAcD5s24D9ELy391aex/eneOc=;
 b=HP5Mp4cVc88qAZKtnEPIl4p63DXCn6FBp8AfO0nlPnNTuLXDKbK5IeHs85pI0ibf31
 tkXsTDHbRdRgioIJI32ek+m6q04Gccu/CUjOgZm19gSb6ihEaVnN3oR2EUBOQPgtK3lf
 SHkSd/t3Q1XUlb1vUySxYB+Q8YTGCloNBIA2o45Y3+S9JDxaQVE0dlwVACcT5iGMeIXC
 6wmfYaM+9qnmhu7c/bN2E2Z1GuyRijl6fVaHIkz2uWdmvtGtA0Tp9EYOoGre7GJQbO3f
 i9GbvXd2gBYg9i2hJh9X9v//QE24qKG8YVZ0HFfwNZg23yj5vfyTO7MyNnv5U6ZtamZO
 zGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736146161; x=1736750961;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Qu8WQXQCtZnShf6h8tAcD5s24D9ELy391aex/eneOc=;
 b=j9i0DILK7bCVrf0qapJBpdXdE/wn9zhw8Gp9JfNOGz0LfqWcrPBvqjZnXIkh1iCe0R
 XSlVelGCwx4mEPkKM9xUCJQJPOKcAmA8kYlZubSW6lJCnQ1rFRyNOaIrjM1nGdPv6ahT
 36bUl7XO6l2wWk/hHrZkVUX29RykNcafIV1/oo5wE5D0zB1qgH1S1ARewb3R3Pv3JTj9
 XUAjFPL+c/srotz3HOJfYO2n9fpgZc504oISSasfl4MZhg3HjifmYh1hZaRWUfwLgkj7
 kNWsFl84CDzE02GIMHqp70cMy8LZ0nD+BQWFjmEF1Fn/Ld1ZRz7+V5vYdGcK0nZa+3SQ
 kBzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwYoYXJ9Q44T/+8i86tOahpDnBr/auhcr9JTUFScluRNOGINjVV1qaVAdGq056YqiY3TANpn0cz30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG7Ao4Y9ebilhlO1DphkfjF/ipN9/xTUCRTft97AAt3HAuE7cV
 wIEnthy95nWH5z43OkTnE71lLuerVSzxsJaHO0p7JysrPTfypWjy7UF81geo6eI=
X-Gm-Gg: ASbGncsy7CYnGX6qapQluHutOpPxlpLklvFo2R/Ysh0CAQYkJOR8lPBWwxrtwnj9bYr
 AGRH542J7IwnRBsrRToQ9HtscVcE26XCV5ss4Ipir1/t9HyhM4gDaLGCWNItcMdUcHdSwbt5S+o
 RoNVKZ6N4rJttLyA7jJ+TRLMxbPgdR43nDFkeNO0LtOKWHhqyGKCg1N1IYqTw7dfGj7AZWLy3UR
 RqEqkSFnGxwKAD0MY/cclAxa7RLFLw0wJzqhSkpBKC/j9s42d6L26FJpSoDYZaCzCqWvovg5Q+G
 iV7IqVuz4dn4U2n/bR1ve4dG1eGEKloJ1KUY
X-Google-Smtp-Source: AGHT+IGHVOrjHEa9YHZQLk1c+OGgL7giB+05TWOpDyNnvuG8TPH/ssBfuMDBwWRFHIFp85M+tdvrWw==
X-Received: by 2002:a05:6512:10d2:b0:53e:39e6:a1c5 with SMTP id
 2adb3069b0e04-54229562a91mr18706777e87.41.1736146160752; 
 Sun, 05 Jan 2025 22:49:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223813670sm4904307e87.152.2025.01.05.22.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 22:49:19 -0800 (PST)
Date: Mon, 6 Jan 2025 08:49:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Li Liu <quic_lliu6@quicinc.com>, Xiangxu Yin <quic_xiangxuy@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add writeback support for SM6150
Message-ID: <w2ybpbn4caps72e6ac45jae3dgmmmhf365ks2sonfmj5uyfvsr@wr5ymif75xbp>
References: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
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

On Mon, Jan 06, 2025 at 02:39:09PM +0800, Fange Zhang wrote:
> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
> 
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
> A followup patch to add writeback configuration for the SM6150 catalog
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

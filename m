Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A02A38BFE
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2010E5B8;
	Mon, 17 Feb 2025 19:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RKeLiqAZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3E510E5B8
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:08:31 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-546237cd3cbso1236333e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819310; x=1740424110; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wdRXWfwJ/W21WH+kqrSD6iNAMN48NhyL/UJXo71GHvM=;
 b=RKeLiqAZWuzTsbCGbjEhWIXOJBR4BA1ccLWHynngMlcO5JI/KeGiKvdk7HPmPeezk3
 dCB9LRFPH5ff78Da+HasM6qQtjLosHOdvM9ggaouLJb/xrya1qOxrjIHGQUQ7j4gk/FN
 KpDMdW5u8o9l2J9jeB7hJlpjGalpjAwViXF9wYSB3XHhMWrD9OYHvs2TGWUmNY42Ke4z
 Hx4oM+hDxHSY2YCmMP3gvYtLp1hMTCqWXyU7uYXU/cmm+Wl8HOX25SFHuBKoELLaawuI
 9VfR9BgitZxsFJ/iaLQssCUngsCciysqRC1lwEmWne4aBSdpHBb+aN+G/o8DcOTHmpCW
 jV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819310; x=1740424110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdRXWfwJ/W21WH+kqrSD6iNAMN48NhyL/UJXo71GHvM=;
 b=A1ybRgio/rCCVAkPUTOveV4pX5qV7Dxgac0pUeGwAYvRd1srDpDn5Oe0++xujRiyg6
 m0ebgNFT/UcGUe9GlaUKkrUhORpnXiTfjcvHCJG/aB3lsnqHTRXQaKxmmX7IsysdCU9K
 tEAl+TTJggyZdrcDUNASUVUoYLKo9Q7YVVyE1TRKSrFKmAu8U/hT3UD72Wc6htw4XthR
 JQU+nXrG2TIUxN3eVUYh51xGr7Vw2vSGCCcZGy2f9Pc92yij77RzVKxa5y4c5MTCXj2Q
 z12jMHIw57idu8lg+Oecyzz+2QIkpIFsrthkSWuZhIx2TdusW395MeruA1HhEh4+9hll
 QIdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe4lr/JzXNuob3anGX33q+fUoUBTZindLeq8dk9b0aPQ58c1kH8a7398TxEYH012C9yl/Nku4EOGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyePbbTqaMrmOkr/MVo9QPdm+f8ntiSWEcWG0N5PkOPPrNPi0sF
 w4GIUWq5GcL4LCc3sMKnJD3xBto+25SVwxIGX7LApwoXgfvetbF7E1O8WxuHQJI=
X-Gm-Gg: ASbGncuNfUqdYsZqIs1ozuMMw+zP914jJjscjnAtIY2xKMDcEHHp5sIo8iBxSuVkgBS
 Y6zaWwPW/JGAAqfjcMrGMMVAzijJACEAfP3+dBWUyefrFRooEXN7BkrTB3omb54N+0DuZe7PUr7
 bMvG3OGck+fM8+wty8a1QK+W4kZG3PJ6lFXCyk+FGEe6keE8EkD5aSqajFOeJ1z9asocisrlkU/
 /Y5aRHhgHbRGdliQ7miymq7CzmlILwdY6appYnTIweuCRYDT3ydHmZc08idQ8LBDtPd6EpqW+Ju
 Dow0VrrXW2YFU3Vv8ZO089P0U9LU3/QwJBJGHSt6TDnDL7vLBsqyvYNxs9dpx516KUXrLGw=
X-Google-Smtp-Source: AGHT+IHamycJDA8JS60gP7tbbymnAwBhYuHbKpt67zrHM+Y3j+U5GzOFbCQPJZF1gEw20AZA/az6qQ==
X-Received: by 2002:a05:6512:2823:b0:545:4cb:b25d with SMTP id
 2adb3069b0e04-5452fe37326mr3178556e87.13.1739819310163; 
 Mon, 17 Feb 2025 11:08:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526dc0461sm1398133e87.246.2025.02.17.11.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:08:28 -0800 (PST)
Date: Mon, 17 Feb 2025 21:08:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 14/16] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
Message-ID: <hnarfrrealmd6uma6ahbnw6v63yqtjw5a4idkp44mu73t6gyfm@4zcb6xkbpwry>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-14-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-14-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:35PM +0100, Krzysztof Kozlowski wrote:
> The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
> newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
> set_active_fetch_pipes() to better match the purpose.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

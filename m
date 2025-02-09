Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40CA2E168
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 00:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D9310E0DA;
	Sun,  9 Feb 2025 23:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qv083Tv5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBE010E0DA
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 23:13:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-545054d78edso1329892e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 09 Feb 2025 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739142827; x=1739747627; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MoxKvhqaqOUsSE3IycBsIlrhzz+TLrVA2orrTjTeuoQ=;
 b=Qv083Tv5zfEeJGyJ7Uo2QmBUTFnuNauUGlPp7KyrVYYxeElF9YUoa2pP39q+auMCmi
 rWrVRi4C/MddMNw/Y+h9RFRZ7YnO0DrsFL//c/6gtZ17sQg72TLSU7Pg18Slm0h3vEw9
 6nx+lOclvLqFIF5swzoprZou4aZsCXbe/FJoCHMOg7yD0QoHMk5blMb+BvPTY5rOsfQQ
 2vaApmcu3lmtsVtmYdeqVjF13e5oHVi6vohTKW234XLXd7cl8jq507AvX/z2yvXq8sOR
 EEfqK8nH09bQb5rhyJtWk03J7uWNraUKVy95U2Og32PcJwXkYt/FD6eAMED5FFNHI6Mh
 DTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739142827; x=1739747627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoxKvhqaqOUsSE3IycBsIlrhzz+TLrVA2orrTjTeuoQ=;
 b=nLO767tqiUrfGez2IAMTqM52MKKpRGZxeIgH3hQW5SG+9POl6h7jwie39LWnxmEXJq
 D5VP0Zfd6tvb2HPDz+aeijaHsn+bKd5IbYi3owFKaJtRzPeeueU6Jo4Rf3/lRwR6OOGa
 xwQExHFi0UUblCUFKF5RZxfrrwpMp9hHc+o0q603QMhMf3abFi3WK3owTz/oj4N4PdE0
 cUP29AUVCGvE+79UQ1ZMWS2M2UxuZegx5x0K6x+duNDYBGJS/kJh4lbojhyjxOStGZsu
 OxxvhBlUh54zoSlXEa97HtkeBV7eJ4OIwLqPrN4CQUCTTFCOi/7CmHwo0gOTVeIUFZ4v
 K5yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5XRMoa3dg7AvNFQRZCiEWOiSiHXppjEp0RxGpu1oLZSEtTrbRPOKH+BTevpe6gt0BJ4YBzYpiv8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwmSyOTX1wTWN/lJnELNnPtnV8bPJ4XyT2Nl/EPHFrLGmeg4aD
 GC/DN2Et30NeeQT6VHJuLythjUMSkyDcekrsHFI2JHxJL66GmsMWt0LihDDKIZS7FAKGh4GZl0x
 XYl4=
X-Gm-Gg: ASbGncvVGYQJ+RcEM8hahYkWJrVOTxFvavY7W0laYFRb/1UMU1TiK5fqrmB8A0YL80r
 tYeY0HxIXzvs+RLq0wYQZ/kaEhh2MuU0kNBx5x2BzqOzFxNgrae2d+hoxFIaGhbTeGCPasyHc8D
 /8PlBYF+Wtk2l9UbDj6PXRshsQDpbJVSMIW9Ski9SWLV29XkNkmTom80W4iQqhZruwbhBuKrG6C
 RohMqOO20NmHvHpSCC0Xp7KLgZxmFq+Gj68Ne3gEpyKTdk6UAQwJGpSEe8sHIi4gUybfcJXuawP
 D0uSGZHxm+Spj+IhUwY3tiCeUITQ9xPv8OfjzekSjdZxOw42S3c+QgAgTTJvRhHimht47HI=
X-Google-Smtp-Source: AGHT+IG6pHxWcPGhnjwnxMZahzJXmycpngbz65UUqKb/X5omPdkl2r/lGWWjV9vy7q55qIJ9j0uJ6A==
X-Received: by 2002:ac2:5f66:0:b0:545:b9a:b4b4 with SMTP id
 2adb3069b0e04-5450b9ab564mr600700e87.52.1739142827370; 
 Sun, 09 Feb 2025 15:13:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450e3e4e72sm25386e87.199.2025.02.09.15.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 15:13:46 -0800 (PST)
Date: Mon, 10 Feb 2025 01:13:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Remove arbitrary limit of 1
 interface in DSC topology
Message-ID: <agibhaftgy26tvlxgvhqmiortwaycblsxs42bebj3n54trozj7@46bqaqlrfn6n>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-3-9a60184fdc36@somainline.org>
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

On Sun, Feb 09, 2025 at 10:42:54PM +0100, Marijn Suijten wrote:
> When DSC is enabled the number of interfaces is forced to be 1, and
> documented that it is a "power-optimal" layout to use two DSC encoders
> together with two Layer Mixers.  However, the same layout (two DSC
> hard-slice encoders with two LMs) is also used when the display is
> fed with data over two instead of one interface (common on 4k@120Hz
> smartphone panels with Dual-DSI).  Solve this by simply removing the
> num_intf = 1 assignment as the count is already calculated by computing
> the number of physical encoders within the virtual encoder.
> 
> Fixes: 7e9cc175b159 ("drm/msm/disp/dpu1: Add support for DSC in topology")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

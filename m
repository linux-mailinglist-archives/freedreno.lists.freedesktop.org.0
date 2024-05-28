Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124268D1120
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2024 02:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A6E510FDA7;
	Tue, 28 May 2024 00:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ocMjjhQN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F8610FDA7
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2024 00:48:30 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5295e488248so346020e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 17:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716857308; x=1717462108; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WqyKqJsE6pp+l2O4SC+W159s+eImxbzOSm8NXJ1OA58=;
 b=ocMjjhQNZMvT3Hs8t9vkfbGGureXe2xFGzfqGptUF9mmT/N10cEiULdQh5VoDn88/v
 h8P2q056BNuFbGmDk8PSIthuGxoniwp2U7rFHCEetVp6bP+c0NhVCE2okT9gnED168yO
 0IsQ1z3TzyUAbneSkKx85HRmQQeUlkCV5r0QcvJ3T0De0K9WIwxBNdvPXy9/izTMCfuN
 tbZwIYOC+WUoiB8KRCp3QpdIAzA5uksqVS3+6aeUBUctc41GkWVjukB1rV90IINjPY7L
 W8EWcdPI17jfdaLqsy2SMCBk1PO5Xvcm1uX2kmJFJDEUlbtWtr6wMqbx70GXCdUBQHWS
 gIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716857308; x=1717462108;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqyKqJsE6pp+l2O4SC+W159s+eImxbzOSm8NXJ1OA58=;
 b=kgO6Ze36KAOePBAJlPobmT8HTXaDy+CD0NaZBUaj5WXkkoP/Wu0r1CkmaIUBiEDzdy
 6tE/W+RCA3TwHf3YsX8ojTRbk56VO8chuLSLWlFEmLpaF6Wx1mIkOnmKae0koT4fj+O9
 WDeGIWOv+E9S5qLIGrKj3Ce1yqKAUttQ94VLnSyL3RZfpRya+DkDBc9MgxtMYC4aB3Re
 UPE20fqQZcHKdfJiqAxD4MfW5elQQhF1OGE6Ys6iW6TH52++ZLMbvlam21kYrRPGmdav
 vykn5jklQUPuI0sBWg5SMA2m07EscgKRD1h5KKV4tEHBOnofMbV9clH53LYWYs8DsWH+
 tRrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+esvNNOTszabUU7fT7jjVOuSBDgzg+kfMDvPhhxE+gMsc01dE+lZSxu04vVYRxRQtxIKbKdt4Gls1BwhLgOmi1MwsdUG5UYKuGcVvWD2x
X-Gm-Message-State: AOJu0Yz0kRH2lx3b1EvtNgcDFQeQ0J3Uhdh6/w92UnTaJ8AJfZHyjZxi
 p8atiqw7+7uno8xf2l+2Gaq6/7l0yTwdZFH2HTcUKyRh6jo8E3CzhLTHCRHThhU=
X-Google-Smtp-Source: AGHT+IEkY3dLBPQpnDZeVlJ5g4IQ99DKVk9uniY+rjpvwvxmpQU+WYyWo8C0Uczxxy+AfmQzepE2XA==
X-Received: by 2002:a19:6912:0:b0:51d:998e:e0c1 with SMTP id
 2adb3069b0e04-5296410ad52mr7332337e87.13.1716857308562; 
 Mon, 27 May 2024 17:48:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm816295e87.67.2024.05.27.17.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 17:48:28 -0700 (PDT)
Date: Tue, 28 May 2024 03:48:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
Message-ID: <zdlreka3shviepb3p7cq4ulv7f6e2lz7b4af3pdqntnbqikmhq@uoiyu473v5e5>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
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

On Mon, May 27, 2024 at 10:21:49PM +0800, Jun Nie wrote:
> Enable compression bit in cfg2 register for DSC in the DSI case
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

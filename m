Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C763C8A8FA0
	for <lists+freedreno@lfdr.de>; Thu, 18 Apr 2024 01:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301D10F959;
	Wed, 17 Apr 2024 23:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xXIazPOb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905B110F989
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 23:44:26 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-516d756eb74so249002e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 16:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713397464; x=1714002264; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MgjvMPd11QKFNd88E1N26rp+tffDbeQ3uZCnSiUqKR0=;
 b=xXIazPObqISZBFaLQT5FpfXp2YEGY3YsbufiffHvVa/dEvwBPZ2XjSi/vffFBRRJcO
 AzISQSkgescokHrPkCCYufG1jTaYBvYYXiAxnF9YtAHde06CBCZgzP4UnVfSCea3jNje
 RRZgSixd7pGf6rVZe4OzxrY1WDtLv7OAmTAdJvmZcqYFn2+U79nFtGYiPqsyOwREAFhd
 t0C0HMYuHAnBf2xdS/tzCWU7nchNxBu8EkKe4Uui2weYvCsvnxnxTTcQcMFennZ9pu2P
 A9hv7upvX+HBTVLJPTqka7qG9HwLWgZPl4Muq1ahJdvA9gAt8iNNsWDyUpo+zHK2VSuG
 RNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713397464; x=1714002264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgjvMPd11QKFNd88E1N26rp+tffDbeQ3uZCnSiUqKR0=;
 b=NqpA8RkinUBkBtcphlp8j7ItrRPuDXyvFdrpX/e5D9cVsj5ohvLABZocIZ/tQ4c4xm
 OcS2Orbn1LDbcZnXAd4i1kn0aASg22dPCev+xfcXn7RAKcI3VQg2VmglWnAIGWEt7ybY
 vZW0HAHzLmlSgunUJAmjhIWi3F8tI/T83AVuP3ULRYozX7ZS/k7s1zvtAeYLXPQFf7wf
 d8wQpZoKIMOun72+GcMB9wFFQjnTt1DkLw9JyBkuUn/LG/FwnYhCJaL6kAUTjg81+Qr/
 akr7UjNVy6YRNjXDCxZ+0WYXdFlDrRqTTX/HLV+P5+o6YdWZJwo3Ice12BWZq6WAtwne
 T5GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/X6/Sy6+kg1SwHzf1fbTlYakB79eRlxyNzjZWIOuCoBPEF2cD+KsGAUdR0oRLy7FWs7ppQTUtCqxhRULnTmIJ4KCr9pipzmK5Z0sgdXz6
X-Gm-Message-State: AOJu0YwNpyMAYPz6GQea+iexUF1vI6G7G+ggWEDSbGZMh6I4wcWyAHkP
 GE6m23DJQzQZWbLRRqWHcHMYt4w7oH5e582VPTpTgZT+bqL828W4wQX3AS94u+M=
X-Google-Smtp-Source: AGHT+IE8QqXZo1zRChGmPJCaEjk6MKC6Yazzz1JhVm+k0MzRJJYbY0hPM0PvHSQBF3FoHVjciaXnXw==
X-Received: by 2002:ac2:5395:0:b0:518:9da1:7afd with SMTP id
 g21-20020ac25395000000b005189da17afdmr386771lfh.4.1713397464535; 
 Wed, 17 Apr 2024 16:44:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 z5-20020ac25de5000000b005192a02c638sm36366lfq.132.2024.04.17.16.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 16:44:24 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:44:22 +0300
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
Subject: Re: [PATCH v2 5/7] drm/msm/adreno: Define A530 speed bins explicitly
Message-ID: <4m53lev4flu5x7tmw3ygmyvfx6ls5zzmadrzuncbjcnvadoays@b3es63of6ujs>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>
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

On Wed, Apr 17, 2024 at 10:02:57PM +0200, Konrad Dybcio wrote:
> In preparation for commonizing the speedbin handling code.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

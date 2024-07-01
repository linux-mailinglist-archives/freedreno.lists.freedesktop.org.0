Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9591E8E4
	for <lists+freedreno@lfdr.de>; Mon,  1 Jul 2024 21:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DF110E038;
	Mon,  1 Jul 2024 19:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PexCzjVJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B4D10E04D
 for <freedreno@lists.freedesktop.org>; Mon,  1 Jul 2024 19:52:15 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so5070948e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 01 Jul 2024 12:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719863534; x=1720468334; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HRHUkoGwpjNf6W9qmppc9hQKHNt+zygF+l53pGcNu58=;
 b=PexCzjVJcehhs5XWNB6d8TdgUAmkFfdYKFbHmTYdvXKbAcJVKv5d644MUG8lP/7s2G
 DmQHCFSPJcB1QkrJH54JQkgaEpiLHm1B+q3su7aebCwWzGfjtvCs0nKmTJ1eEN4yDPah
 ssVCHTL4WNawrpbuilk0XY/wiKmRz/ZBWqJcLVMWrrsfIsynHBsr8/9b8OPp7BDCTBWW
 vYXFqEsKGuEgFBrTJQuxa65LLrIQoxYBoR3nw5owuOPrupc5jlEjlHn7R8DYv1dZ8XLL
 baSYfXVvh0GszQ88L4kur8Fv0OYhULF301AeuHQXDo2AfNBmnC8gDR8r4T8S13kdGDmv
 10Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719863534; x=1720468334;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HRHUkoGwpjNf6W9qmppc9hQKHNt+zygF+l53pGcNu58=;
 b=ZzreGiSLWGSLYBJJ74IwsTKN/fhnjb6YUfZJePzqbckWP24/TGmetUSsj6YQqMWJ7s
 d86+LP4tKvoK6T1NNOawck2mqbWOIGXyxA0JnNa3z2hREea2JgPCvZ1/pV/h9pNtqvqe
 JFsh3trK+8xNg64hyms5+ugv7SMjj3lXgfJXfRZiaFxRi7bNVw9G5ozrIa2W2xIXcg/i
 JSdSkifL0CIBap/+VJzLewKS1ZvV9K6SW2lHv+jnZMs+tZUM8HD+xzrPDxh0sx0VSZJ9
 KNkBVKARBFNOEwI9DuKVxyOszLPcy55B0zUnAOP7JQ77C2SKdDIlRuEZnBpoMB3LMJ66
 R5Cg==
X-Gm-Message-State: AOJu0YwnNAD/25i7C0paHw/bJsvpBufxUU+8nni2TMQqZaYiWEZcbWgd
 SngEuqFlVnJmNZtiKBe6GTqqqKCxWkSl4ApDCngpBKnbYlEbcpbVhM9UeyMqNeWIYGF0Y8/7Ch5
 0a/crig==
X-Google-Smtp-Source: AGHT+IGpZG78DLYt7UtXr9ZQfMpLzTwgkoAHEXhLyaBaZvfF5SxznHfPGIkjInmqLnX5xJ/9v+HutA==
X-Received: by 2002:a05:6512:2397:b0:52c:dfe1:44ea with SMTP id
 2adb3069b0e04-52e82643c41mr5319588e87.6.1719863533890; 
 Mon, 01 Jul 2024 12:52:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab2ea60sm1522272e87.218.2024.07.01.12.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:52:13 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:52:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for
 msm_kms
Message-ID: <b4kskldnis3m724kq6kpvqx4pnnjditxwy2jiiivkieqt25o6w@aj6ybxbvwq3t>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
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

On Fri, Jun 28, 2024 at 02:48:45PM GMT, Abhinav Kumar wrote:
> Introduce a new API msm_iommu_disp_new() for display use-cases.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_mmu.h   |  1 +
>  2 files changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

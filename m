Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C9928509
	for <lists+freedreno@lfdr.de>; Fri,  5 Jul 2024 11:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277A910E853;
	Fri,  5 Jul 2024 09:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LQ18Rwsk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F309810E85A
 for <freedreno@lists.freedesktop.org>; Fri,  5 Jul 2024 09:23:30 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-65240d22f7cso12659567b3.0
 for <freedreno@lists.freedesktop.org>; Fri, 05 Jul 2024 02:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720171410; x=1720776210; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jr/YbKd+JqEfpNYq/fLhY7F5uZ9Pe+/fH5hoiOxaK38=;
 b=LQ18Rwskyf8rIKo5ofQ3YQy7Qxi/2r5e4nP/CYU23+qbWr7AQJGYkWMRN7V624hZpG
 zVvpHEKAdufkloQkI6pFQ7zi7GETvJ3PWkpZiANQq4cTUBnJry50VUNwq691pL+mnIaS
 ilZX3CRSLFD80tbZi+AthoRjJmpRfI7IgSVx1qPHH1+jZYgUnuwlSxEJ2mte+rOgQRC+
 DZhiqZSiQsv07jzUSAtLh1tT7QMQ6VL2zTUqQRr7WohYCxCVY4ZP+o/S4RyuOM+WSuKe
 jSOxErnhkwqQ13ObWKeAWXVo2ihvuuhTW5x/01OUMpv8Gm0litsvniqyn+CBIUTp6i9p
 OHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720171410; x=1720776210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jr/YbKd+JqEfpNYq/fLhY7F5uZ9Pe+/fH5hoiOxaK38=;
 b=iWGXs9ymMWMwyqpgWVPbUPXGeDh0RGIRaP/heek+GucbTZxSw+PqnSAXwFnOV53WJ0
 hWzgkHdb8uiL9kryd9cyA2E4s1iL84sh9HYRHj3midVxzSoFDskY+DPpJylc+cpcRaN3
 UaWJMSwMVXfPIFlyt3RsTfjvcp6Vyr2kBamM+/JHjEXCrjcJvOb9PNhFAu1T5R8Pu9zi
 Pv9Cmjxj+u6DBNttarI43Q2pxPUxR5ZUiyumrEa2ma+xE8AwFexa1mux+eDc6l1HUaWS
 rKrfVh2jyCqk483AfC3eER9QlDpsr08t5yHFN6K1eiYdPGtetLuUpZAIQjBFg/ASREp8
 uOLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLt+zj2VOtNla6VrSclVFiWJhEsV9nwmvjciXbzvUfvaxHTB4JektRZSGC2Z5JCVZON/xuRMnj0dDyO5SHHt3eiEliz2qUUgKY3gh6UlM7
X-Gm-Message-State: AOJu0YzWVrexcwjh8xm8jPWw6hSZswX4+hcGpWYaLGSj5GM6yEgAWxlW
 9ysiNVjAAlophCvkIJsQM19S6B6+8svK4ER4jibTxqiCtkOpal8+Jz44xaYtvMddphuWs4GcgOo
 q6X5Yq93ko2n2AExSIluYqE++T6BfqoC9dpuMfQ==
X-Google-Smtp-Source: AGHT+IFdbNU4G1KM5yKg/MD/UwoLXL7Pbn3ZaZq/bO3zaxMuYCSMp5qT9ATgxj2sjU0+WAadmGYWZGC5dv3nUOiV1F0=
X-Received: by 2002:a05:690c:700c:b0:62f:37c9:77bc with SMTP id
 00721157ae682-652d2ddeff1mr47325217b3.0.1720171409891; Fri, 05 Jul 2024
 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240704093002.15155-1-amishin@t-argos.ru>
 <20240705091312.9705-1-amishin@t-argos.ru>
In-Reply-To: <20240705091312.9705-1-amishin@t-argos.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Jul 2024 12:23:18 +0300
Message-ID: <CAA8EJppkdgj79v6s==egUOm1omJwsSUV-iduJm6PjJkvr6iyYA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: Fix incorrect file name output in
 adreno_request_fw()
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 5 Jul 2024 at 12:15, Aleksandr Mishin <amishin@t-argos.ru> wrote:
>
> In adreno_request_fw() when debugging information is printed to the log
> after firmware load, an incorrect filename is printed. 'newname' is used
> instead of 'fwname', so prefix "qcom/" is being added to filename.
> Looks like "copy-paste" mistake.
>
> Fix this mistake by replacing 'newname' with 'fwname'.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 2c41ef1b6f7d ("drm/msm/adreno: deal with linux-firmware fw paths")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
> v1->v2: Fix incorrect 'Fixes' tag
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

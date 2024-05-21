Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D928CA73E
	for <lists+freedreno@lfdr.de>; Tue, 21 May 2024 06:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A72010EABF;
	Tue, 21 May 2024 04:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TRd1x4eW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BAF10E91B
 for <freedreno@lists.freedesktop.org>; Tue, 21 May 2024 04:12:41 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-792bc48f6beso257637485a.2
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 21:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716264760; x=1716869560;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=HDK8WDfUBYYirSWO06T0TVOheARrNR/0B8M0BZ3uAqU=;
 b=TRd1x4eWomRJaCeMM8IoOVndkRo7qMx6TCHIulmoBpNywikLyD8d1IHkL++SV1sBxQ
 qJPStbmpdvb/GyJ2zcH3YNT5O4Pq7K+6IgLYT+fG+En5g98Qc1wBmeOKSaDSYA8loEmS
 bZwdRRXlN8f6RyvttoosELal4EZ1nKxIAhiIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716264760; x=1716869560;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDK8WDfUBYYirSWO06T0TVOheARrNR/0B8M0BZ3uAqU=;
 b=iUNt3wZ8VF9cKyk8mKNgIj8F3WOIWgoqfzQUP+JavD3vXXun6XRUBfN5K4tCO98gc7
 zjtVlDTE3nXmt2zjqRHDQsCoT3WI+pCzr1i8i1mchxCSO9lqoOVCqpdjBTJ3bGD6COME
 x1z1auaeGQfnGN1XtZd4jzTe3dE5GTICOCBgaB7hC9YWUX6uJJZ7rXneeT5BgFZ320zE
 ixFDgGUlGzrmILK4mFegDld2yNZa8ipoK9mD8+csQl59jQOSeElCEUuCPhFiHYTrP1J8
 Gz9n2gnB9hmLxPyC8jRJ+0LCVUL1XdLHOX7HUL52URNpZkGmehfvNNsdZlRVQaNCVOHM
 Z6Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpqPwKtw46TUElFyzlICHcI5hDA/pHGjte1gGJbkuNaMvGsAwylNSzHGufwbdfltCeV7ufiRtR7LyG5o94KKtpXYvfIOAi15TaeieOIJWB
X-Gm-Message-State: AOJu0YwNehuYyPHkR4dtpeN9/Dxrs46Vf/YNbHcWikGt6wX+VjggHE6S
 yAM7JS8HEfTXFeFG96Yenqqi1ia4iUvwJdU1WJodz1kO20aetmlR8a9iKFXoz50qy9Ct93qx0EV
 oP5QQwb4TMJAT5mqVq2/ZBv2eMk40xxezCAzs
X-Google-Smtp-Source: AGHT+IH+wekBZ0lrLtGQB1o7O9rCbCkIv21Dk0Sq8vPde6mos/k0ulEy29KCnMHFyBn7FO/k9cX+aqOaPP9RXBhho0Q=
X-Received: by 2002:a05:620a:280e:b0:793:b91:2dbe with SMTP id
 af79cd13be357-7930b912e08mr1615135785a.40.1716264760099; Mon, 20 May 2024
 21:12:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 May 2024 00:12:39 -0400
MIME-Version: 1.0
In-Reply-To: <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 21 May 2024 00:12:39 -0400
Message-ID: <CAE-0n517DSbNim+K3=N2J2R0iZn44MS3siLKkhdLq05GTfaHtQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display mmu
 faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
 dianders@chromium.org, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Abhinav Kumar (2024-05-17 16:37:56)
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index af6a6fcb1173..62c8e6163e81 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>         return aspace;
>  }
>
> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
> +{
> +       struct msm_kms *kms = arg;
> +       struct msm_disp_state *state;
> +       int ret;
> +
> +       ret = mutex_lock_interruptible(&kms->dump_mutex);

From past experience I've seen the smmu fault handler called in hardirq
context, so it can't sleep. Is there some way to grab the register
contents without sleeping? Otherwise this will have to fork off
somewhere else that can take locks, runtime PM resume, etc.

> +       if (ret)
> +               return ret;
> +
> +       state = msm_disp_snapshot_state_sync(kms);
> +
> +       mutex_unlock(&kms->dump_mutex);
> +

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4CA7945F4
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6A10E02C;
	Wed,  6 Sep 2023 22:05:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A04410E02C
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:05:46 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-500a398cda5so462811e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694037945; x=1694642745;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=jXhej4cvrOszHeClcSERUsV6+B3yIbtViW4bGC1f9ds=;
 b=ISRG8neWFm3XQ0B6K4r5cadnXlsQf7T4nUD4y8DDtjbOyTkgZq/n4GsHijDX+cd/qW
 T3ZgtjvmXby6cqvOoemjLIpMu7DCMgfFvEeYhOKmocicR20auXO+UG/DcqWmzKt+eKE7
 VQ6zttmPRaEtVqM90ourAmPlMmiyfaqVzAH+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694037945; x=1694642745;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXhej4cvrOszHeClcSERUsV6+B3yIbtViW4bGC1f9ds=;
 b=LaiiUnsQhiIylbUpPT7fcNLMsC7e1efKvKUaVSxU9ncVD4rZqqQ7GVdvChSbjexCeZ
 xugvqo5pfjcu3csLwbTr8iHSVfSixg1lAISW8exD1O2PmxJsVvduoG5h2UpVN16QWPzK
 5X4bS8eK8x6VFZVbpRtPl+/OvbT0MkKzXaThWlTijlqmdzqkM2gPlSm2zsi/oXYdWrPy
 DiNkjQkfnLwouKDx07e4q1vtLfjTGWQ4e9ALgCg0WhAZ+V76lcXj700EwR2gA5qInoA5
 2NbX0HPqrrwvlS7v7JD4y6DSbl8nGX0p+Ie+SQDosZpYlW8UaPGRrfg/i6XAxzDmSAtP
 iWZw==
X-Gm-Message-State: AOJu0Yx5HVAOSXQzSsHBLT2rSTWTxQJeC9N0pA435+xxMrD9lFzhq6rJ
 rkiyWugsUNe20QP2eEBREe6e5T57ujXjV/3QSJAGmw==
X-Google-Smtp-Source: AGHT+IEhMKwojT+m2voBXcESzDghYyCXzNWBGzfOl9tKYEOWjtKcMUgC2QaGAu0qmCAUiXjB5mhREyuiJwX/wmv3Nzg=
X-Received: by 2002:a19:4f52:0:b0:500:9d4a:89ff with SMTP id
 a18-20020a194f52000000b005009d4a89ffmr3220273lfk.62.1694037944892; Wed, 06
 Sep 2023 15:05:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:05:44 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:05:44 -0500
Message-ID: <CAE-0n50859GHEpOjtk+1ukYxgoumKiOyT3kwGJ6K8CDd9FbADw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/8] drm/msm/dpu: enable INTF TE
 operations only when supported by HW
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 19:04:51)
> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
> only INTF_1 and INTF_2 actually support tearing control (both are
> INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
> those two INTF instances, check for the major && INTF type.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

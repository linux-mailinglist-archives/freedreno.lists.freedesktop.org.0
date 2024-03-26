Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46EF88CAEB
	for <lists+freedreno@lfdr.de>; Tue, 26 Mar 2024 18:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DDC10F16C;
	Tue, 26 Mar 2024 17:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="leL6xffx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8FC10F16C
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 17:31:45 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso5655584276.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Mar 2024 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711474304; x=1712079104; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9zt/phGBfZSdp8qy9N6Gw8zdXEBb0+nioLRknU84U6I=;
 b=leL6xffxc47ndK17J0r69UV9d6fbDFFmmm0xo4Z9rS0abwvJUG/zg7fR05isYTOp7j
 ZkVhQhHCQLNTY7TlBMzWuI8GcJ1IedT86dCM8QKroEqUqQZpIqCx+7PERfDdZl6nCI0Q
 lfwYkCmf75RlAizy4fT+NpuQnPB2Z0X83QAVgGEpRyd1OZHIf9NhJ6NVlIarWHz9S15U
 rX1aFa3kFILdIyTS6oqX/jXGjGnsWyYQapcQgfyBLdjMa5PdGWCs8fuAQ+qy6/phhSpE
 Gm4+x0cIdeQ+pLTfIpxFemKK1eVyYtNfxMH6jkLx1LiGD+isU8pG+pZRqjdq4JH2bDWQ
 ttMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711474304; x=1712079104;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zt/phGBfZSdp8qy9N6Gw8zdXEBb0+nioLRknU84U6I=;
 b=to9nMVHnAOT1ujIBu3k32myCHcHTqX6sOQFJeUQrv5D3H/UVsnCvgzoZLMA2oFjXLB
 JelpluFkm7frNchwaEpfsShkBg4SUhErIXokQ70WCkesWB0zGk6MLmIiacAA/5f79Jla
 8u2UxSoqajWaS9Ia7hQcRBuVBBbtJKVrF+/O5eju2obMHOf7GFxvHzkM3W9T87PGobbE
 eJJ+U91aFKZqxceN16b+XC0kELBgMpt2bysg5wXne7LRhGhD8w/4TCNquK/TG5wzVR6l
 Zx2aemIcvDZKDGAZZtvnTrdq4A+zuQQfUS6rvQWhSgFtCYI7gJ32xRIL3DEMwF2y6Cp4
 jb8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGbSVy7tFvbRm2eteJVvu4PQIUvY7AGspz0BDliN7VfedqxsKOLDpZLBruNUQ9QhldenSkXvP2ay0gF4AVQH/+OZnWokpkyhU8UKc/DmjU
X-Gm-Message-State: AOJu0YyYP/EDglYgxCVYiT3DKFK7jkt+kxlGRfoDtkte8UKN8BJoJm6j
 WYan+G7TJvf3P9hMd9DdNyPg6L/pGnpkSapUCzw37FvInXoapUc5QogOXNrufZUPcwVLurCBWeX
 DN+0GimoE2p9Uzg62VYlOIMao7qYw8vIsHQFS0g==
X-Google-Smtp-Source: AGHT+IHKvErihvCqyYvqxnaKemrvy7TNx3gwuqYnQoUJPA6s9U6270M569opHM8owaC5W9WEJhp8lM+R6e3WArVuFyo=
X-Received: by 2002:a25:db10:0:b0:dcb:be59:25e1 with SMTP id
 g16-20020a25db10000000b00dcbbe5925e1mr291813ybf.30.1711474304335; Tue, 26 Mar
 2024 10:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
 <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-4-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:31:33 +0200
Message-ID: <CAA8EJpoJQ+K6S7PbeWt740WhaMRWbNmu2LXz1Js+x8HgzuH24A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/dp: Use function arguments for aux writes
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> The dp_aux write operations takes the data to be operated on through a
> member of struct dp_catalog, rather than as an argument to the function.
>
> No state is maintained other than across the calling of the functions,
> so replace this member with a function argument.

Definitely yes, thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 9 +++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 8 ++++----
>  drivers/gpu/drm/msm/dp/dp_catalog.h | 5 ++---
>  3 files changed, 9 insertions(+), 13 deletions(-)

-- 
With best wishes
Dmitry

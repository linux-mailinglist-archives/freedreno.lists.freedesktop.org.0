Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 085B478E3F0
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 02:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27F410E63B;
	Thu, 31 Aug 2023 00:27:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0927210E63B
 for <freedreno@lists.freedesktop.org>; Thu, 31 Aug 2023 00:27:20 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d7b91422da8so101733276.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693441639; x=1694046439; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6XFUVRQ182BzKxaOieUisigxEXwKIxFTn7N8wbJlC7c=;
 b=ZWvhJunR8bUShFQZx5RV8K2if3pwXJJDewMvca3xAuPAAsJG6zauh4xl1JEzF+Ngo5
 Pk1deyaoIXECS4jZROM36vEUion4kccMzyrMx3RyJK8fwSbMms1wLZE2jteEtE4FsF2l
 wILxPhLcEQUPk7izjBRdgWkJSp2kA9PL/y0OcVFb228oAeSg/EAM8YRvIyJpMZsYqTHO
 nDJQhTb+FviPl+M3bjfxx/SmwJfvgKkL0/YLQUTW4ljQw85i2NewklGaeKnVkdhwIc0Z
 VhgYt8SBJmPoanzYx03vN2k6h+8zXH3EBCnLZrZ8Cnocur0pyCFcHDy9q0rXu9VcXdQ/
 qT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693441639; x=1694046439;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6XFUVRQ182BzKxaOieUisigxEXwKIxFTn7N8wbJlC7c=;
 b=bjZtBefmZMimNB1kcaIN+izhKQVSvAfcb3bUZ8S4tHjpQZBmTivWaAVJygFTnQlSZL
 foMIdAjXd5rI9HJsjIVyivmyrQtlT5xCXf/psQr7MYLoRnd63y56CN9ewgcu/aKSyJSO
 etTnzrCO2enlXF3qi5pjKrZBIezh5/fc/dykX5EHvEy4MsfMdGJ7Dy+5DBHVdCzjFMuK
 5HT3+4qbcgCGwFPjOdW2WjK/8zxQ9n0tJn/+BmKRYLCrbvrSBhPpg/U/GcgkhsEjBPYw
 s/EzNO01Z+ka6HSZHI3GLnFRy3QVLKqj0pERB5zRvG/gawuNgE7ndtCWRElklZCEj3wU
 yqhw==
X-Gm-Message-State: AOJu0YzyANw6TZ3Bcm2CKp+92Zcz9FFLC3h3y9gxW+KngvlkCqStzA2f
 scIsycJvbcXUbE1kRKFWUO+JYYcz8fkdt8uIyYZs+A==
X-Google-Smtp-Source: AGHT+IHknU6BC0qcHumWwJIB4jFHAfeTNSsm6jtFd9ikSrfRePOl4XXsKx1ygwxm0Sd1L8EI6HuBz53qqJL+YdpvGZ8=
X-Received: by 2002:a25:e7d1:0:b0:bcb:9b43:5a89 with SMTP id
 e200-20020a25e7d1000000b00bcb9b435a89mr3433973ybh.61.1693441639229; Wed, 30
 Aug 2023 17:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-17-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-17-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:27:08 +0300
Message-ID: <CAA8EJpqwzbBA6HPfW_ruAUxAv88AZwS4hSuCU47qydM8H+Qsyg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 16/16] drm/msm/dpu: add cdm blocks to dpu
 snapshot
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Now that CDM block support has been added to DPU lets also add its
> entry to the DPU snapshot to help debugging.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)


-- 
With best wishes
Dmitry

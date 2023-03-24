Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D776C880D
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 23:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2D610ECB4;
	Fri, 24 Mar 2023 22:06:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308A710ECB4
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 22:06:34 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id p203so3958410ybb.13
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679695593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AW96lDx5vwowhGiHzDVKGLsiV7fUhA67Ww+wttjBEwU=;
 b=kpJyuBzmaRYbioRqb5vGqry2GHgycmPyUnnxvdAANb2s+I5+UckR9viLl/8kUnwtsf
 Q7+LDDM69Vu2oFwkJGdq0pk81UJndycZyxuRQhPnR7WIn7TI116XPFHuAu6wWLccOc8o
 2sBeL91RE2283BvpWqZ1lLdl5THJKMNCJ+BTayM2nZ2dJsHu0EO7S7GQgtCqrYSJvdwW
 UU7aT8YPVkRLG1i0zyfT4IEd5slRhq8VTdfFrM8OfTioFMwOV0gD8IBlT0YtUSuoNtQu
 539xnoMEbH6SAZf8TaExkU7HmF+MVxlf2Ed51omRr2X6PZWYSIxHlxDf25bEFwSFH7oV
 //iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679695593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AW96lDx5vwowhGiHzDVKGLsiV7fUhA67Ww+wttjBEwU=;
 b=Un5iwM2kCoUyZKvvgcQtk45G1Fo3j4yRZu9xJeMsjPEaW77+d6qv1+LwDnqGX+v4le
 WOBjZ0lobUFDXfkdU99eylI4g4oA1/wCz7jDNDAf32Zt7Mc7Wom5J5IVt6AsYAy8/pOL
 /vfE+oFFikX18X1VwvRmPVqqg7VOwjNtPrzrEZZNn5EXqTlfEo06r/UZcOiMh8XFaaCc
 5NGDXfzhfpU6K819VBOnqdoWsMUQQxIETh5QZOA9QzCdjuAhXXIVxz0fPrHK52fTzSb8
 /Fity1mozLSMcpR4rjZqlP7xtOENpIlfHIjoJxh7OeQLuwF9ekVTJceLKAjdkmQisivG
 uUjQ==
X-Gm-Message-State: AAQBX9da3ahogWtRaL+KpJBPxTvTdjZ/ZzfYnUsbNfQum+6cpPdbZyKn
 xH98fDlKDdp9bw7LsFSMJ3eBBBOFtmwACH4tgtsQfw==
X-Google-Smtp-Source: AKy350b22KWd/52YQxPAH9uA2YhVFFyLDy325ozIEZ34++SQJC7q83qVmJTG2A31rDN5OZEc70zCmWabGGvncpkmyxQ=
X-Received: by 2002:a05:6902:1501:b0:b4c:9333:2a2 with SMTP id
 q1-20020a056902150100b00b4c933302a2mr1857678ybu.9.1679695593310; Fri, 24 Mar
 2023 15:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-7-johan+linaro@kernel.org>
In-Reply-To: <20230306100722.28485-7-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Mar 2023 00:06:21 +0200
Message-ID: <CAA8EJpoMKRY_w1eM6XVx6R3+2Mi3y=AbbvXQcFF-ccTfV_j2AQ@mail.gmail.com>
To: Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 06/10] drm/msm: fix vram leak on bind errors
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
Cc: freedreno@lists.freedesktop.org, Craig Tatlor <ctatlor97@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, stable@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 6 Mar 2023 at 12:09, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Make sure to release the VRAM buffer also in a case a subcomponent fails
> to bind.
>
> Fixes: d863f0c7b536 ("drm/msm: Call msm_init_vram before binding the gpu")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Craig Tatlor <ctatlor97@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

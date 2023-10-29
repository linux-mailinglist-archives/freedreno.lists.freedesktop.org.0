Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B134B7DAD42
	for <lists+freedreno@lfdr.de>; Sun, 29 Oct 2023 17:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1592F10E0C9;
	Sun, 29 Oct 2023 16:40:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E424B10E0C9
 for <freedreno@lists.freedesktop.org>; Sun, 29 Oct 2023 16:40:18 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35743e88193so14308975ab.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Oct 2023 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698597618; x=1699202418; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9bWPCuhLl7Eu2Wz5OYZ1UnKjf97K54GCVXL6Pmup34=;
 b=RR6dBUuk0LebFOr5gguga2lAgeeQSf4Mq14xYCGWMAUC8yRnDx5jKzVex9VTjjLbCM
 fsp4awnt/PWuxHZZxfimULq66TMVB7ODqDiDGTc6qjfdCXm9nJreEvleFkgOdfCvjOI8
 ez0DD6OuMbs6f0ZYBSuriM+U3wYaVPb6mqCkvQBq1GSrb6UkmQjysvKrtd9D+CW6/8xg
 FSR+C40JC6pVOokw22Fl6fk26RVs1CnSPYAI2Cg18K4kWy0q5Z6DdMqbtB6ZFV4KEurd
 CMVCdZY5To8Q1RMcllyh8G9crnLtcDTHu+k8Yrbj3pltjRMx4zGr2DYhA5x37dnsu6YD
 +GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698597618; x=1699202418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9bWPCuhLl7Eu2Wz5OYZ1UnKjf97K54GCVXL6Pmup34=;
 b=nlni7LIXIu1BHy0DmxzaAGjLkjXT3cva7xde7CVpuEgADMmuGoyeLPBoMpAMYhMbCz
 Ob/8fvzf0GXll8BL1sLg3vr7f+JAjIEnRl8auQUaqrF6LDiFHQWMNqMPAG6nquqUKbiZ
 a6Q2E3HvaCU21WjoIiGOg3mQgH+HgZfDV3sJJtHEvltk68yK5A4EC5Z/9Kjw8SveqhY7
 qNdHnJnEwy9tkFW3VTS5rZudxSw7uB5zZu4H22jDeULrc7H58vtCAmCx2yqDezQbXPtj
 6IFtwzJMBle1RLZKCyd1b0tgC5os0jO0Z4uN/4SYJKwmxxkQXKkuTPgGs/DASVPCQdRI
 0MfA==
X-Gm-Message-State: AOJu0Yw7KRj3akEj4yf1j0j6MgZxxiQztjgHZRLBt435WA/pR1oaWA+z
 t2/ssi9X7+X97543LR3s7kz4FrfrnA+pyu08qgjkuw==
X-Google-Smtp-Source: AGHT+IEMTTkd3iokIkHgwuWImh0kMLQCmV4IUjrrsJzeTsT2AK9xdWYaJqUNFO6i6aN3ig0Ep5iZuNbQcrZQnQdocIc=
X-Received: by 2002:a92:c266:0:b0:357:5db1:9170 with SMTP id
 h6-20020a92c266000000b003575db19170mr10291105ild.28.1698597617965; Sun, 29
 Oct 2023 09:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194537.408922-1-robdclark@gmail.com>
 <20231029150740.6434-2-robdclark@gmail.com>
In-Reply-To: <20231029150740.6434-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 29 Oct 2023 18:40:10 +0200
Message-ID: <CAA8EJpqK6uGDrjzhSq7zhGtcqsT7G3LEAj7cZKUex15E4uTK+Q@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm: Small uabi fixes
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 29 Oct 2023 at 17:07, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Correct the minor version exposed and error return value for
> MSM_INFO_GET_NAME.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry

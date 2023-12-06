Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B150B806A79
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 10:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9561010E69A;
	Wed,  6 Dec 2023 09:12:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CE810E6C1
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 09:12:47 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-db549f869a3so5262196276.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 01:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701853966; x=1702458766; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ff5+UzJ+HzQvyI9Kv5LqVNtPJDYPRZAn3y8IpX5aL58=;
 b=rJajSRrWz5LSZ7op188dBFWUY6nL1CBlEbMrpZr9T5nqoj9b9fyq2QmCKd3cMngo64
 OKLXa6d4g86qvRKz8MeOFtKyy9XW+rcJ4F4Htu2zQ7n2Sg6XsGy2+/QEBkSmOirvohx9
 t5yo94R8IyGd0gUHXm4aKzAGvvdqXqeSyJpvgqCGdEaOUsWf0BSG2fYVQUPM5xGVrGWA
 qPdW/tXJQtpuF5evxaTtdPPitxipT5cJDAo4hhZcOmgBXF9c1gDS45ril4vYlxYOA9T8
 +a8FV7D5+3i/FtqCySHWrgwOkxJf6dGeakwIobLZch+3UrYZb0cjW0YSWJhW/C61o/lv
 d3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701853966; x=1702458766;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ff5+UzJ+HzQvyI9Kv5LqVNtPJDYPRZAn3y8IpX5aL58=;
 b=YZWRswdwg/+q7vVtxhjJxIs6kD6/g0hYhJHB+DH43E+p/7P/VeCRiY4qzSoDysqHZS
 eyUiM8914uIoeCsA4OxwAwPPAOAD9MD30k1GLtzXgG7t2rb3x+sl+ilH9/9ihpumfEp1
 7roBNCTkeRsxlCyuGZaH7Psx37aAbZEsyQCtzqhiflgfwJHlDwBwqk3XoOnr7/+Q1mXo
 d56TtWt0E+Cx8IOzHf2yxXP6i1g7XF7zXWWKYm0HsTV+dAG4qFHXyuLG5/46gveT6AM6
 Pc/e/6ZGv8k4vVw8jk/9rQZhQNXzPLEZQps8OPByElgxR6ahV9mo+Lv/6xG0hJqST5IV
 sR/g==
X-Gm-Message-State: AOJu0Yx5jOGCJX3+1Y++lodo04buQIH7JPjAtCMW0wD4DWKbhJmc5QjA
 ZJVIkDF0MXqvXKZfQ8rESbqhFCznJNBvtjl6ckTTIw==
X-Google-Smtp-Source: AGHT+IF0IeDJuQTQHa31o0GrY9n748UF5ySeUAAC+78Y2uK2gEvwmXjDq5q4H7heMWz5QEHQTEqoZpREOkNduuqkEVs=
X-Received: by 2002:a25:2fca:0:b0:db5:4e46:891d with SMTP id
 v193-20020a252fca000000b00db54e46891dmr385828ybv.12.1701853966723; Wed, 06
 Dec 2023 01:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20231205220526.417719-1-robdclark@gmail.com>
 <20231205220526.417719-4-robdclark@gmail.com>
In-Reply-To: <20231205220526.417719-4-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Dec 2023 11:12:35 +0200
Message-ID: <CAA8EJpppdueDRZ+J+X=QVViQNdhdY93TnDRfUyHXE7-AfQM6+w@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/5] drm/msm/adreno: Move hwcg regs to a6xx
 hw catalog
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Dec 2023 at 00:06, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Move the hwcg tables into the hw catalog.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 560 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 558 ---------------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   3 -
>  3 files changed, 560 insertions(+), 561 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

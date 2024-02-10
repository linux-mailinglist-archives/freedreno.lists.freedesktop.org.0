Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB3D8503C3
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 10:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B681C10E5E0;
	Sat, 10 Feb 2024 09:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CkpFPrvG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FF610E5E0
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 09:55:12 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so1414597276.1
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 01:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558911; x=1708163711; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BwKRO335TL12T1ugNIYuUs2JClpMBYM/9p0MgS1ZsMw=;
 b=CkpFPrvGQAMq6DU1Xl7BESY2sdN5b0i4Sq9wew1x/iCGA8OZWER4u79DmqWwNu27V6
 ykBm1OUuHXra6EXul/iYLbze/CnBR9it03CN0LqUj01EkpLAvXJvu7h1JJAXR0Mi9gu5
 fRaDeZgDyb/fZYAnzwPxdGqQuTgSuG4W7WjXTheVMMPn+Cx+9Bmm3b2cR3kVG1qTfFeX
 J/65ka383JYxwDRKBqN5PIivWUgUznxjgxwgS/TK4KrauvohtlhuMYmS38ippgMwSS5Q
 rHYX7nQZC2SDvWD9eiaHCAacv7xd8C0DBmqFnpBi4OylPs7u5TQ06d9LsKa2wu6teGeQ
 ouLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558911; x=1708163711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwKRO335TL12T1ugNIYuUs2JClpMBYM/9p0MgS1ZsMw=;
 b=ukZkNsapGi9krbVHaK0a3oWn6+wCMzZxED7gLq17UemjjRH9GTtW9eE+xpYFZzOFKO
 poSIhQU4w89l7B7/NemDaZ6Nzi/EiYWMNElc0ep+2BHnC18uCu+tmOa+Mz6Is2DWLfKY
 Ex522qCmquEOr/6xV02hwwLl21FGWhX+HtKcoXx5aZxT4OeT4CjhMUal6azhi2lYHcH4
 hbGpmUOJX2ieLDGKrncDXh3KemdBMyp2crdCHpUTmUAvSuyM0gv23dMC6wPpQwWW8njJ
 OlMQuSlN75nXoV0Ul/HI6ozmthZ1/JYID7X6MaaL+33P5YFRtmE+HmH/LHvyHguHmq/y
 2IfA==
X-Gm-Message-State: AOJu0YyoqAIySCFz75Xkx2TTaqqpd3WCmHo2fepPzEaG1gPzHmrSR7yr
 OKZDGEhqRCByEwG2e2d7/jK+tdTQ6VKr5TCTTmuCjhIWJd1j4Fyr0N6bDok5rmbTmfX06zdEONd
 7CJnm1Qgx/dMxr+NpMWe7HokHja3eJxeK63tKFQ==
X-Google-Smtp-Source: AGHT+IGHSanBc/5P0KYgb1X3eLxidccmytEEnZo/ritl6ETykacuJJJ7mViK1X+VYMRMhGiedJA+mXbN9stbHWSubxk=
X-Received: by 2002:a25:6954:0:b0:dc6:f0ac:6b74 with SMTP id
 e81-20020a256954000000b00dc6f0ac6b74mr2845262ybc.15.1707558911270; Sat, 10
 Feb 2024 01:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-13-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-13-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:55:00 +0200
Message-ID: <CAA8EJppppDiaQdEzX7WnFA8rFJQBTHJUQq4o6kZtfzTm5Y=nnA@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] drm/msm/dp: move parity calculation to dp_utils
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Parity calculation is necessary for VSC SDP implementation. Therefore
> create new files dp_utils.c and dp_utils.h and move the parity
> calculating functions here. This ensures that they are usable by SDP
> programming in both dp_catalog.c and dp_audio.c
>
> Changes in v2:
>         - Create new files dp_utils.c and dp_utils.h
>         - Move the parity calculation to these new files instead of
>           having them in dp_catalog.c and dp_catalog.h
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile      |   3 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c | 101 +++++-------------------------
>  drivers/gpu/drm/msm/dp/dp_utils.c |  71 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h |  22 +++++++
>  4 files changed, 110 insertions(+), 87 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

[skipped]

> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> new file mode 100644
> index 0000000000000..c062e29d07898
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DP_UTILS_H_
> +#define _DP_UTILS_H_
> +
> +#define HEADER_BYTE_0_BIT       0
> +#define PARITY_BYTE_0_BIT       8
> +#define HEADER_BYTE_2_BIT       0
> +#define PARITY_BYTE_2_BIT       8
> +#define HEADER_BYTE_1_BIT      16
> +#define PARITY_BYTE_1_BIT      24
> +#define HEADER_BYTE_3_BIT      16
> +#define PARITY_BYTE_3_BIT      24

Nit: it is usually 0-1-2-3 rather than 0-2-1-3.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +
> +u8 dp_utils_get_g0_value(u8 data);
> +u8 dp_utils_get_g1_value(u8 data);
> +u8 dp_utils_calculate_parity(u32 data);
> +
> +#endif /* _DP_UTILS_H_ */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D69F38EB
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 19:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE4710E757;
	Mon, 16 Dec 2024 18:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RjghAhZK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E67010E757
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 18:28:34 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-6efea3c9e6eso31670707b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 10:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373713; x=1734978513;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
 b=RjghAhZKmDRNBYCHUXzycX9Gr6Avl6uCgipbCyiy/A6IjwyjRCHd3sAr79yWPpzz4+
 JWlvNEwonxrQz7ajNjqiFJBA+57Q3gZnMPh0A6lYG2CFeMLJFaKEb4eW+ZxBUAom5VLj
 WhzV6MgKLFSqPMhu8PhsRSL407sp+8psfRYyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373713; x=1734978513;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rO0fP7kC0ChLCdFf2h9Dk5fHEcQ84J84WudIRLZjttI=;
 b=BR5D7HrsR9FW8rg7MBshXeQaSUt5Tx6IsMIaUoVGVvn/pZuIe8EMycUtcTgXBjPhLP
 y2iCR8yP8Ll3Ro5gObtkBexmGMVqoB/EK7d4hfKMcFOqNDdz1g+EiHMW+93KWWC5QqPI
 zQfRHv0RPzCOJpzuZmJnJZfOHcAvf6yGiG3eTix4l1R18j9Ur3DS9Ve4rNT8tGta6L1i
 AhCkU4Xwm5KZ9KwbTRIGC3Nmx+m070N385tOf2TbVXAIKxooqI78bQCgq7DCEpZ8HY3P
 CjL4ZpaCAxsJtJ55F2OKSq0V1Y8Km9K63WGqZoZKU7A/oreOg2zoNHEywyezZKQIVGJ2
 MrSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLfr+GSnfZuRRdLiwpROCMJUWp3CM87ghOMyY/4NhMOK93GGhGCKjiuwJoWLnJpqJhr15n0wW8b+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0z9IFkm0P2gG6D/2sFAe40GjQiCogopRc9qBQj0z0v8Rw6+LF
 qHngRFaonLvYvI8FajQjtFgj8QbLxcZAY4b+/fWF1QNBttP/+sLAxO5AfUg65r/946rig296yGh
 +M2ig9PGAFzL6mHzFyisRmrSWIsVFt1AECrZR
X-Gm-Gg: ASbGncv2YZOcbqAulqr+UFx6Tyi8mOyeL5Yn9P4DKuOWYbVF1Zt6h/deTP4KFMlViOX
 +iayaW1KV3u/F1kSg/cd/adjGlBZQ0nayAk8U3otfJgXnwuTUp3T1KnLeFioF5GIm7w==
X-Google-Smtp-Source: AGHT+IE4CdB36DYH9vipsU7nBQzIha3QX2anHYVsV1wQT8Ge+vTgkTSbipalEX/mJfncpySK3J6yzUz+Iw2WBcHVy54=
X-Received: by 2002:a05:690c:6408:b0:6ef:6d61:c249 with SMTP id
 00721157ae682-6f2bb3a54c2mr8410207b3.39.1734373713619; Mon, 16 Dec 2024
 10:28:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:28:33 -0800
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:28:32 -0800
Message-ID: <CAE-0n52uH4q5=QbU7V1jvRmvccAWTF1bOSXZ32j2NxKEKQVhMQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:07)
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
